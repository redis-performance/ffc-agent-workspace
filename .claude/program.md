# ffc.h Optimization Playbook

Agent-readable catalogue of optimization techniques for CPU float/integer parsing,
organized by tier and expected throughput gain. Inspired by AutoKernel's program.md.

Read this before each experiment to choose the next technique to try.
After profiling, use the **Bottleneck Classification** section to pick the right tier.

> **Two competitors.** These tiers are parser-agnostic — apply them to whichever
> of `ffc` or `fast_float` you are targeting this experiment (see `experiments/RACE.md`
> for who's behind). The symbol names below are ffc's; fast_float's equivalents live in
> `fast_float/include/fast_float/` — `ascii_number.h` (digit scan / SWAR),
> `parse_number.h` (dispatch + Clinger), `digit_comparison.h` (slow path),
> `float_common.h` (tables / Eisel-Lemire). A technique that wins on one parser is a
> prime **cross-pollination** candidate for the other.
>
> **fast_float correctness gate** (replaces the `make -C ffc …` stages when the
> target is fast_float):
> ```
> scripts/test-fast_float.sh                 # core unit tests + supplemental corpus
> EXHAUSTIVE=1 scripts/test-fast_float.sh    # + exhaustive (mantissa-loop changes)
> ```
> Both compile under fast_float's strict `-Werror -Wall -Wextra -Weffc++ -Wconversion`.

---

## Bottleneck Classification

Run `scripts/run-profile.sh` and classify the result before choosing a tier:

| Profile Signal | Bottleneck Type | Go to Tier |
|---------------|-----------------|------------|
| `ffc_parse_mantissa` or digit-scan loop is hottest | **Input scanning** | 1 |
| `ffc_digit_comp` > 5% on random inputs | **Slow-path fallback** | 2 |
| Branch miss rate > 3% | **Branch-heavy hot loop** | 3 |
| IPC < 2.0, cache miss rate < 1% | **Instruction throughput** | 4 |
| Cache miss rate > 2% or L1/L2 evictions high | **Memory / cache layout** | 5 |
| IPC < 1.5 on short inputs (mesh.txt) | **Per-call overhead** | 6 |

When unsure, start at Tier 1 — digit scanning dominates most profiles.

---

## Tier 1 — Input Scanning (expected: 10–30%)

The mantissa digit loop is almost always the hottest region. These techniques
reduce the cost of consuming ASCII digit characters.

### 1a. SWAR 8-byte digit scan (portable, no intrinsics)
Load 8 bytes at once as `uint64_t`, test all 8 with bitmask arithmetic:
```c
// All bytes in [0x30, 0x39]?
uint64_t v = *(uint64_t*)p;
uint64_t lo = v - 0x3030303030303030ULL;
uint64_t hi = 0x3939393939393939ULL - v;
// if (lo | hi) has no high bit set in any byte → all are digits
```
Extract digit values with `v - 0x3030303030303030ULL` after the check.
This replaces 8 branches with 4 arithmetic ops + 1 test.

### 1b. SWAR 4-byte scan (when < 8 digits remain)
Same pattern with `uint32_t` for the tail.

### 1c. Unroll the digit loop by 4
If the compiler isn't unrolling, explicitly unroll: read 4 digits at a time,
accumulate with `val = val * 10000 + d3*1000 + d2*100 + d1*10 + d0`.
Reduces loop-carried dependency chain length.

### 1d. SSE2 / NEON parallel digit check (x86 / ARM, 16 bytes at once)
Check 16 ASCII bytes in parallel: `_mm_cmpge_epu8` / `vcgeq_u8` against `0x30`
and `_mm_cmple_epu8` / `vcleq_u8` against `0x39`. Pack valid digits and count.
High ceiling but adds SIMD complexity.

### 1e. Remove redundant bounds checks inside the loop
If `end - p >= 20` is checked once before entry, inner loop doesn't need
a `p < end` guard per byte. Enables tighter code generation.

---

## Tier 2 — Fast-Path Hit Rate (expected: 5–20%)

The Eisel-Lemire fast path only works when the mantissa fits in 64 bits and the
exponent is in range. `ffc_digit_comp` appearing in profiles means too many inputs
fall to the slow bigint path.

### 2a. Widen the fast-path mantissa threshold
Eisel-Lemire fails when the mantissa has > 19 significant digits. Some 20-digit
inputs are representable — check whether tightening the `num_digits` guard
lets more inputs through without changing the result.

### 2b. Pre-normalize mantissa before the fast-path check
Trailing zeros in the fractional part inflate `num_digits`. Strip them before
the significant-digit count to widen the fast-path eligibility window.

### 2c. Inline the slow-path entry check
The branch deciding fast vs slow path may be suboptimally compiled. Mark the
slow-path branch `__builtin_expect(false)` / `[[unlikely]]` to push it out of
the hot loop and improve branch predictor training on the fast path.

---

## Tier 3 — Branch Elimination (expected: 5–15%)

Hot loops with unpredictable branches (sign detection, decimal point, 'e'/'E')
are cheap to make branchless.

### 3a. Branchless sign detection
```c
// instead of: if (*p == '-') { neg = true; p++; }
int neg = (*p == '-');
p += neg;
```

### 3b. Branchless decimal point consumption
```c
int has_dot = (*p == '.');
p += has_dot;
```

### 3c. Unified digit-or-dot check
Combine the "is this a digit?" and "is this a dot?" checks into a single
subtraction + compare to avoid two branches per character.

### 3d. Lookup-table dispatch for 'e'/'E' / '+'/'-'
Replace chains of `if (c == 'e' || c == 'E')` with a 256-entry byte table
that maps each ASCII value to a tag. One load + compare vs multiple branches.

---

## Tier 4 — Instruction Throughput (expected: 3–10%)

When IPC is low but neither branches nor cache is the culprit, the issue is
instruction latency or port pressure.

### 4a. Break mantissa accumulation dependency chain
`val = val * 10 + digit` creates a loop-carried dependency through multiply.
Restructure as Horner with larger base:
```c
// Two independent chains, merged at end:
uint64_t even = 0, odd = 0;
even = even * 100 + digit[0]*10 + digit[1];
odd  = odd  * 100 + digit[2]*10 + digit[3];
val = even * 100 + odd;  // merge every 4 digits
```

### 4b. Precompute powers-of-10 table access pattern
Ensure the `powers_of_ten_float` / `powers_of_ten_double` table is accessed
sequentially or predictably to allow prefetcher to warm it.

### 4c. Avoid redundant type conversions
Repeated integer→double casts in the adjustment loop are expensive on some
microarchitectures. Accumulate in integer until the final conversion.

---

## Tier 5 — Memory / Cache Layout (expected: 3–8%)

### 5a. Align power-of-10 lookup tables to cache line
If `ffc_powers_of_ten_float` or `ffc_mantissa_64` straddles a cache line,
tag them `__attribute__((aligned(64)))`.

### 5b. Group hot read-only tables in one translation unit
Co-locating `mantissa_64`, `powers_of_five_128`, and `power_of_ten_components`
in the same .o section increases the chance they share L1/L2 cache lines
during steady-state parsing.

### 5c. Mark cold functions `__attribute__((cold))`
The bigint fallback, overflow handlers, and inf/nan parsers are rarely called.
Marking them cold moves their code out of the hot I-cache footprint.

### 5d. Pack ffc_result to avoid padding
Verify `ffc_result` (ptr + outcome) has no unexpected padding bytes; smaller
return struct = fewer registers used at call sites.

---

## Tier 6 — Per-Call Overhead (expected: 2–8% on short inputs)

Most visible on mesh.txt (very short floats — 3–7 chars each).

### 6a. Inline ffc_from_chars_double into ffc_parse_double
If the public API wrapper adds call overhead, mark it `static inline` or
`__attribute__((always_inline))`.

### 6b. Early-exit for single-digit / two-digit inputs
Inputs like "0", "1", ..., "9" can return immediately without entering the
full mantissa loop. Profiles with mesh.txt often show this matters.

### 6c. Reduce stack frame in the hot path
If `ffc_compute_float64` spills to the stack, check for unnecessary local
variables or arrays. Reducing spills = fewer load/store instructions.

---

## Known Non-Starters (do not retry)

Document failed experiments here as they are discovered. Starting empty.

| Technique | Why it didn't work |
|-----------|--------------------|
| 2-digit SWAR in `ffc_loop_parse_if_eight_digits` (EXP-014) | Bloats the inlined function; compiler degrades register allocation for the entire hot path. i/f INCREASED despite saving byte-by-byte iterations. Same root cause as EXP-002. |
| 2-digit SWAR + integer SWAR (EXP-002) | −18% regression; function bloat / inlining budget exceeded. |
| __builtin_expect hints on 4 hot branches (EXP-004) | −7.2% ARM canada; hints misled branch predictor. |
| ffc_cold on infnan/digit_comp (EXP-010) | −13.7% ARM mesh; cold annotation pulled hot-path shared code out of icache. |
| Remove fraction_part_start from ffc_parsed (EXP-011) | −10.7% ARM mesh; GCC DSE optimization depends on this field's presence. |
| Cache ffc_rounds_to_nearest() in local var (EXP-008) | −1.2% x86 random; compiler already hoists effectively; local cache adds load. |
| **[fast_float]** FASTFLOAT_ASSUME_ROUNDS_TO_NEAREST compile-time macro (EXP-051) | GCC canada −2.8%; removing the volatile probe cut i/f but raised c/f — GCC used the load to hide latency. Compile-time rounding assumption does NOT transfer from ffc to fast_float. |
| **[fast_float]** exp==0 / pre-fast-path checks before Clinger (EXP-055) | Clang random −3.6%. Adding ANY pre-check before fast_float's Clinger/Lemire dispatch regresses Clang random (the canonical datasets are fractional, exp≠0, so the check never fires but costs a branch on a finely-balanced hot path). Mirrors ffc EXP-021/025. |
| **[fast_float]** fraction-tail nested-if unroll (EXP-054) | GCC random −2.1%, canada −1.5%. After the SWAR 8-block loop + 4-digit follow-up the residual fraction tail is only 0-3 digits; extra branches cost more than they save. (Note: integer-part and 8/4-digit-block unrolls DO transfer well — EXP-050/052/053. It's the *post-SWAR byte tail* that doesn't.) |
| **[fast_float]** combined Clinger exponent range check (EXP-056) | GCC canada −25.4% codegen cliff. |
| **[fast_float]** fused no-span fast path / `store_spans` template elision (EXP-057) | The `parsed_number_string_t` sret-marshaling cost is real (PGO recovers −23% i/f), but skipping the integer/fraction span stores on the hot path does NOT extract it to portable source. The `store_spans=true/false` split forces two full `parse_number_string` instantiations (icache) + inlined slow-path re-dispatch; clang wins canada/random (+5.9%/+3.2%) but **mesh regresses −8.6% clang / −6.1% gcc and gcc regresses all three datasets** (drift-controlled, ffc-control flat). mesh's tight short-float loop is where fixed dispatch/icache cost beats the shrinking marshaling saving. Reviewer-panel Designs A/B/C all closed. **Marshaling needs PGO (codegen-level), not a source change — do not re-attempt span-elision or struct-slimming.** |

> **fast_float meta-finding (EXP-050–056):** ffc's **digit-scanning** ports transfer
> to fast_float and win (integer-scan unroll, 2x SWAR, 4-digit follow-up: EXP-050/052/053).
> ffc's **compute/Clinger/rounding-path** ports all regress fast_float (EXP-051/055/056)
> — fast_float's dispatch is differently balanced and GCC is especially fragile there.
> Future fast_float work: stay in `ascii_number.h` digit scanning; avoid `parse_number.h`
> fast-path edits unless profiling isolates a specific compute hotspot.

> **MEASUREMENT BUG — measure base vs patch back-to-back in the SAME session.**
> Comparing a patch against a baseline benchmarked in a *prior* session is unsafe: on
> the metal box the baseline itself drifts ~2-3% between sessions (mesh-gcc especially).
> EXP-050 was originally reported as "+34% gcc mesh" by comparing against a stale
> low-outlier baseline (369 MB/s); a same-session base-vs-patch re-measurement gave the
> true, reproducible result: **canada ~+3%, mesh ~+5%, consistent across gcc AND clang**
> (random flat — 1-digit integer part). A cross-compiler *divergence* in the delta
> (e.g. gcc +34% vs clang +5% on the same dataset/box) is the tell-tale of a baseline
> or alignment artifact — always re-measure both sides together before believing it.
| Guard 4-digit SWAR with first-byte digit check (EXP-007) | −3.9% ARM mesh; extra branch outweighs SWAR entry savings. |
| Constant-format specialization (EXP-003, EXP-005) | Regressions; specialization prevented cross-call inlining. |
| AArch64 FPCR direct read in rounds_to_nearest (EXP-013, EXP-020) | +0.8–1.0% random, −1.1% mesh; below 2% threshold in both pre- and post-EXP-015 states. MRS FPCR has comparable latency (~3–5 cycles) to FCMP sequence on Graviton4; L1 volatile-float load replaced by equally-latent MRS; net savings ~0–2 cycles. Mesh slight regression suggests MRS disrupts OOO scheduling. Do not retry. |
| Hoist ffc_rounds_to_nearest() before digit scanning (EXP-016) | −0.5% canada regression; GCC already schedules float ops early, or c620 stall is from mantissa dependency (x1 not ready) not float latency; adding bool param through inline chain hurts register allocation. |
| noinline extraction of cold branches (EXP-017) | −2.9% mesh regression; ARM64 ABI requires caller-save register setup around any function call even a never-taken branch; adding noinline disrupts GCC register allocation for the inline body (same root cause as EXP-010). Opposite of EXP-009: never add noinline to functions within the always_inline chain. |
| SWAR + nested-ifs for integer-part digit scanning (EXP-018) | −13.3% mesh, −7.3% canada, −6.1% random; canada/mesh integer parts are 1–3 digits on average so SWAR never fires — the call overhead outweighs the simple while-loop back-branch. Contrast EXP-015 (fraction tail, accepted): there SWAR was called after already consuming 8+ digits, and the nested-ifs handled a genuine tail. Here the entire integer scan is a 1–3 digit "tail". |
| Hoist ffc_b10_to_b2 before UMULH in ffc_compute_float (EXP-022) | OOO processor already speculatively executes b10_to_b2 before branch resolves. Hoisting moves the retire stall from c684→c698 but saves zero cycles. i/f unchanged. The bottleneck is THROUGHPUT (i/f), not latency — IPC=7.1 is near Graviton4's practical ceiling. Do not retry latency-only optimizations for this function. |
| Branchless sign detection `int neg = (*p == '-'); p += neg` (EXP-024) | `cinc x2, x1, eq` creates TRUE data dependency on the first digit pointer (x8 depends on x2 depends on cmp result). CPU cannot speculatively preload the first digit. In baseline, always-not-taken branch (for random) IS the free speculative path. IPC dropped 7.12→6.47 (random), 6.66→5.95 (canada). Do NOT retry sign branchlessness unless the first-digit load is decoupled from the sign pointer. |
| Branchless sign detection using bitwise-OR in `ffc_from_chars_advanced_impl` (EXP-023) | Bitwise `|` in `has_sign & (... | (int)(allow_leading_plus && ...))` forces full evaluation of the `+`-check for ALL floats including unsigned ones, adding ~12 extra i/f. Correct approach: `int neg = (*p == '-'); p += neg;` with NO inline error check (rely on `digit_count==0` downstream). Short-circuit `&&` is critical here — never use bitwise `|` when the right side has side effects or costs. |
| Bit-shift mantissa check `!(mantissa >> (MANTISSA_EXPLICIT_BITS+1))` replacing `movz+cmp` (EXP-027) | `cmp xzr, x1, lsr #53` eliminates the `movz` but removes its OOO pre-execution freedom. For canada (97% Eisel, long mantissa chains), the movz was executing in parallel with digit scanning — effectively free. The inline-shift form delays the comparison until x1 is ready, hurting scheduling. canada −0.8% (IPC 6.75→6.67), mesh +2.8%. Net: REJECT. Do NOT replace `movz+cmp` with inline-shifted compare when the constant has no data dependency. |
| C source ordering trick to start volatile load before integer check inside `ffc_rounds_to_nearest` (EXP-029) | GCC cannot be forced via source ordering to interleave integer and float operations when both appear in the same inlined function and the final result is the same either way. Approach: `float fmini = fmin; if (mantissa > max_mantissa) return false; return (fmini + 1.0f == ...)` — GCC emits FCMP chain first, then mantissa check. The integer movz+cmp is deferred to after the float pipeline. Assembly byte-for-byte identical to baseline (EXP-028). To actually skip FCMP for large mantissa, must restructure the call site so mantissa check happens BEFORE `ffc_rounds_to_nearest()` is called — but EXP-021/025 show this delays the volatile load and regresses mesh. Fundamental impasse: can't skip FCMP for canada without delaying FCMP for mesh. |
| Outer `pns.mantissa <= MAX_MANTISSA_FAST_PATH` guard before Clinger call in `ffc_from_chars_advanced` (EXP-025) | +2.3% random, +0.9% canada, but −17.4% mesh. Adds 3 instructions (mov+cmp+branch) before `ffc_rounds_to_nearest()` volatile load, delaying the 16-cycle FCMP chain by ~3 cycles → +3.18 c/f to mesh critical path. Same root cause as EXP-021. Do NOT add any instructions before the Clinger call on the hot path — mesh always enters Clinger and the FCMP timing is critical. |
| Mantissa check before ffc_rounds_to_nearest() in ffc_clinger_fast_path_impl (EXP-021) | −7.3% mesh, +2.5% random; volatile float load must fire BEFORE mantissa check so the 16-cycle FCMP chain completes in time for Clinger branches (~15 c/f on mesh). Moving mantissa first delays the load by ~3 cycles, pushing FCMP past branch resolution. The c620 13%-stall is a ROB retirement backup (not critical path), so gains from removing FCMP from the ROB are tiny (+0.4% canada). Current ordering is correct for Graviton4 microarchitecture. Do not retry. |
| Precomputed lookup table for ffc_b10_to_b2 (EXP-019) | −5.3% mesh, +0.7% random; 1.3KB int16_t[651] table causes L1 cache aliasing with FFC_DOUBLE_POWERS_OF_TEN (used by Clinger path). Mesh numbers all hit Clinger (never Eisel-Lemire), so the table adds cache pressure with zero benefit for mesh. Even a small .rodata addition can cause set-associative cache conflicts when existing working set is already tight. |
| `(uint32_t)` cast to eliminate `and`/`sxtw` in digit scan (EXP-031) | Changing `(uint8_t)` → `(uint32_t)` in digit extraction swaps `and x0,x0,#0xff` for `sxtw x0,w0` — same instruction count. GCC's VRP cannot prove the result of `*p - '0'` is non-negative when the range check comes from an inlined `ffc_is_integer()` call; it always emits an extension regardless of cast type. The `sub w0, w4, #0x30` serves dual purpose (digit value AND enables `cmp #9; b.hi` check) — cannot remove either instruction without restructuring. Would require `__builtin_assume(digit >= 0)` or completely rewriting the check/extract pattern. |
| `__builtin_unreachable`/`ffc_digit_val` helper + Pattern C unsigned cast to eliminate `sxtw` (EXP-032) | `if (d < 0) __builtin_unreachable()` in a `ffc_digit_val` wrapper and `(uint64_t)(unsigned int)(c - '0')` (Pattern C) both eliminate `sxtw` in isolation (standalone function), but GCC's inliner loses the type annotation during RTL lowering — the `sxtw x0, w0` at c684/c6ac/c6d4 remains unchanged in all variants. i/f stays exactly 93.86. Root cause: GCC inserts SIGN_EXTEND at RTL level for `int → int64_t` widening before VRP range refinements apply in the inline body. GCC uses `smaddl` (signed MADD-long) because C types are `int64_t`; switching to `uint64_t` throughout (enabling `umaddl`) would require larger restructure. Do NOT retry any `sxtw`-elimination approach in the existing always_inline digit scan. |

---

## AutoKernel Parallel

This playbook is the ffc.h equivalent of AutoKernel's `program.md` — the
structured technique catalogue the agent reads before each experiment to
decide *what* to try next and *what gain to expect*. Reference:
Jaber & Jaber, arXiv:2603.21331, 2026.

> **fast_float GCC-mesh profile (2026-06-01, race round 2).** Isolated perf on a
> standalone fast_float-only driver (mesh, gcc -O3 -march=native) shows ~74% of time
> in `ascii_number.h:544` (`return answer;` — returning `parsed_number_string_t` by
> value) + `parse_number.h:264` (consuming it in `from_chars_advanced`). It's
> **struct marshaling / GCC stack spills**, not parsing or Clinger math (<1.5% each).
> The gap vs ffc on short inputs is STRUCTURAL (ffc fuses parse+compute; fast_float
> materializes a fat intermediate struct with slow-path-only spans). Fixing it needs a
> core interface change — invasive, high cross-matrix regression risk. Not a safe
> micro-opt. Logged so future sessions don't re-profile to the same wall.

> **gcc-mesh SRA fix — REJECTED (2026-06-01, empirical).** Tried using locals instead
> of reading `answer.integer/.fraction` back in the >19-digit path (to let GCC drop the
> struct stores on the fast path). Same-session vs upstream: gcc mesh −0.9%, all cells
> within noise. The spans are STILL stored into the returned struct (slow path needs
> them), so GCC still spills it — removing the readback alone changes nothing. Confirms
> the gcc-mesh gap is a hard wall: only the invasive struct removal could help, and that
> doesn't cross the AArch64 register-return threshold (Agent 3) and is upstream-DOA
> (public API, Agent 5). DO NOT retry cheap variants. The 3 merged PRs were the real wins.

> **ffc table cache-line alignment (Tier 5a) — REJECTED (2026-06-02).** Added
> __attribute__((aligned(64))) to FFC_POWERS_OF_FIVE + FFC_DOUBLE_POWERS_OF_TEN.
> Same-session: all cells within noise (gcc mesh +0.2%, clang mesh −1.2%, rest flat).
> Tables already well-placed; alignment is a non-starter (cf. EXP-019). ffc remains at
> its ARM ceiling. With fast_float digit-scan mined + compute-path wall, the ARM surface
> is exhausted for safe wins on both parsers; next real territory is x86 (m7i / local).

> **x86 GCC 4-digit follow-up — REJECTED (2026-06-02, reliable pinned x86).** Tried
> enabling #382's follow-up for x86 GCC (hypothesis: the gcc-random regression was
> ARM-specific). Pinned local x86: canada +9.3%, mesh +1.8%, but **random −5.0%** —
> the same regression as ARM gcc. The follow-up's mere presence bloats gcc's hot-loop
> codegen (the check never fires on random's 1-digit tail). Confirms the gcc-random
> regression is architecture-independent → #382's clang-gate is correct on all
> platforms. (Note: local x86 is now reliable via taskset core-pinning, ±0.3%.)

> **noinline 4-digit follow-up — REJECTED hard (2026-06-02).** To dodge the gcc inline
> bloat, moved the follow-up into a noinline helper: x86 gcc random −24.7%, canada
> −11.4%, mesh −18% (call overhead per number + un-inlined SWAR dwarf any benefit).
> Conclusion: the follow-up must inline (canada/mesh benefit) but inlining bloats gcc
> random — no middle ground. #382's clang-gate is optimal. The gcc 4-digit follow-up
> avenue is permanently closed.

> **fast_float acc10 shift-add asm (ffc EXP-039/042 port) — REJECTED (2026-06-02).**
> FASTFLOAT_ACC10 clang/aarch64 add+lsl for the integer/fraction/exponent accumulators
> failed the gcc -Werror gate (the uint64_t cast narrows the int64_t exponent under
> -Wsign-conversion). Also fundamentally non-upstreamable: inline asm breaks fast_float's
> constexpr path. Even race-only it's marginal (acc10 saves ~1cyc on short accumulations).
> Don't retry — fast_float's strict warnings + constexpr make inline-asm tricks unviable.

> **x86 fraction-tail unroll (EXP-054 on x86) — REJECTED (2026-06-02).** Pinned x86:
> gcc +1.3% (sub-2% threshold), clang −1.1%/−4.2% regression. Doesn't transfer to x86.

> **x86 combined-exp-check (EXP-056 on x86) — REJECTED (2026-06-02).** Pinned x86: all
> cells within noise (the ARM −25% gcc cliff does NOT occur on x86, but it's merely
> neutral — no win). ARM-rejected compute-path ports don't become x86 wins; both
> surfaces are at the same frontier.

> **x86 SSE2 16-byte char digit-scan — REJECTED (2026-06-02).** Added an SSE2 path to
> consume 16 char digits/iter. Correct (gate passed) but SLOWER on pinned x86: gcc
> random −5.7%/mesh −7.1%, clang random −2.9%. The scalar read8_to_u64 + magic-multiply
> parse_eight_digits beats SSE's per-iter setup (load/cmp/movemask/extract) for char —
> confirming upstream's deliberate "scalar is better for char" choice, still true on
> modern x86 (Core Ultra). SIMD char digit-scan is a non-starter.

> **Extracting PGO → source (2026-06-02).** PGO's fast_float win is a −23% i/f drop
> (canada 263.6→203.3) with branch-misses FLAT (13.2→12.5) — i.e. the optimizer
> eliminates hot-path work (selective inlining + struct scalarization), NOT branch
> prediction. Cheap source proxies fail to capture it: `__attribute__((flatten))`
> REGRESSES −0.4..2.0% (bloats by inlining the slow path indiscriminately); branch
> hints are irrelevant (bm/f flat; cf. ffc EXP-004). The ONLY source-extractable form
> is the targeted #384 fused parse→compute path. PGO is empirical proof that fusion is
> worth ~20%.

> **Fusion prototype — span-marshaling cost MEASURED (2026-06-02).** Diagnostic: removed
> the answer.integer/.fraction stores from parse_number_string (breaks slow path; valid
> for fast-path datasets). Pinned x86: gcc +3.6..5.6%, clang +3.2..9.7% (clang canada
> +9.3%, mesh +9.7%). Confirms eliminating the span marshaling on the fast path is worth
> +3-10% as a SOURCE change — validating the #384 fused/slim-struct refactor. Proper impl
> must preserve spans for the slow path (re-derive in digit_comp, or fuse clinger before
> the struct). This is the genuine source extraction of (part of) the PGO win.
