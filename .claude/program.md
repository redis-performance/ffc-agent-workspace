# ffc.h Optimization Playbook

Agent-readable catalogue of optimization techniques for CPU float/integer parsing,
organized by tier and expected throughput gain. Inspired by AutoKernel's program.md.

Read this before each experiment to choose the next technique to try.
After profiling, use the **Bottleneck Classification** section to pick the right tier.

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

---

## AutoKernel Parallel

This playbook is the ffc.h equivalent of AutoKernel's `program.md` — the
structured technique catalogue the agent reads before each experiment to
decide *what* to try next and *what gain to expect*. Reference:
Jaber & Jaber, arXiv:2603.21331, 2026.
