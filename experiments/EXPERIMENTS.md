# Experiments Log — ffc.h Parsing Optimization

Append-only. Every experiment gets an entry — wins, rejections, and parks alike.
Knowing what didn't work is as valuable as knowing what did.

Use `approaches/TEMPLATE.md` to copy-paste the structure.

---

<!-- Append new experiments below in reverse-chronological order (newest first) -->

## EXP-035 — 2026-05-27 — `ffc_acc10` inline asm: replace Clang/AArch64 `smaddl` with `add+lsl` for digit accumulation

**Status**: REJECTED — Clang improved +0.5-2.3% but GCC regressed −5.3% canada; hypothesis wrong

### Hypothesis

On AArch64, Clang emits `smaddl` (3-cycle latency on Neoverse V2) for `i * 10 + digit`,
while GCC strength-reduces to `add + add lsl #2 + add lsl #1` (2 × 1-cycle). This creates a
2× latency difference in the digit accumulation critical path, explaining the 28% Clang-vs-GCC gap.
Fix: add `ffc_acc10(i, digit)` with inline asm for `__aarch64__ && __clang__`.

### Changes

**`ffc/src/common.h`**: Added `ffc_acc10()` after `ffc_is_integer()`:
```c
ffc_internal ffc_inline uint64_t ffc_acc10(uint64_t i, uint64_t digit) {
#if defined(__aarch64__) && defined(__clang__)
  uint64_t t = i;
  __asm__("add %0, %0, %0, lsl #2\n\t"
          "add %0, %1, %0, lsl #1"
          : "+r"(t) : "r"(digit));
  return t;
#else
  return i * 10 + digit;
#endif
}
```

**`ffc/src/parse.h`**: Replaced 8 `i * 10 + digit_expr` sites with `ffc_acc10(i, digit_expr)` —
4 in integer scan nested-ifs, 1 in while loop, 3 in fraction tail.

### Root Cause Analysis

Investigation before benchmarking confirmed:
- Clang generates `smaddl x11, w11, w26, x12` (3-cycle latency) for each digit
- GCC generates `add+lsl` (1-cycle latency)
- `ffc_acc10` inline asm forces `add+lsl` on Clang/AArch64 (verified in assembly output)
- After fix: Clang binary shows 16 `add+lsl` + 4 remaining `madd` (was 9 `smaddl`/`madd`)

**Confounding issue discovered**: `benchmark.cpp` includes `"ffc.h"` which resolves to
`benchmarks/ffc.h` (relative, shadowing the include path). Had to copy updated ffc.h to
both `benchmarks/ffc/ffc.h` AND `benchmarks/ffc.h`.

### Results — ARM Graviton4 (m8g.metal-24xl, Clang 18.1.3 vs GCC 13.3.0)

| Compiler | Dataset | EXP-034 baseline | EXP-035 | Δ% |
|----------|---------|-----------------|---------|-----|
| Clang | random | 1388 | 1395 | **+0.5%** |
| Clang | canada | 1334 | 1365 | **+2.3%** |
| Clang | mesh   | 1344 | 1355 | **+0.8%** |
| GCC   | random | 1927 | 1909 | −0.9% (noise) |
| GCC   | canada | 1737 | 1644 | **−5.3% REGRESSION** |
| GCC   | mesh   | 1727 | 1723 | −0.2% (noise) |

Perf stat (total benchmark run, all parsers):
| Metric | Clang | GCC |
|--------|-------|-----|
| IPC | 4.73 | 4.85 |
| stall_backend | 2.09B | 1.72B (+22% for Clang) |
| stall_backend_mem | 15M | 13M (similar) |
| br_mis_pred | 61M | 81M (GCC has MORE mispredictions) |
| L1I cache refill | 2.0M | 1.6M (+29% for Clang) |

### Why the Fix Didn't Work

1. **Wrong primary bottleneck**: The smaddl latency was ~5% of total cycles. Backend stalls
   (2.09B vs 1.72B = +22%) suggest multiple long dependency chains across the whole parser,
   not just digit accumulation.

2. **GCC regression**: Wrapping `i * 10 + digit_expr` in `ffc_acc10(i, digit_expr)` forces the
   `digit = *p - '0'` subtraction to be pre-computed before the function call. GCC was
   optimizing `i * 10 + (*p - '0')` as a unit (using `smaddl` for the whole expression then
   subtracting 48 off the critical path). Post-wrapper, GCC must do `sub; madd` sequentially,
   adding the sub to the accumulator critical path. Effect: −5.3% on canada where integer parts
   exercise the nested-ifs heavily.

3. **Clang improvement too small**: +0.5-2.3% vs 37% Clang-GCC gap — digit accumulation isn't
   the primary driver.

### What IS the bottleneck?

The 22% more backend stalls in Clang (vs GCC) are NOT from memory (mem stalls similar) and NOT
from branch prediction (GCC has more mispredictions). The stalls are execution-unit dependency
chains. Clang has 29% more L1I misses, suggesting worse instruction cache utilization.

The real gap is IPC (5.89 Clang vs 7.12 GCC for ffc specifically) — GCC achieves higher
parallelism even with more branch mispredictions. Next direction: compare the full ffc_parse_double
disassembly section by section to identify where GCC achieves better ILP.

### Decision

**REJECTED** — GCC regression (−5.3% canada) disqualifies. The smaddl hypothesis was wrong.
Reverted `ffc/src/common.h` and `ffc/src/parse.h` to HEAD.

---

## EXP-034 — 2026-05-27 — Compiler sweep: GCC 13 vs Clang 18 vs GCC -mcpu=native on ARM Graviton4

**Status**: REJECTED — GCC 13 + `-march=native` is already optimal; no build config change needed

### Hypothesis

GCC 13 + `-march=native` + `-DFFC_ROUNDS_TO_NEAREST` is the best compiler configuration
for ffc on ARM Graviton4 (Neoverse V2). Three alternatives were tested:

1. **GCC `-march=native`** (corrected baseline): `-DFFC_ROUNDS_TO_NEAREST` was missing from the
   ARM VM's build script, so previous ARM benchmarks (EXP-033: 1820/1673/1656 MB/s) understated
   performance. The true baseline with the macro enabled is ~1927/1737/1727 MB/s.
2. **Clang 18 `-march=native`**: LLVM's AArch64 backend has a dedicated Neoverse V2 scheduling
   model; expected to match or beat GCC.
3. **GCC `-mcpu=native`**: adds µarch scheduler model on top of ISA — expected to give
   marginal improvement over `-march=native`.

### Results

| Variant | random ffc | canada ffc | mesh ffc | random ffc i/B | mesh ffc IPC |
|---------|------------|------------|---------|----------------|--------------|
| GCC 13 `-march=native` | **1927** | **1737** | **1726** | 9.96 | 7.04 |
| Clang 18 `-march=native` | 1388 | 1334 | 1344 | 11.27 | 6.64 |
| GCC 13 `-mcpu=native` | 1928 | 1737 | 1743 | 9.96 | 7.12 |

### Decision

**REJECTED.** GCC wins by a large margin. Clang 18 is **−28%/−23%/−22%** worse on
random/canada/mesh. The perf counters explain why: Clang generates 13.19 i/B vs GCC's
10.90 i/B for mesh (+21% more instructions) at lower IPC (6.64 vs 7.04). Clang appears
to miss a fold or inlining optimization that GCC finds in the hot Clinger/EL path.
Notably, Clang generates *better* code for fastfloat (+17%/+15%/+67% vs GCC fastfloat),
confirming this is ffc-specific, not a general C quality difference.

`-mcpu=native` vs `-march=native` is indistinguishable (within ±0.5% noise). No change.

**Bonus finding:** The ARM VM's `build-bench.sh` was missing `-DFFC_ROUNDS_TO_NEAREST`.
All previous ARM benchmarks (EXP-028 through EXP-033) were measured without EXP-030's
compile-time macro benefit. Corrected ARM baseline: **1927/1737/1727 MB/s**.

Bench results: `experiments/EXP-034/bench-results/`
Proposals: `experiments/EXP-034/proposals/20260527-110759/`

### Lessons

- ffc's C-style code (struct-heavy, macro-heavy) optimizes significantly better under GCC
  than Clang on AArch64. Future experiments should continue targeting GCC.
- The `-DFFC_ROUNDS_TO_NEAREST` flag must be verified present in all benchmark builds.
  Add a check to `run-bench.sh` or document it in `build-bench.sh`.

---

## EXP-033 — 2026-05-27 — Early exit for `exponent == 0` in `ffc_from_chars_advanced`

**Status**: ACCEPTED (+12.9% mesh, +1.1% canada, +0.4% random)

### Hypothesis

For pure integers (no decimal point, no exponent), `pns.exponent == 0` and the Clinger path
performs: exponent range check (3 instr) + mantissa check (4 instr) + scvtf (latency) + adrp +
add + add (3 instr) + ldr pow10[0]=1.0 + fmul with 1.0 (latency) + fneg + cmp + fcsel = ~16
instructions. The `fmul with 1.0` is mathematically a no-op. ~55% of mesh.txt (40619 of 73019
numbers) are pure integers. An early exit before the Clinger call can skip all 16 instructions
for these numbers.

**Key enabler:** EXP-030 eliminated the volatile FCMP chain via `FFC_ROUNDS_TO_NEAREST`. Before
EXP-030, EXP-025 showed that adding 3 instructions before Clinger delayed the 16-cycle FCMP
chain and caused -17.4% mesh regression. With EXP-030, there is no FCMP chain; the cost of
adding instructions before Clinger is bounded by branch prediction (predictable once the
benchmark warms up).

### Implementation

Added in `ffc_from_chars_advanced` before the Clinger call:
```c
if (!pns.too_many_digits && pns.exponent == 0 &&
    pns.mantissa <= ffc_const(vk, MAX_MANTISSA_FAST_PATH)) {
    ffc_set_value(value, vk, pns.mantissa);
    if (pns.negative) { ffc_set_value(value, vk, -ffc_read_value(value, vk)); }
    return answer;
}
```

### Result

| Dataset | Baseline (EXP-030) | EXP-033 | Δ% |
|---------|--------------------|---------|----|
| mesh.txt | 1536 MB/s, 93.86 i/f, 13.4 c/f | 1735 MB/s, 83.92 i/f, 11.84 c/f | **+12.9%** |
| canada.txt | 1718 MB/s, 189.93 i/f | 1737 MB/s, 190.70 i/f | **+1.1%** |
| random [0,1] | 1924 MB/s, 221.04 i/f | 1931 MB/s, 219.04 i/f | **+0.4%** |

All unit tests (test_runner) and supplemental tests (~5.4M vectors) pass.

### Analysis

For mesh: i/f dropped from 93.86 to 83.92 (−10.6%, saves ~10 instructions per pure-integer
call). c/f dropped from ~13.4 to 11.84 (−11.6%). IPC slightly improved to 7.09 from 7.01.

For canada/random: the early-exit check adds ~2 instructions that always fail (branch
always-not-taken), but OOO execution hides these because: (1) the branch is 100% predictable
as "not taken" for canada/random, (2) no data dependency is added to the Clinger computation.
i/f for canada increased by +0.77 (the 2-instruction overhead) but IPC improved to 6.81 from
~6.68. Net MB/s is slightly positive.

### Learning

- After EXP-030 eliminates the FCMP chain, adding a predictable branch before Clinger is SAFE.
  The EXP-025 regression was caused by FCMP timing, not by branch prediction.
- Early-exit for `exponent == 0` effectively gives mesh.txt a dedicated fast path for integer
  parsing, saving ~10 instructions per call × 55% hit rate = 5.5 i/f reduction.
- For datasets with near-100% non-zero exponent (canada, random), the always-not-taken branch
  has essentially zero overhead — OOO + branch predictor hides it completely.

### Correctness fix (2026-05-27)

The initial EXP-033 commit missed the existing `#if defined(__clang__) || defined(FFC_32BIT)`
guard for `mantissa == 0`. Clang may convert `(double)(uint64_t)0` to `-0.0` when
`fegetround() == FE_DOWNWARD`, producing wrong sign for parsing "0" and "0e0". The fix mirrors
the identical guard already present in the non-nearest Clinger branch. Caught by supplemental
test suite. Commit `43e22b3`.

---

## EXP-032 — 2026-05-27 — Eliminate `sxtw` sign-extension in digit scan via `__builtin_unreachable` / unsigned cast patterns

**Status**: REJECTED (i/f unchanged at 93.86 across all sub-attempts; sxtw persists in inline context)

### Hypothesis

The ARM64 integer scan emits `sxtw x0, w0` (sign-extend word to double-word) after each `sub w0,
w4, #0x30` digit extraction. This is redundant for digits in [0,9] but GCC cannot prove non-
negativity from the `ffc_is_integer(*p)` guard. Eliminating 1 `sxtw` per digit across 5 integer
levels = 5 instructions saved → ~5.3% of 93.86 i/f. Three approaches were tried.

**Sub-attempt A**: introduce a `ffc_digit_val` helper with `if (d < 0) __builtin_unreachable()`.

**Sub-attempt B**: change cast to `(uint64_t)(unsigned int)(c - '0')` (Pattern C) — confirmed in
a standalone function to produce 2 instructions with zero-extension rather than sign-extension.

**Sub-attempt C**: combination of Pattern C plus explicit `__builtin_unreachable` at the top of the
inlined body.

### Implementation

All three sub-attempts modified `src/parse.h` integer-scan nested-ifs and fraction tail. Pushed
`ffc.h` amalgamate to ARM VM and measured.

### Result

| Dataset | Baseline (EXP-030) | All sub-attempts | Δ% |
|---------|--------------------|---------|----|
| mesh.txt | 1536 MB/s, 93.86 i/f | 1536 MB/s, 93.86 i/f | **0%** |
| canada.txt | 1718 MB/s, 189.93 i/f | 1718 MB/s, 189.93 i/f | **0%** |
| random [0,1] | 1924 MB/s, 221.04 i/f | 1924 MB/s, 221.04 i/f | **0%** |

Assembly inspection confirmed `sxtw x0, w0` remained at c684, c6ac, c6d4 in all variants.

### Analysis

Standalone tests confirmed Pattern C (`(uint64_t)(unsigned int)(c - '0')`) eliminates `sxtw` when
the function is NOT inlined. The inliner loses the type annotation during RTL lowering: GCC's VRP
tracks `int` ranges but does not propagate the non-negativity proof through `always_inline` call
sites the same way a non-inlined function boundary establishes it. The `sub w0, w4, #0x30`
instruction writes a 32-bit register, and GCC emits `sxtw` to widen it to 64-bit for the
`smaddl x1, w0, w1, x3` multiply-add regardless of upstream range info.

ARM64 zero-extension (writing to `wN` zeroes `xN`) is only guaranteed for GCC-visible zero-
extension expressions; `sxtw` is sign-extension, and GCC always emits it for `int → int64_t`
widening from arithmetic on `char` values unless the narrower operation is a load (where it would
use `ldrb` instead).

### Learning

- In-function `__builtin_unreachable` / `__builtin_assume` for digit range do NOT influence the
  `sxtw` emission in inlined ARM64 code — GCC's RTL-level sign-extend is inserted before VRP
  refinements apply in the inline body.
- Pattern C eliminates `sxtw` in isolated (non-inlined) context; fails in the always_inline chain.
- The `smaddl` vs `umaddl` choice also contributes: GCC uses `smaddl` (signed MADD-long) because
  the C type is `int64_t = int64_t * 10 + int`. Switching to `uint64_t` arithmetic throughout
  might enable `umulh` paths but risks other regressions.
- Do not retry `sxtw`-elimination approaches unless using a fundamentally different accumulation
  structure (e.g., pure `uint64_t` mantissa with `umaddl`).

---

## EXP-031 — 2026-05-27 — `(uint32_t)` casts to eliminate sign-extension instructions in digit scan

**Status**: REJECTED (−0.3% mesh, below threshold; +0.2% canada, +0.5% random)

### Hypothesis

In the ARM64 integer scan and fraction tail of `parse.h`, digit extraction uses `(uint64_t)` and
`(uint8_t)` casts. The `(uint8_t)` cast compiles to `and x0, x0, #0xff` (1 instruction). GCC cannot
prove that `*p - '0'` is non-negative after the `ffc_is_integer` range check because VRP does not
track across the helper function boundary. Changing to `(uint32_t)` should trigger the ARM64 zero-
extension rule (writing a `w` register zeroes the upper 32 bits) and emit no extra instruction.

### Implementation

Changed all digit extraction casts in `src/parse.h` integer scan (lines ~275–293) and fraction tail
(lines ~331–338) from `(uint64_t)` and `(uint8_t)` to `(uint32_t)`.

### Result

| Dataset | Baseline (EXP-030) | EXP-031 | Δ% |
|---------|--------------------|---------|----|
| mesh.txt | 1541 MB/s, 93.86 i/f | 1537 MB/s, 93.86 i/f | **−0.3%** |
| canada.txt | 1718 MB/s, 189.93 i/f | 1721 MB/s, 189.02 i/f | **+0.2%** |
| random [0,1] | 1924 MB/s, 221.04 i/f | 1933 MB/s, 220.04 i/f | **+0.5%** |

### Analysis

Assembly inspection at the digit scan hot path showed GCC changed `and x0, x0, #0xff` →
`sxtw x0, w0` — a different 1-instruction extension, not elimination. The `sub w0, w4, #0x30`
instruction that computes the digit value writes a 32-bit `w` register; GCC could in theory omit
the follow-on extension, but it still emits `sxtw` because it cannot prove the subtraction result
is non-negative without knowing `*p >= '0'` (which comes from the `ffc_is_integer` guard that GCC
treats as an opaque inline function for VRP purposes).

The `sub + sxtw` dual-purpose pattern (sub computes value AND enables the `cmp #9; b.hi` check)
means both instructions are load-bearing; we cannot remove either without restructuring the check.

### Learning

- ARM64 zero-extension rule only fires when GCC *knows* the 32-bit result fits in 32 bits AND
  no sign-extension is needed for the wider type. For `char` arithmetic, GCC conservatively emits
  `sxtw` regardless of range guards outside the subexpression.
- Changing `(uint8_t)` → `(uint32_t)` just swaps `and x0,x0,#0xff` for `sxtw x0,w0`; same count.
- To actually eliminate the extension: would need `__builtin_assume(digit >= 0)` or restructuring
  the check so GCC's VRP can prove non-negativity within the same expression.

---

## EXP-030 — 2026-05-27 — `FFC_ROUNDS_TO_NEAREST` compile-time macro eliminates FCMP chain

**Status**: ACCEPTED (+2.4% mesh, +1.8% canada, +0.8% random)

### Hypothesis

The 7-instruction volatile-float FCMP chain in `ffc_rounds_to_nearest()` (adrp+ldr+fmov+fadd+fsub+fcmp+b.eq,
~14-16 cycles total) is the top profiled bottleneck: 21.78% hotness for mesh, 13.98% for canada.
Runtime workarounds (EXP-021, EXP-029) failed because GCC reorders integer guards relative to
volatile float reads when the final observable result is unchanged.

Compile-time constant `FFC_ROUNDS_TO_NEAREST` macro makes `ffc_rounds_to_nearest()` unconditionally
return `true`. GCC eliminates the entire FCMP chain and the non-round-to-nearest else block.

### Implementation

Added to `src/common.h`:
```c
bool ffc_rounds_to_nearest(void) {
#if defined(FFC_ROUNDS_TO_NEAREST)
  return true;  // compile-time constant: eliminates FCMP chain entirely
#endif
  // ... runtime FCMP chain ...
}
```
Also guarded the `double_rounds_to_nearest()` test with `#ifndef FFC_ROUNDS_TO_NEAREST` since the
test asserts `ffc_rounds_to_nearest() == false` in non-nearest rounding modes, which is unreachable
when the macro is defined. Added `-DFFC_ROUNDS_TO_NEAREST` to `scripts/build-bench.sh`.

### Result

ARM Graviton4 (Neoverse V2, 2.80 GHz):

| Dataset | EXP-028 | EXP-030 | Δ% |
|---------|---------|---------|-----|
| mesh.txt | 1505 MB/s, 100.86 i/f, 13.66 c/f | 1541 MB/s, 93.86 i/f, 13.34 c/f | **+2.4%** |
| canada.txt | 1688 MB/s, 196.02 i/f, 28.84 c/f | 1718 MB/s, 189.93 i/f, 28.33 c/f | **+1.8%** |
| random [0,1] | 1908 MB/s, 227.04 i/f, 30.75 c/f | 1924 MB/s, 221.04 i/f, 30.49 c/f | **+0.8%** |

i/f reduced by 7 on all datasets (FCMP chain gone), c/f reduced by ~0.3-0.5 despite IPC drop
(7.38→7.02 for mesh) because the FCMP stall shadow that was hiding other work is now gone — net
throughput still improves.

### Learning

When the profiler shows a specific instruction cluster dominating cycle budget, the most reliable
fix is to eliminate it at compile time rather than trying to schedule around it at runtime.
The `FFC_ROUNDS_TO_NEAREST` macro approach is the correct pattern: the 7-instruction FCMP chain
existed only for a runtime check that is always true in practice (IEEE 754 default rounding mode).

## EXP-029 — 2026-05-27 — Early mantissa guard in `ffc_rounds_to_nearest` to skip FCMP for large mantissa (canada)

**Status**: REJECTED (no change — identical assembly)

### Hypothesis

For canada.txt, 97% of numbers have mantissa > 2^53 (≥16 significant digits). The current
`ffc_clinger_fast_path_impl` calls `ffc_rounds_to_nearest()` which runs a 16-cycle volatile-load
→ fadd → fsub → fcmp chain, then branches to Eisel-Lemire anyway (mantissa > 2^53 → b.hi → ca28).
The 16-cycle FCMP chain is entirely wasted for these numbers.

By adding a variant `ffc_rounds_to_nearest_fast(uint64_t mantissa, uint64_t max_mantissa)` that
starts the volatile load (L1 latency ~4 cycles) and simultaneously checks `mantissa > max_mantissa`
on the integer unit (~3 cycles), we should be able to skip the FCMP chain and return `false`
immediately for large-mantissa numbers — saving ~13 cycles for 97% of canada numbers.

The integer-unit movz+cmp for the constant `2^53` has no data dependency, so it pre-executes in
parallel with the L1 load. This should save the FCMP chain without penalizing the mesh/random
paths that actually use the Clinger fast path.

### Files changed (reverted — no benefit)

- `ffc/src/common.h`: added `ffc_rounds_to_nearest_fast` after `ffc_rounds_to_nearest`
- `ffc/src/ffc.h`: `ffc_clinger_fast_path_impl` changed to call `ffc_rounds_to_nearest_fast` with
  `MAX_MANTISSA_FAST_PATH` argument

### Implementation

```c
// In common.h — new function:
ffc_internal ffc_inline
bool ffc_rounds_to_nearest_fast(uint64_t mantissa, uint64_t max_mantissa) {
  static float volatile fmin = FLT_MIN;
  float fmini = fmin;                     // volatile load starts immediately (~4 cycle L1 latency)
  if (mantissa > max_mantissa) return false;  // integer check (intended to run in parallel on OOO)
  return (fmini + 1.0f == 1.0f - fmini);
}

// In ffc.h — ffc_clinger_fast_path_impl:
// FROM: if (ffc_rounds_to_nearest()) { if (mantissa <= MAX_MANTISSA_FAST_PATH) { ... } }
// TO:   if (ffc_rounds_to_nearest_fast(mantissa, MAX_MANTISSA_FAST_PATH)) { ... }
```

### Results

**Assembly was byte-for-byte identical to EXP-028.** No benchmark needed — binary sizes:
- EXP-028 baseline: 141328 bytes
- EXP-029 attempt: 142918 bytes (larger due to unused `ffc_rounds_to_nearest_fast` function in binary)

The core `ffc_clinger_fast_path_impl` region (c9bc–cb98) produced identical disassembly. GCC placed
the mantissa check (`cb8c: movz x6; cb90: cmp x1,x6; cb94: b.hi`) AFTER the full FCMP chain
(`c9ec: ldr s1; c9f8: fadd; ca00: fsub; ca04: fcmp`), same as before.

### Decision: REJECTED

No performance change — assembly is identical to EXP-028. Revert immediately.

### Root Cause: GCC Reordering of Non-Volatile vs Volatile

GCC can legally reorder non-volatile integer operations relative to volatile float reads when the
final observable return value is unchanged. The C source order `float fmini = fmin; if (mantissa >
max_mantissa) return false;` appears to start the load first, but GCC inlines the function and
re-schedules: it emits the FCMP chain first (to maximize float pipeline utilization), then the
integer mantissa check afterward.

The key constraint: GCC sees that the return value of the function is determined by (a) the FCMP
result OR (b) the mantissa check — either order produces the same final boolean. It chooses float
first because the float pipeline has higher latency and GCC prefers to start long-latency chains
early. The integer movz+cmp (3 cycles) is fast enough that GCC defers it.

This is a fundamental compiler optimization — no C-level trick that uses a volatile read + integer
check will produce a different schedule for GCC -O2.

### Learning

GCC cannot be forced via C source ordering to interleave integer and float operations when both
appear in the same inlined function body and the final result is the same either way. To actually
skip the FCMP chain for large-mantissa numbers, the only options are:

1. **Architecture-level**: Avoid calling `ffc_rounds_to_nearest()` for the large-mantissa code
   path entirely — restructure the call site so the mantissa check happens BEFORE the function is
   called (at the `ffc_clinger_fast_path_impl` call site, not inside it).
2. **Compile-time constant**: Mark rounding mode as always-round-to-nearest via compile flag
   (`-fno-trapping-math`, build-time `FFC_ROUNDS_TO_NEAREST` macro) and eliminate the volatile
   check entirely.
3. **`asm volatile` fence**: Force ordering with an empty `asm volatile ("" ::: "memory")` between
   the volatile load assignment and the integer check. This prevents GCC from moving the integer
   check across the asm barrier. NOT tried — adds a compiler fence that may hurt instruction
   scheduling on other paths.

---

## EXP-028 — 2026-05-27 — Extend integer nested-ifs to 5 levels (mesh 5-digit integer parts)

**Status**: ACCEPTED

### Hypothesis

Profile of EXP-026 binary (ARM Graviton4) showed `c4a0: add x1, x1, x1, lsl #2` at 2.54%
hotness for mesh.txt — this is the while-loop multiply-by-10 body. The 4-level nested-ifs from
EXP-026 handle 1–4 digit integer parts. Mesh.txt contains 3D vertex coordinates like "12345.678"
(5-digit integer parts). Adding a 5th `if` level would eliminate the while-loop back-branch for
these numbers.

### Files changed

- `ffc/src/parse.h`: extended integer nested-ifs from 4 to 5 levels
- `ffc/ffc.h`: regenerated

### Implementation

```c
// Extended from 4 to 5 levels:
// 1–5 digit integer case (random "0", mesh 1–3 digits, canada 2–3 digits).
// Falls back to while loop for 6+ digits.
if ((p != pend) && ffc_is_integer(*p)) {
  i = (uint64_t)(*p++ - '0');
  if ((p != pend) && ffc_is_integer(*p)) {
    i = i * 10 + (uint64_t)(*p++ - '0');
    if ((p != pend) && ffc_is_integer(*p)) {
      i = i * 10 + (uint64_t)(*p++ - '0');
      if ((p != pend) && ffc_is_integer(*p)) {
        i = i * 10 + (uint64_t)(*p++ - '0');
        if ((p != pend) && ffc_is_integer(*p)) {       // ← new 5th level
          i = i * 10 + (uint64_t)(*p++ - '0');
          while ((p != pend) && ffc_is_integer(*p)) {
            i = (10 * i) + (uint64_t)(*p - '0');
            ++p;
          }
        }
      }
    }
  }
}
```

### Results (ARM Graviton4, m8g.metal-24xl, 2.80 GHz)

| Dataset | Baseline MB/s (EXP-026) | EXP-028 Run 1 | EXP-028 Run 2 | Avg Δ% |
|---------|------------------------|---------------|---------------|--------|
| random [0,1] | 1900, 227 i/f, 30.87 c/f | 1906, 227.04, 30.78 | 1908, 227.04, 30.75 | **+0.4%** |
| canada.txt | 1677, 196 i/f, 29.02 c/f | 1688, 196.02, 28.84 | 1688, 196.02, 28.83 | **+0.7%** |
| mesh.txt | 1394, 101 i/f, 14.75 c/f | 1505, 100.86, 13.65 | 1505, 100.86, 13.66 | **+7.9%** |

All three datasets positive. No regressions. mesh +7.9% far exceeds the ≥2% acceptance threshold.

### Decision: ACCEPTED

+7.9% mesh with zero regressions. The while-loop back-branch for 5-digit integers was a real
bottleneck in mesh.txt. The `c4a0` stall (2.54% of cycles in EXP-026 profile) is eliminated for
the common 5-digit case. Correctness tests (test.c + test_int.c) pass.

### Learning

Extending straight-line unrolling one level at a time is very cheap to try. Each level costs
~3 instructions (cmp, cinc, mul+add) but eliminates a while-loop iteration for numbers exactly
at that digit count. Profiling hotness on the while-loop body is a reliable signal for whether
adding another level will pay off.

---

## EXP-027 — 2026-05-27 — Bit-shift mantissa check: `!(mantissa >> 53)` vs `mantissa <= 2^53`

**Status**: REJECTED

### Hypothesis

Replace `if (mantissa <= ffc_const(value_kind, MAX_MANTISSA_FAST_PATH))` with
`if (!(mantissa >> (ffc_const(value_kind, MANTISSA_EXPLICIT_BITS) + 1)))`.

For double, `MANTISSA_EXPLICIT_BITS = 52`, so shift amount = 53. `mantissa >> 53 == 0` iff
`mantissa < 2^53`. GCC emits `cmp xzr, x1, lsr #53; b.ne <eisel>` (2 instructions) instead of
`movz x6, #2^53; cmp x1, x6; b.hi <eisel>` (3 instructions). Expected saving: 1 i/f (the `movz`
constant load is eliminated).

### Files changed

- `ffc/src/ffc.h`: `mantissa <= MAX_MANTISSA_FAST_PATH` → `!(mantissa >> (MANTISSA_EXPLICIT_BITS + 1))`
- `ffc/ffc.h`: regenerated

### Implementation

```c
// FROM:
if (mantissa <= ffc_const(value_kind, MAX_MANTISSA_FAST_PATH)) {
// TO:
if (!(mantissa >> (ffc_const(value_kind, MANTISSA_EXPLICIT_BITS) + 1))) {
```

GCC emits `cmp xzr, x1, lsr #53; b.ne <eisel>` (ARM64 inline-shift compare form).
The `movz x6, #0x20000000000000` constant load is eliminated. `mov w18, #0` (Eisel retry flag)
remains on the Clinger path in both versions.

### Results (ARM Graviton4)

| Dataset | Baseline MB/s (EXP-026) | EXP-027 Run 1 | EXP-027 Run 2 | Avg Δ% |
|---------|------------------------|---------------|---------------|--------|
| random [0,1] | 1900, 227 i/f, 30.87 c/f | 1905, 226, 30.79 | 1904, 226, 30.82 | **+0.3%** |
| canada.txt | 1677, 196 i/f, 29.02 c/f | 1665, 195, 29.22 | 1660, 195, 29.31 | **−0.8%** |
| mesh.txt | 1394, 101 i/f, 14.75 c/f | 1442, 100, 14.26 | 1424, 100, 14.43 | **+2.8%** |

i/f consistently −1 for all datasets (226/195/100 vs 227/196/101) — the `movz` was eliminated.

### Decision: REJECTED

Mesh +2.8% (above threshold), but **canada −0.8%** is consistent across both runs (4× the ±0.2%
noise level). IPC drops from 6.75→6.67 for canada.

Root cause: `cmp xzr, x1, lsr #53` (ARM64 inline-shifted register compare) has a true data
dependency on x1 (the mantissa) with no ability to pre-execute the comparison operand. In the
baseline, `movz x6, #2^53` executes in parallel with mantissa digit scanning (no data dependency
at all), so the subsequent `cmp x1, x6` is effectively latency-free. The inline-shifted form
delays the comparison start until x1 is available, creating a slightly worse scheduling scenario
for longer-mantissa numbers (canada). The `mov w18, #0` (Eisel retry flag) was NOT moved to the
Eisel-only path by GCC — it remains on the Clinger path in both versions.

### Learning

`movz <reg>, #constant` with no data dependencies is "free" via OOO pre-execution for datasets
with longer mantissa computation chains (canada). The inline-shift form `cmp xzr, x1, lsr #53`
saves 1 i/f but removes this scheduling freedom. Do NOT replace `movz + cmp` with inline-shifted
compare when the constant has no data dependency and the other operand (mantissa) has a long
dependency chain.

---

## EXP-026 — 2026-05-27 — Straight-line integer scan: nested-ifs replace while loop for 1–4 digits

**Status**: ACCEPTED
**ffc commit**: 6e2c993

### Hypothesis

The integer while loop (`while ((p != pend) && ffc_is_integer(*p))`) has back-branches for
every digit consumed. For common inputs — random "0" (1 digit), mesh 1–2 digits, canada
2–3 digits — the loop runs 1–4 iterations and pays for 1–4 back-edge branches plus exit checks.

Direct analogy to EXP-015 (fraction tail nested-ifs, accepted): replace the while loop with
straight-line nested-ifs for the first 4 digits, falling back to the while loop for 5+.
No SWAR involved (distinguishing this from EXP-018, which regressed due to SWAR call overhead).

### Files changed

- `ffc/src/parse.h`: replaced integer while loop with 4-level nested-ifs + while fallback
- `ffc/ffc.h`: regenerated via `python3 amalgamate.py`

### Implementation

```c
// 4-level nested-ifs for 1–4 digit integers, while loop for 5+
if ((p != pend) && ffc_is_integer(*p)) {
  i = (uint64_t)(*p++ - '0');
  if ((p != pend) && ffc_is_integer(*p)) {
    i = i * 10 + (uint64_t)(*p++ - '0');
    if ((p != pend) && ffc_is_integer(*p)) {
      i = i * 10 + (uint64_t)(*p++ - '0');
      if ((p != pend) && ffc_is_integer(*p)) {
        i = i * 10 + (uint64_t)(*p++ - '0');
        while ((p != pend) && ffc_is_integer(*p)) {
          i = (10 * i) + (uint64_t)(*p - '0');
          ++p;
        }
      }
    }
  }
}
```

### Results (ARM Graviton4)

| Dataset | Baseline MB/s | EXP-026 MB/s | i/f | c/f | Δ% |
|---------|--------------|--------------|-----|-----|-----|
| random [0,1] | 1823 | **1900** | 227 | 30.87 | **+4.2%** |
| canada.txt | 1562 | **1677** | 196 | 29.02 | **+7.4%** |
| mesh.txt | 1366 | **1394** | 101 | 14.75 | **+2.0%** |

### Profile (ARM Graviton4 post-EXP-026)

- IPC: 4.78 (unchanged from baseline)
- Branch miss rate: 0.82% (unchanged)
- Cache miss rate: 0.03% (unchanged)
- `findmax_ffc` at 2.89% (down from 3.03%)
- No new bottleneck identified

### Analysis

The nested-ifs eliminate the back-branch overhead for 1–4 digit integers. The key distinction
from EXP-018 (SWAR + nested-ifs, rejected): this approach has zero function-call overhead.

canada improvement (+7.4%) is largest — integers like "123" (3 digits) save 3 back-branches.
mesh improvement (+2.0%) — integers like "1" or "2" (1–2 digits) save 1–2 back-branches.
random improvement (+4.2%) — integer is always "0" (1 digit), saves the back-edge exit check.

Correctness: same as the original while loop — the nested structure produces identical results
for any input sequence of digits. The fallback while handles 5+ digit integers correctly.

---

## EXP-025 — 2026-05-27 — Outer `pns.mantissa <= MAX_MANTISSA_FAST_PATH` guard before Clinger call

**Status**: REJECTED
**ffc commit**: (reverted, no commit)

### Hypothesis

For random [0,1] inputs with 17+ significant digits, `mantissa > 2^53 = MAX_MANTISSA_FAST_PATH`.
The Clinger path is always entered, pays for the 16-cycle FCMP chain (via `ffc_rounds_to_nearest()`),
then immediately fails the inner mantissa check. An outer pre-check in `ffc_from_chars_advanced`
before calling `ffc_clinger_fast_path_impl` should short-circuit and save ~8-9 i/f for these inputs.

Correctness: `MAX_MANTISSA[exponent] <= MAX_MANTISSA_FAST_PATH` for all exponents (no integer > 2^53
is exactly representable as double), so the Jelínek non-nearest path is also safe to skip.

### Files changed

- `ffc/src/ffc.h`: added `pns.mantissa <= ffc_const(vk, MAX_MANTISSA_FAST_PATH) &&` before
  `ffc_clinger_fast_path_impl` call in `ffc_from_chars_advanced`

### Implementation (tried then reverted)

```c
// EXP-025: outer guard before Clinger
if (!pns.too_many_digits &&
    pns.mantissa <= ffc_const(vk, MAX_MANTISSA_FAST_PATH) &&
    ffc_clinger_fast_path_impl(pns.mantissa, pns.exponent, pns.negative, value, vk)) {
  return answer;
}
```

### Results (ARM Graviton4)

| Dataset | Baseline MB/s | EXP-025 MB/s | Δ% |
|---------|--------------|--------------|-----|
| random [0,1] | 1823 | ~1865 | **+2.3%** |
| canada.txt | 1562 | ~1576 | **+0.9%** |
| mesh.txt | 1366 | ~1128 | **−17.4%** |

### Analysis

Severe mesh regression (-17.4%) from the same FCMP-delay root cause as EXP-021.

The 3 new instructions (mov constant + cmp + branch) placed before the Clinger call
delayed the `ffc_rounds_to_nearest()` volatile load by ~3 instructions in the
instruction stream. On Graviton4, the 16-cycle FCMP chain (load→fadd→fsub→fcmp) is
exactly on the critical path for mesh (c/f ≈ 15). Delaying the volatile load by ~3
cycles adds ~3 c/f directly to the mesh critical path.

Measured: c/f 15.10 → 18.28 (+3.18 c/f), IPC 7.10 → 5.97. Matches prediction.

The random/canada gains (+2.3%, +0.9%) are real instruction-count reductions but cannot
be captured without mesh regression. Reverted.

### Root cause

Any instruction placed before `ffc_rounds_to_nearest()` on the hot path delays the
16-cycle FCMP chain start for mesh. This is the same root cause as EXP-021. No
guard/check can be placed before the Clinger call without harming mesh.

---

## EXP-024 — 2026-05-27 — Branchless sign detection with `int neg = (*p == '-'); p += neg`

**Status**: REJECTED
**ffc commit**: (reverted, no commit)

### Hypothesis

EXP-023 failed because the bitwise `|` forced evaluation of the `+` check for all floats.
A correct branchless form — `int neg = (*p == '-'); p += neg;` plus a cold `+` branch —
should eliminate the 50%-unpredictable sign branch on canada.txt without adding overhead
for unsigned floats.

### Files changed

- `ffc/src/parse.h`: replaced sign branch with branchless form; cold `!neg && allow_leading_plus && *p == '+'` branch

### Implementation (tried then reverted)

```c
int neg = (*p == '-');
answer.negative = (bool)neg;
p += neg;
bool allow_leading_plus = fmt & FFC_FORMAT_FLAG_ALLOW_LEADING_PLUS;
if (__builtin_expect(!neg && allow_leading_plus && !basic_json_fmt && (*p == '+'), 0)) {
  ++p;
}
```

### Benchmark results

**ARM Graviton4 (EXP-015 baseline → EXP-024):**

| Dataset | Baseline MB/s | EXP-024 MB/s | Δ% | i/f baseline→024 |
|---------|---------------|--------------|-----|-------------------|
| random [0,1] | 1823 | 1642 | **−9.9%** | 229.04 → 231.04 (+2) |
| canada.txt   | 1566 | 1427 | **−8.9%** | 206.86 → 203.03 (−4) |
| mesh.txt     | 1361 | 1168 | **−14.2%** | 107.21 → 109.21 (+2) |

IPC: 7.12 → 6.47 (random), 6.66 → 5.95 (canada), 7.10 → 6.21 (mesh).

### Analysis

GCC compiled the branchless '-' to `cinc x2, x1, eq` (conditional increment):
```asm
ldrb w7, [x1]         ; load *p
cmp  w7, #0x2d        ; *p == '-'?
cset x22, eq          ; neg = (*p == '-')
cinc x2, x1, eq       ; p = x1 + neg (branchless advance)
cmp  x20, x2          ; pend == p_new?
b.eq  error           ; cold
mov  x8, x2           ; x8 = updated p  ← DEPENDENCY
```

The `cinc x2, x1, eq` creates a TRUE DATA DEPENDENCY: x8 (the pointer for the first digit
load) depends on the comparison result. The CPU CANNOT speculate the first digit address until
the comparison resolves.

In the baseline branch version, `b.ne skip_sign` is always correctly predicted for
random (never-negative). The CPU uses branch prediction to speculatively load the first digit
from the unchanged `p` BEFORE the branch resolves. This zero-cost speculation is eliminated
by the branchless approach.

For canada, eliminating 50% branch mispredictions (3.75 cycles savings/float average) cannot
compensate for the 3-cycle dep-chain overhead on ALL floats. IPC dropped from 6.66 to 5.95.

**Key lesson (same root cause as EXP-022):** On Graviton4 with IPC near ceiling, branch
prediction IS the speculative execution path. The sign branch is NEARLY FREE for well-predicted
inputs (random). Replacing it with a data-dependent operation stalls the pipeline by forcing
the CPU to wait for the comparison before loading the first digit.

Do not retry sign-detection branchlessness on this code path unless a technique can be found
that does NOT add a data dependency to the first digit pointer.

### Decision

REJECTED. All datasets regressed −9% to −14%. Branchless sign detection is incompatible
with Graviton4's speculative execution model for this code path.

---

## EXP-023 — 2026-05-27 — Branchless sign detection in `ffc_from_chars_advanced_impl`

**Status**: REJECTED
**ffc commit**: (reverted, no commit)

### Hypothesis

The sign detection branch `if ((*p == '-') || ...)` in `ffc_from_chars_advanced_impl`
at c2c4 shows ~50% miss rate on canada.txt (mixed positive/negative coordinates). A
branchless formulation using `has_sign = (*p == '-') | (int)(allow_leading_plus && ...)` +
`p += has_sign` would eliminate the misprediction penalty (~15 cycles on Graviton4)
for half of canada inputs, while keeping the error-check block cold via `__builtin_expect`.

### Files changed

- `ffc/src/parse.h`: replaced branch-based sign detection with branchless version using bitwise `|`

### Implementation (tried then reverted)

```c
// AFTER (reverted — regression):
bool allow_leading_plus = fmt & FFC_FORMAT_FLAG_ALLOW_LEADING_PLUS;
int has_sign = (*p == '-') | (int)(allow_leading_plus && !basic_json_fmt && (*p == '+'));
answer.negative = (*p == '-');
p += has_sign;
if (__builtin_expect(has_sign & ((p == pend) | (int)(basic_json_fmt ?
    !ffc_is_integer(*p) : (!ffc_is_integer(*p) && (*p != decimal_point)))), 0)) {
  // error returns ...
}
```

### Benchmark results

**ARM Graviton4 (EXP-015 baseline → EXP-023):**

| Dataset | Baseline MB/s | EXP-023 MB/s | Δ% | i/f |
|---------|---------------|--------------|-----|-----|
| random [0,1] | 1823 | 1582 | **−13.2%** | 229.04 → 241.04 (+12) |
| canada.txt   | 1566 | 1380 | **−11.9%** | 206.86 → 213.03 (+6) |
| mesh.txt     | 1361 | 1148 | **−15.7%** | 107.21 → 119.21 (+12) |

### Analysis

Root cause: the bitwise `|` operator in `has_sign & ((p == pend) | (int)(basic_json_fmt ? ...))` 
forces **full evaluation** of the right side for ALL floats — including unsigned ones.
The expression `(int)(basic_json_fmt ? !ffc_is_integer(*p) : (!ffc_is_integer(*p) && (*p != decimal_point)))` 
is computed on every float call regardless of whether a sign was seen.

For random [0,1]: ALL numbers are unsigned, so the sign branch was never taken in the baseline.
The branchless version adds ~12 extra instructions (allow_leading_plus eval + multiple comparisons)
on every float. IPC dropped from 7.12 to 6.51 (shorter dependency chains from new expressions).

For canada: ~50% are negative (sign branch IS taken in baseline, which was a misprediction).
But the branchless overhead (+6 i/f) outweighs the ~15-cycle branch misprediction savings.

**Key lesson**: Branchless sign detection requires careful use of short-circuit `&&`, not
bitwise `|`, to avoid evaluating the `+` check on every float. A correct branchless version
would be: `int neg = (*p == '-'); answer.negative = neg; p += neg;` with NO error-check inline
(relying on the downstream `digit_count == 0` check to catch invalid sign inputs).

### Decision

REJECTED. All datasets regressed −12% to −16%. The branchless approach is structurally
sound but the specific implementation forced unnecessary computation for unsigned floats.
See Known Non-Starters for correct next approach to sign optimization.

---

## EXP-022 — 2026-05-27 — Hoist `ffc_b10_to_b2` before UMULH to overlap multiplies

**Status**: REJECTED
**ffc commit**: (reverted, no commit)

### Hypothesis

In `ffc_compute_float`, `ffc_b10_to_b2(q)` is called at line 123 AFTER
`ffc_compute_product_approximation` (which contains the UMULH/MUL pair). Since
`ffc_b10_to_b2(q)` only needs `q` (available from function entry), computing it
before the UMULH would allow GCC to schedule the integer multiply (3-cycle latency)
concurrently with the table-load → UMULH pipeline, potentially saving 3-5 cycles on
the critical path.

Pre-experiment profile (EXP-015 baseline) showed 13% stall at c684 (first instruction
of b10_to_b2 after the b.ne branch that depends on UMULH result).

### Files changed

- `ffc/src/ffc.h`: added `int32_t b2 = ffc_b10_to_b2((int32_t)(q));` before
  `ffc_compute_product_approximation` call; used `b2` in the power2 computation (then reverted)

### Implementation (tried then reverted)

```c
// AFTER (reverted):
int32_t lz = (int32_t)ffc_count_leading_zeroes(w);
int32_t b2 = ffc_b10_to_b2((int32_t)(q)); // hoist before UMULH
w <<= lz;
ffc_u128 product = ffc_compute_product_approximation(q, w, vk);
// ...
answer.power2 = (int32_t)(b2 + upperbit - lz - ffc_const(vk, MINIMUM_EXPONENT));
```

### Benchmark results

**ARM Graviton4 (EXP-015 baseline → EXP-022):**

| Dataset | Baseline MB/s | EXP-022 MB/s | Δ% | i/f |
|---------|---------------|--------------|-----|-----|
| random [0,1] | 1823 | 1837–1840 | **+0.8–0.9%** | 229.04 (same) |
| canada.txt   | 1566 | 1569–1571 | **+0.2–0.3%** | 206.86 (same) |
| mesh.txt     | 1361 | 1359–1361 | **−0.1–0%** | 107.21 (same) |

### Analysis

GCC DID hoist the b10_to_b2 multiply before UMULH (confirmed by objdump: `c64c: mov w10,
#0x526a` before `c65c: umulh x7, x4, x15`). However, the gain is negligible because the
OOO processor was ALREADY speculatively executing the b10_to_b2 computation in the
baseline — the CPU predicts the b.ne at c668 as "taken" (correct ~99%+ of the time) and
speculatively starts c684 (b10_to_b2) immediately while waiting for the UMULH to resolve.

The profile confirmed this: the stall moved from c684 (13.79% baseline) to c698 (14.91%
in EXP-022 binary), showing the stall shifted to the FIRST instruction that uses the UMULH
result after the b.ne. The fundamental UMULH latency bottleneck is unavoidable.

i/f unchanged (229.04, 206.86, 107.21) confirms instruction count is the bottleneck,
not critical-path latency. IPC = 7.1 is close to Graviton4's practical throughput ceiling.

**Key insight**: To improve performance, we must REDUCE i/f (fewer instructions per float),
not reduce critical-path latency (the OOO processor already hides that).

### Decision

REJECTED. All datasets within noise (< 1%); i/f unchanged; OOO already hides latency.
Do not retry b10_to_b2 hoisting — it has no effect on throughput-bound code.

---

## EXP-021 — 2026-05-27 — Mantissa check before `ffc_rounds_to_nearest()` in Clinger fast path

**Status**: REJECTED
**ffc commit**: (reverted, no commit)

### Hypothesis

In `ffc_clinger_fast_path_impl`, the current ordering calls `ffc_rounds_to_nearest()`
(a 7-instruction FCMP chain, 16-cycle latency) before checking `mantissa <=
MAX_MANTISSA_FAST_PATH`. For the majority of inputs where rounding mode is nearest
(the FCMP branch is predictable), the FCMP chain is on the critical path unnecessarily.

Reordering to check `mantissa <= MAX_MANTISSA_FAST_PATH` first would allow the integer
comparison to complete in ~3 cycles, letting the compiler hoist the volatile float load
earlier in the instruction stream. For canada (large mantissas hitting Eisel-Lemire),
the FCMP is avoided entirely for the non-exponent-range path.

Key structural proof: `FFC_DOUBLE_MAX_MANTISSA[e] <= MAX_MANTISSA_FAST_PATH` for all
e ≥ 0 — so the non-nearest modified Clinger path can never apply when
`mantissa > MAX_MANTISSA_FAST_PATH`. The reordering is semantically equivalent.

### Files changed

- `ffc/src/ffc.h`: swapped ordering in `ffc_clinger_fast_path_impl` — mantissa guard
  moved before `ffc_rounds_to_nearest()` call (then reverted)

### Implementation (tried then reverted)

```c
// AFTER (reverted):
if (exponent_in_range) {
  if (mantissa <= ffc_const(value_kind, MAX_MANTISSA_FAST_PATH)) {
    if (ffc_rounds_to_nearest()) {
      // Standard Clinger
      return true;
    }
    // non-nearest path: fall through to return false
  } else if (ffc_rounds_to_nearest()) {
    // mantissa > MAX_MANTISSA_FAST_PATH, nearest rounding — neither path applies
  } else {
    if (exponent >= 0 && mantissa <= ffc_const(value_kind, MAX_MANTISSA)[exponent]) {
      // Modified Clinger
      return true;
    }
  }
}
```

### Benchmark results

**ARM Graviton4 (EXP-015 baseline → EXP-021):**

| Dataset | Baseline MB/s | EXP-021 MB/s | Δ% | i/f | c/f |
|---------|---------------|--------------|-----|-----|-----|
| random [0,1] | 1821 | 1866 | **+2.5%** | 228.04 | 31.17 |
| canada.txt   | 1561 | 1567 | **+0.4%** | 205.95 | 31.13 |
| mesh.txt     | 1362 | 1262 | **−7.3%** | 107.21 | 16.28 |

Confirmed in 2 benchmark runs. Baseline mesh c/f = 15.09; EXP-021 mesh c/f = 16.28–16.29.

### Analysis

**Mesh regression root cause**: Mesh numbers are short floats (1–7 chars) that hit the
Clinger fast path almost exclusively. For these, the volatile float load for
`ffc_rounds_to_nearest()` must start early enough for the 16-cycle FCMP chain to
complete before the result is needed in the branch. Moving the mantissa check first
delays the volatile float load by ~3 instructions (~3 cycles) — which pushes the FCMP
result past the branch decision point for 15 c/f numbers. The OOO processor cannot
hide this extra latency because the FCMP result is the branch condition.

**Canada/random analysis**: The c620 stall (13% of cycles) seen in the EXP-015 profile
is a ROB retirement backup, NOT a critical path stall. The CPU speculatively executes
past the FCMP branch (predicts nearest=true correctly ~99%+ of the time), so Eisel-Lemire
code starts executing before the FCMP resolves. Removing the FCMP from the critical path
only freed ROB bandwidth, yielding only +0.4% canada and +2.5% random — far below the
expected ~10% if it were a true execution bottleneck.

**Key lesson**: For `ffc_rounds_to_nearest()`, the volatile float load timing is critical.
It must fire before any mantissa check so the 16-cycle FCMP chain can complete in time
for Clinger-eligible numbers. The current ordering (FCMP before mantissa) is correct for
microarchitectural reasons specific to Graviton4, even though it appears logically
suboptimal. Do not retry this reordering.

### Decision

REJECTED. Mesh -7.3% is a clear regression. Added to Known Non-Starters.

---

## EXP-020 — 2026-05-27 — AArch64 FPCR direct read in `ffc_rounds_to_nearest` (re-trial post-EXP-015)

**Status**: REJECTED
**ffc commit**: (reverted, no commit)

### Hypothesis

`ffc_rounds_to_nearest()` uses a volatile `float volatile fmin = FLT_MIN` trick that
generates 7 instructions (adrp + ldr + fmov + fadd + fsub + fcmp + b.ne) with a
5-cycle FCMP latency stall showing as 13% of cycles at c620 in the post-EXP-015
profile. Replacing with a single `mrs x, fpcr` + `tst` + `b.ne` (3 instructions,
eliminates the float pipeline stall) should free ~4 instructions and ~2 stall cycles
per call.

EXP-013 tried this and was parked at +0.9–1.6% (below 2% threshold) before EXP-015.
After EXP-015's fraction-tail unrolling made the Clinger path proportionally heavier,
the FCMP bottleneck shows at 13% — we expect the gain to be larger now.

### Files changed

- `ffc/src/common.h`: added `#if defined(__aarch64__)` block with `mrs fpcr` path
  before existing volatile float code (then reverted)

### Results (ARM Graviton4)

| Dataset | Before | After | Δ |
|---------|--------|-------|---|
| random [0,1] | 1823 MB/s | 1838–1841 MB/s | **+0.8–1.0%** |
| canada.txt | 1562 MB/s | 1572 MB/s | **+0.6%** |
| mesh.txt | 1366 MB/s | 1351–1352 MB/s | **−1.0–1.1%** |

Instruction counts (i/f) unchanged from baseline (225.04, 202.86, 103.21).
MRS presence in binary confirmed via objdump (at c5e4 in findmax_ffc).

### Analysis

The MRS approach IS active in the binary. The sub-2% improvements indicate that:
1. MRS FPCR on Graviton4 has similar latency (~3-5 cycles) to the FCMP sequence,
   so net savings per call is ~0–2 cycles rather than 4.
2. For mesh (Clinger-only, short floats), the slight regression suggests MRS may
   disrupt out-of-order scheduling of surrounding instructions.
3. This is consistent with EXP-013 result (+0.9–1.6%) measured before EXP-015 —
   the additional Clinger fraction work from EXP-015 did not amplify the gain.

Root cause: MRS FPCR serializes the register file on many ARM implementations.
The eliminated L1 volatile float load is replaced by a comparably-latent MRS,
yielding negligible net benefit.

### Decision

REJECTED. All datasets below 2% threshold; mesh shows slight regression.
Added to Known Non-Starters.

## EXP-019 — 2026-05-27 — Precomputed lookup table for `ffc_b10_to_b2`

**Status**: REJECTED
**ffc commit**: (reverted, no commit)

### Hypothesis

The `ffc_b10_to_b2(q)` multiply at c698 shares the integer multiply unit with the two
128-bit mantissa multiplies (c650 UMULH + c654 MUL) in `ffc_compute_float`. On
Graviton4 with 2 integer multiply units, the three multiplies serialize at ~C+10
before the power2 chain can resolve. Replacing the b10_to_b2 MUL with a precomputed
`int16_t` table lookup (651 entries, 1.3KB) would put the lookup on the load unit,
running in parallel with the UMULH/MUL pair and saving ~3 cycles per Eisel-Lemire call.

The same q+342 index computed at c634 for the power table is reused for the b10_to_b2
table, so no extra index-computation instructions are needed.

### Files changed

- `ffc/src/ffc.h`: added `ffc_b10_to_b2_lut[651]` static const int16_t array;
  changed `ffc_b10_to_b2(q)` to `return (int32_t)ffc_b10_to_b2_lut[(uint32_t)(q+342)]`

### Benchmark results

**ARM Graviton4 (EXP-015 baseline → EXP-019):**

| Dataset | Baseline MB/s | EXP-019 MB/s | Δ% | i/f | c/f | IPC |
|---------|---------------|--------------|-----|-----|-----|-----|
| random [0,1] | 1822 | 1835 | **+0.7%** | 228.04 (−1) | 31.96 | 7.14 |
| canada.txt   | 1565 | 1564 | ≈0%        | 205.95 (−1) | 31.13 | 6.62 |
| mesh.txt     | 1366 | 1294 | **−5.3%** | 107.21 (=)  | 15.89 | 6.75 |

### Analysis

The instruction count changes are minimal (−1 i/f for random/canada, unchanged for
mesh), confirming the table lookup generates essentially the same code. The expected
multiply-unit parallelism benefit materializes only for random (+0.7%).

**Mesh regression root cause**: Mesh numbers (short floats, 1-3 significant digits)
all hit the Clinger fast path and never reach Eisel-Lemire, so the b10_to_b2 table
is never accessed. However, the 1.3KB table occupies space in the .rodata section and
causes L1 cache aliasing with `FFC_DOUBLE_POWERS_OF_TEN` (used by every Clinger call).
Mesh IPC drops from 7.08 → 6.75 (−4.6%) without any instruction count change — a
pure cache-pressure regression. The 5.3% MB/s regression was confirmed stable across
3 consecutive runs.

**Why the b10_to_b2 table fails**: The Eisel-Lemire path benefits slightly from
parallelism (+0.7% random), but the cost is paid by the Clinger path (which dominates
for canada/mesh). Even 1.3KB of new read-only data can cause cache line aliasing
when the existing working set is tightly packed.

### Verdict

REJECTED — random barely improves (+0.7%) while mesh regresses (-5.3%). The cache
aliasing cost of adding 1.3KB to .rodata outweighs the ILP gain for the load path.

---

## EXP-018 — 2026-05-27 — SWAR + nested-ifs for integer-part digit scanning

**Status**: REJECTED
**ffc commit**: (reverted, no commit)

### Hypothesis

The integer-part digit scanner (lines ~272–280 in `parse.h`) uses a byte-by-byte while loop
identical to the pre-EXP-001 fraction loop. EXP-015 showed that applying SWAR +
nested-ifs to the fraction tail gained +3.9% ARM mesh / +2.1% ARM canada. The same
technique applied to the integer part should yield similar gains since `ffc_loop_parse_if_eight_digits`
also handles the integer-part loop.

### Files changed

- `ffc/src/parse.h`: replaced integer-part while loop with `ffc_loop_parse_if_eight_digits` call + 3 nested ifs

### Implementation

```c
// BEFORE:
while ((p != pend) && ffc_is_integer(*p)) {
  uint64_t digit_value = (uint64_t)(*p - '0');
  i = (10 * i) + digit_value;
  ++p;
}

// AFTER:
ffc_loop_parse_if_eight_digits(&p, pend, &i);
if (p != pend && ffc_is_integer(*p)) {
  i = i * 10 + (uint8_t)(*p++ - (char)('0'));
  if (p != pend && ffc_is_integer(*p)) {
    i = i * 10 + (uint8_t)(*p++ - (char)('0'));
    if (p != pend && ffc_is_integer(*p)) {
      i = i * 10 + (uint8_t)(*p++ - (char)('0'));
    }
  }
}
```

### Benchmark results

**ARM Graviton4 (EXP-015 baseline → EXP-018):**

| Dataset | Baseline MB/s | EXP-018 MB/s | Δ% | i/f |
|---------|---------------|--------------|-----|-----|
| random [0,1] | 1823 | 1712 | **−6.1%** | 257.04 |
| canada.txt   | 1562 | 1448 | **−7.3%** | 232.49 |
| mesh.txt     | 1366 | 1184 | **−13.3%** | 113.36 |

### Analysis

Clear regression across all three datasets. The root cause: canada and mesh have integer
parts of 1–3 digits on average. For such short integers, the SWAR function call itself
adds overhead (8-byte alignment check, branch on 8-byte availability) without ever firing
the SWAR path — all inputs fall through to the 3 nested ifs anyway, paying more overhead
than the original simple while loop back-branch.

The key difference from EXP-015 (fraction tail — accepted) is that the fraction loop was
entered after already consuming 8+ fraction digits via SWAR, leaving at most 3 tail bytes.
Here the integer part is the primary call, not a tail cleanup — most numbers in canada/mesh
have 1–3 integer digits total, so the entire integer scan is just tail. Calling
`ffc_loop_parse_if_eight_digits` for a 1–3 digit integer is strictly worse than a
tight while loop.

### Verdict

REJECTED — all datasets regressed. SWAR is counterproductive for integer parts
of typical float inputs.

---

## EXP-017 — 2026-05-27 — Outline non-nearest Clinger else block as noinline cold function

**Status**: REJECTED
**ffc commit**: (reverted, no commit)

### Hypothesis

The `else` block in `ffc_clinger_fast_path_impl` (handling the non-FE_TONEAREST path)
contains ~20 instructions. It fires only when `ffc_rounds_to_nearest()` is false, which is
essentially never in practice (default FPU rounding is nearest). Despite never being taken,
GCC inlines this code into the hot function body, increasing icache footprint and register
pressure.

Extracting it as `ffc_noinline ffc_clinger_non_nearest()` was expected to:
1. Remove ~20 instructions from the hot inline body
2. Reduce register pressure in the Clinger fast path
3. Reduce icache footprint

### Implementation

- Added `ffc_noinline` macro to `common.h`
- Extracted the else block into `ffc_clinger_non_nearest()` marked `ffc_noinline`
- Replaced the else block with a single call: `return ffc_clinger_non_nearest(...)`

### Results

**ARM Graviton4 (EXP-015 baseline → EXP-017):**

| Dataset | Baseline MB/s | EXP-017 MB/s | Δ% | i/f |
|---------|--------------|--------------|-----|-----|
| random [0,1] | 1823 | 1835 | +0.7% (noise) | 228.05 |
| canada.txt | 1562 | ~1578 | **+1.0%** | 205.22 |
| mesh.txt | 1366 | ~1326 | **-2.9% (regression)** | 114.22 |

Mesh i/f = 114.22 (baseline was ~107 — +7 instructions added despite theory predicting reduction).

Canada run consistency: 1573, 1578, 1579, 1581 MB/s — consistently +1.0%, below 2% threshold.
Mesh run consistency: 1323, 1328, 1325, 1329 MB/s — consistently below baseline 1366.

### Analysis

The `ffc_noinline` function call ADDED ~7 instructions to the mesh hot path despite the theory
that it should REMOVE instructions. Root cause: ARM64 ABI requires caller-save register
setup around ANY function call, even a never-taken branch. GCC adds register save/restore
instructions in the calling function's preamble to comply with the ABI, even though the call
is predicted-not-taken. For mesh (which has numbers that follow a different register usage
pattern than canada), this ABI overhead added 7 instructions per number.

This is the same underlying failure mode as EXP-010 (cold attribute on infnan/digit_comp):
changing function call semantics in the inlined hot body disrupts GCC's register allocation.

EXP-009 (adding `always_inline`) was the correct direction for this codebase — forcing MORE
inlining reduces function call overhead. The inverse (adding `noinline`) adds overhead even
for predicted-not-taken calls.

### Verdict

**REJECTED** — -2.9% mesh regression, +1.0% canada (below 2% threshold), +7 instructions.
Adding to Known Non-Starters: noinline extraction of cold branches within `always_inline` chain.

---

## EXP-016 — 2026-05-27 — Hoist ffc_rounds_to_nearest() before digit scanning

**Status**: REJECTED
**ffc commit**: (reverted, no commit)

### Hypothesis

After EXP-015, the perf profile showed c620 (`mov x4, MAX_MANTISSA_FAST_PATH`) at 13.45% of
`findmax_ffc` cycles. This instruction immediately follows the `fcmp` in
`ffc_rounds_to_nearest()` (c618). The `fcmp` has 5-cycle latency; the CPU stalls at c620
while waiting for the branch condition to resolve.

The rounds_to_nearest code is at c610-c618 in the binary, approximately 700 bytes after
digit scanning start (c2ec). That exceeds the Graviton4 OOO window (~128 instructions ≈
512 bytes). So the OOO engine cannot overlap the float ops with digit scanning.

Hypothesis: move the `ffc_rounds_to_nearest()` call to BEFORE `ffc_parse_number_string`
(digit scanning) in `ffc_from_chars`. This would place the fadd/fsub/fcmp instructions
early in the binary, allowing them to execute concurrently with digit scanning and hiding
the 5-cycle float latency behind the ~50-100 instruction digit scanning body.

Expected gain: 5-15% on canada.txt (where c620 is 13.45% hot).

### Implementation

In `ffc/src/ffc.h`:
1. Added `bool rtn = ffc_rounds_to_nearest()` at the TOP of `ffc_from_chars`, before
   the whitespace skip and `ffc_parse_number_string` call.
2. Added `bool rtn` parameter to `ffc_from_chars_advanced`.
3. Added `bool rtn` parameter to `ffc_clinger_fast_path_impl`, removing the internal
   call to `ffc_rounds_to_nearest()`.
4. Passed `rtn` through the call chain.

### Results

**ARM Graviton4 (EXP-015 baseline → EXP-016):**

| Dataset | Baseline MB/s | EXP-016 MB/s | Δ% |
|---------|--------------|--------------|-----|
| random [0,1] | 1823 | 1834 | +0.6% (noise) |
| canada.txt | 1562 | ~1554 | **-0.5% (regression)** |
| mesh.txt | 1366 | ~1379 | +1.0% (within noise) |

Three runs of canada.txt: 1553, 1553, 1557 MB/s — consistently below baseline 1562.
IPC on canada dropped from 6.64-6.65 to 6.60-6.62.

### Analysis

The hoisting produced NO measurable improvement despite the theory. Two possible explanations:
1. GCC with -O3 was already scheduling the float instructions early via its own
   instruction scheduler (the volatile load doesn't prevent early scheduling).
2. The c620 stall is NOT from float latency — it may be from the mantissa value (x1)
   not yet being ready at c628 (dependency on digit scanning result).

The slight canada regression (-0.5%) is likely from adding a bool parameter through
3 force-inlined functions, slightly changing register allocation.

### Verdict

**REJECTED** — regression on canada, sub-threshold on mesh, no net improvement.
Adding to Known Non-Starters.

---

## EXP-015 — 2026-05-27 — Unroll fraction byte-by-byte tail (3 nested ifs)

**Status**: ACCEPTED
**ffc commit**: (see workspace commit)

### Hypothesis

After `ffc_loop_parse_if_eight_digits` returns, at most 3 consecutive digit bytes can
remain (the function drains 8+4 digits; the 4-digit follow-up only fires if all 4 bytes
are digits, so at most 3 consecutive digits remain when it fails). The existing while loop
at `c6cc` (9.73% of ffc cycles on canada.txt) runs 0-3 iterations for fraction tails but
carries a branch-back on every iteration.

Replacing the while loop with 3 nested ifs eliminates the back-branch overhead, lets the
out-of-order engine see further ahead per number, and reduces cycle-count without changing
instruction count (IPC gain, not instruction reduction).

Target: fraction byte-by-byte tail in `ffc_parse_number_string` (parse.h lines 316-320).
Explicitly excludes the integer byte-by-byte loop (before the decimal point) which has no
preceding SWAR and may have arbitrarily many digits.

### Implementation

In `ffc/src/parse.h` — replaced the while loop after `ffc_loop_parse_if_eight_digits`:

```c
// BEFORE
while ((p != pend) && ffc_is_integer(*p)) {
  uint8_t digit = (uint8_t)(*p - (char)('0'));
  ++p;
  i = i * 10 + digit; // in rare cases, this will overflow, but that's ok
}

// AFTER
// ffc_loop_parse_if_eight_digits handles 8+4 digits, so at most 3 remain.
// Straight-line tail eliminates the back-branch for the common 1-3 digit case.
if (p != pend && ffc_is_integer(*p)) {
  i = i * 10 + (uint8_t)(*p++ - (char)('0')); // in rare cases overflows, ok
  if (p != pend && ffc_is_integer(*p)) {
    i = i * 10 + (uint8_t)(*p++ - (char)('0'));
    if (p != pend && ffc_is_integer(*p)) {
      i = i * 10 + (uint8_t)(*p++ - (char)('0'));
    }
  }
}
```

### Results

**ARM Graviton4 (m8g.metal-24xl):**

| Dataset | Baseline MB/s | EXP-015 MB/s | Δ% |
|---------|--------------|--------------|-----|
| random [0,1] | 1812 | 1823 | +0.6% (noise) |
| canada.txt | 1530 | 1562 | **+2.1%** |
| mesh.txt | 1315 | 1366 | **+3.9%** |

IPC (instructions per cycle) improved, not instruction count:
- canada: 6.50 → 6.64 IPC (+2.2%), same 206 i/f
- mesh: 6.86 → 7.12 IPC (+3.8%), same 107 i/f

The improvement comes from better out-of-order scheduling: straight-line code lets the
CPU see further ahead, reducing stalls from loop-back branch resolution.

**x86 Xeon Platinum 8488C (m7i.metal-24xl):**
High variance (±3-4.5% noise); inconclusive single-run comparison. No clear regression.
Baseline and EXP-015 both within noise of each other on all three datasets.

**Correctness:** Unit tests pass (ARM + local).

### Verdict

**ACCEPTED** — +2.1% canada and +3.9% mesh on ARM, both above the 2% threshold.
random [0,1] is unaffected (SWAR handles all 16 fraction digits exactly, no tail).
x86 shows no regression. Change kept in `ffc/src/`.

---

## EXP-014 — 2026-05-27 — 2-digit SWAR follow-up in `ffc_loop_parse_if_eight_digits`

**Status**: REJECTED
**ffc commit**: (reverted, no commit)

### Hypothesis

The fraction byte-by-byte fallback loop at instruction `c6cc` accounts for **9.73%** of
ffc cycles on canada (the hottest hot-spot outside Eisel-Lemire). After the 8-digit and
4-digit SWARs handle multiples of 8 and 4 fraction digits, residual 2-3 digit remainders
fall to a 10-instruction-per-digit loop. Adding a 2-digit SWAR follow-up (analogous to
the existing 4-digit follow-up in `ffc_loop_parse_if_eight_digits`) should reduce
byte-by-byte iterations for common digit counts: 7-digit fractions (4-SWAR handles 4,
2-SWAR handles 2, 1 byte-by-byte), 10-digit fractions (8-SWAR handles 8, 2-SWAR handles 2).

Expected: −10–20 i/f for canada (9-11 fraction digits), modest for mesh (2-3 digit
fractions), negligible for random (16-17 fraction digits, 2-digit check almost always
fails immediately).

### Files changed

- `ffc/src/parse.h`: added `ffc_read2_to_u16`, `ffc_is_made_of_two_digits_fast`,
  `ffc_parse_two_digits`, and a 2-digit follow-up block in `ffc_loop_parse_if_eight_digits`

### Benchmark results

**Baseline (post-EXP-012, ARM Graviton4)**:

| Dataset | ffc MB/s | i/f    | c/f   | IPC  |
|---------|----------|--------|-------|------|
| canada  | 1534     | 206.64 | 31.72 | 6.51 |
| mesh    | 1312     | 107.26 | 15.66 | 6.85 |
| random  | 1809     | 231.04 | 32.43 | 7.12 |

**EXP-014 ARM**:

| Dataset | ffc MB/s | Δ       | i/f    | Δ i/f | c/f   | IPC  |
|---------|----------|---------|--------|-------|-------|------|
| canada  | 1520     | **−0.9%** | 209.85 | **+3.21** | 32.01 | 6.56 |
| mesh    | 1235     | **−5.9%** | 108.61 | **+1.35** | 16.65 | 6.52 |
| random  | 1753     | **−3.1%** | 243.04 | **+12.0** | 33.45 | 7.26 |

### Analysis

**Counter-intuitive result: instruction count INCREASED for all three datasets.** The
2-digit SWAR additions were expected to reduce the byte-by-byte iterations but instead
bloated the inlined `ffc_loop_parse_if_eight_digits` body. The increased function size
caused the compiler to generate worse register allocation (higher spill count) and
suboptimal code layout for the surrounding hot path. This is visible most dramatically
on random (+12 i/f), where the 2-digit check should only add 1 comparison (immediately
fails since only 0-1 fraction digits remain after 2×8-SWAR). The large increase suggests
inlining budget was exhausted, causing previously-inlined code to de-inline.

Root cause: `ffc_loop_parse_if_eight_digits` is already at the edge of profitable inlining.
Adding ~15 instructions to its body tips it over, defeating the EXP-009 force-inline
optimizations. This is the same failure mode as EXP-002 (2-digit SWAR, -18% regression).

### Decision

**REJECT** — all three datasets regressed. Added to Known Non-Starters.

---

## EXP-013 — 2026-05-26 — AArch64 FPCR direct read in `ffc_rounds_to_nearest`

**Status**: PARKED
**ffc commit**: (reverted, no commit)

### Hypothesis

`ffc_rounds_to_nearest()` uses a volatile float trick (load FLT_MIN from memory, do
`fmin + 1.0f == 1.0f - fmin`) to detect non-nearest rounding mode without calling
`fegetround()`. On AArch64, this compiles to 7 instructions:
`adrp + ldr (L1 load) + fmov + fadd + fsub + fcmp + b.ne`.

The AArch64 Floating-Point Control Register (FPCR) bits [23:22] encode the rounding
mode directly (0 = round-to-nearest-even). One `mrs` instruction reads it in 1 cycle
vs ~4 cycles for an L1 cache load, replacing the 7-instruction sequence with 3:
`mrs fpcr + tst #0xc00000 + b.ne` — saving 4 instructions per float on every
Clinger-path number.

The call to `ffc_rounds_to_nearest()` is inline in `ffc_clinger_fast_path_impl`, which
runs for every number with mantissa ≤ 2^53 and exponent ∈ [−22, 22].

### Files changed

- `ffc/src/common.h`: `ffc_rounds_to_nearest()` — added `#if defined(__aarch64__)` fast
  path with `__asm__ volatile("mrs %0, fpcr")` before the `#else` volatile float path.

### Benchmark results

**Baseline (post-EXP-012, ARM Graviton4)**:

| Dataset | ffc MB/s | i/f   | c/f   | IPC  | b/f |
|---------|----------|-------|-------|------|-----|
| canada  | 1534     | 206.64| 31.72 | 6.51 | 41.41 |
| mesh    | 1312     | 107.26| 15.66 | 6.85 | 23.85 |
| random  | 1809     | 231.04| 32.43 | 7.12 | 46.00 |

**EXP-013 ARM**:

| Dataset | ffc MB/s | Δ      | i/f    | Δ i/f | c/f   | IPC  | b/f |
|---------|----------|--------|--------|-------|-------|------|-----|
| canada  | 1555     | **+1.4%** | 202.64 | −4    | 31.30 | 6.47 | 41.41 |
| mesh    | 1324     | **+0.9%** | 103.26 | −4    | 15.53 | 6.65 | 23.85 |
| random  | 1838     | **+1.6%** | 227.04 | −4    | 31.89 | 7.12 | 46.00 |

### Analysis

The instruction savings are exactly as predicted: −4 i/f across all datasets, confirming
the 7→3 instruction reduction in the inlined `ffc_rounds_to_nearest()`. The FPCR read
is confirmed in the binary: `mrs x4, fpcr; tst x4, #0xc00000; b.ne <slow>`.

Despite fewer instructions, IPC slightly decreased on canada (6.51→6.47) and mesh
(6.85→6.65), suggesting the FPCR instruction has worse ILP interaction with surrounding
code than the original FP sequence (which could overlap with FP pipeline stages). The
net result is smaller MB/s gains than the instruction count reduction would predict.

All three results are positive and above the ±0.4% noise floor (real signal), but all
fall below the 2% acceptance threshold (max +1.6% on random).

### Decision

**PARK** — improvement is real and uniformly positive (+0.9–1.6%), but below the 2%
threshold. The approach is technically sound: `mrs fpcr` is the correct AArch64 idiom
for reading rounding mode. If future instruction-reduction work pushes overall IPC up,
this +4 i/f saving could compound to reach threshold. The change does not add code
complexity (a simple `#ifdef __aarch64__` block).

Not added to Known Non-Starters — the technique is valid; only the current gain size
is insufficient.

---

## EXP-012 — 2026-05-26 — Combined exponent range check in `ffc_clinger_fast_path_impl`

**Status**: ACCEPTED
**ffc commit**: (pending — changes in ffc/src/ffc.h, ffc/ffc.h)

### Hypothesis

In `ffc_clinger_fast_path_impl`, the exponent range check `[MIN, MAX]` is implemented as
two separate signed comparisons (first `exponent >= MIN`, then `exponent <= MAX`). GCC
compiles this into two separate conditional branches with an intermediate jump through
the function to the second check block. fast_float uses the unsigned range trick instead:
`(uint64_t)(exponent - MIN) <= (uint64_t)(MAX - MIN)` — one subtraction, one comparison,
one branch.

The ffc two-check approach generates 2 branches + 4 instructions with the code scattered
across non-contiguous basic blocks. The unsigned range trick generates 1 branch + 3
instructions with compact, sequential code. For numbers hitting the Clinger fast path
(mantissa ≤ 2^53, exponent in [-22, 22]), this is on the hot code path.

### Files changed

- `ffc/src/ffc.h`: line 231 — changed `ffc_const(..., MIN_EXPONENT_FAST_PATH) <= exponent &&
  exponent <= ffc_const(..., MAX_EXPONENT_FAST_PATH)` to
  `(uint64_t)((int64_t)exponent - (int64_t)ffc_const(value_kind, MIN_EXPONENT_FAST_PATH)) <=
  (uint64_t)((int64_t)ffc_const(value_kind, MAX_EXPONENT_FAST_PATH) - (int64_t)ffc_const(value_kind, MIN_EXPONENT_FAST_PATH))`
- `ffc/ffc.h`: regenerated via `amalgamate.py`

### Benchmark results

**Baseline (post-EXP-009, ARM, confirmed)**:

| Dataset | ffc MB/s | i/f | c/f | IPC | b/f |
|---------|----------|-----|-----|-----|-----|
| canada  | 1519     | 208.55 | 32.03 | 6.51 | 43.32 |
| mesh    | 1254     | 107.70 | 16.38 | 6.57 | 24.29 |
| random  | 1783     | 233.04 | 32.88 | 7.09 | 48.00 |

**EXP-012 ARM (5-run canada, 5-run mesh, 3-run random)**:

| Dataset | ffc MB/s | Δ | i/f | Δ i/f | c/f | IPC | b/f | Δ b/f |
|---------|----------|---|-----|-------|-----|-----|-----|-------|
| canada  | 1534     | **+1.0%** | 206.64 | −1.91 | 31.72 | 6.51 | 41.41 | −1.91 |
| mesh    | 1312     | **+4.6%** | 107.26 | −0.44 | 15.66 | **6.85** | 23.85 | −0.44 |
| random  | 1809     | **+1.5%** | 231.04 | −2.00 | 32.43 | 7.12 | 46.00 | −2.00 |

### Analysis

All three datasets improved with no regressions. The branch count reduction is larger
than the expected "1 branch saved" — specifically −2 for canada and random. This is
because combining the two checks into one also eliminates the intermediate unconditional
jump (`b c7b4` via `b.le ce54`) that the original scattered layout required to chain
the two check blocks together. The compiler, given a single range expression, can lay out
the Clinger path without the intermediate jump.

The mesh improvement is disproportionately large (+4.6%) relative to the instruction
savings (−0.44 i/f). The IPC jump from 6.57→6.85 explains this: more compact code in
the Clinger hot path (mesh numbers mostly hit Clinger: mantissa ≤ 2^53) allows better
out-of-order execution. The CPU can extract more ILP from the denser instruction
sequence.

For canada and random, the savings are more modest because:
- canada: Eisel-Lemire path (large mantissa > 2^53) — still benefits from faster Clinger
  gate check before falling through to Eisel-Lemire
- random: mix of Clinger and Eisel-Lemire — larger branch savings (−2) but smaller IPC
  lift than mesh

### Decision

**ACCEPT** — uniform improvement across all datasets (+1.0% canada, +4.6% mesh,
+1.5% random). No regressions. mesh +4.6% is the largest single-dataset gain since
EXP-009. The unsigned range trick is a standard optimization (used by fast_float) with
no correctness risk.

---

## EXP-011 — 2026-05-26 — Remove `fraction_part_start` field from `ffc_parsed` struct

**Status**: REJECTED
**ffc commit**: (reverted, no commit)

### Hypothesis

`ffc_parsed` is a 72-byte struct. The `fraction_part_start` field is only used by
`ffc_digit_comp` (the slow path) and `ffc_parse_json_number`. Removing it would shrink
the struct to 64 bytes (one cache line), reducing store/load traffic. `ffc_digit_comp`
could reconstruct the pointer as `int_part_start + int_part_len + 1`.

### Files changed

- `ffc/src/parse.h`: removed `fraction_part_start` field; added `has_decimal_point` bool
- `ffc/src/digit_comparison.h`: replaced `num.fraction_part_start` reads with computed
  `int_part_start + int_part_len + 1`
- `ffc/src/ffc.h`: changed `(pns.fraction_part_start == NULL)` to `(!pns.has_decimal_point)`
- `ffc/ffc.h`: regenerated — REVERTED

### Benchmark results

**Pre-EXP-011 baseline (ARM, 5-run)**:

| Dataset | ffc MB/s |
|---------|----------|
| canada  | 1519     |
| mesh    | 1254     |
| random  | 1783     |

**EXP-011 ARM (3-run)**:

| Dataset | ffc MB/s | Δ |
|---------|----------|---|
| canada  | 1405     | **−7.5%** |
| mesh    | 1120     | **−10.7%** |
| random  | 1776     | −0.4% (noise) |

ARM hardware performance counters (canada):
- EXP-011: 11.48 i/B, 34.64 c/f, **6.05 IPC** (vs baseline 11.43 i/B, 32.03 c/f, **6.51 IPC**)

### Root-cause analysis

Despite removing one struct field (eliminating one store and one load per float), the
instruction count INCREASED (+0.4%) and IPC dropped from 6.51 → 6.05. Moving
`fraction_part_len` from offset 56 → 48 changed GCC's addressing patterns for all
struct accesses in `ffc_from_chars_advanced` and `ffc_digit_comp`, causing worse
register allocation and more complex load/store sequences. The compiler generated
longer, less parallel instruction sequences to compensate for the new layout.

Lesson: struct field reordering consistently triggers GCC code-generation regressions
even when the struct shrinks. The compiler has already optimized for the 72-byte layout.
Don't touch struct layout.

### Decision

**REJECT** — uniform regression: −7.5% canada, −10.7% mesh. IPC drop from 6.51→6.05
confirms worse code generation, not a workload mismatch.

---

## EXP-010 — 2026-05-26 — `ffc_cold` attribute on `ffc_parse_infnan` and `ffc_digit_comp`

**Status**: REJECTED
**ffc commit**: (reverted, no commit)

### Hypothesis

`ffc_parse_infnan` is called only on invalid numbers (nan/inf) — a rare code path.
`ffc_digit_comp` is called only when `am.power2 < 0` after Eisel-Lemire — also rare.
Marking both with `__attribute__((cold, noinline))` would tell GCC to move these
functions out of the hot code section, improving I-cache utilization for the hot path.

### Files changed

- `ffc/src/common.h`: added `ffc_cold` macro (`__attribute__((cold, noinline))` on GCC/Clang)
- `ffc/src/parse.h`: changed `ffc_parse_infnan` from `ffc_internal ffc_inline` to `ffc_internal ffc_cold`
- `ffc/src/digit_comparison.h`: changed `ffc_digit_comp` signature to include `ffc_cold`
- `ffc/ffc.h`: regenerated — REVERTED

### Benchmark results

**Pre-EXP-010 baseline (ARM, 5-run)**:

| Dataset | ffc MB/s |
|---------|----------|
| canada  | 1519     |
| mesh    | 1254     |
| random  | 1783     |

**EXP-010 ARM (3-run)**:

| Dataset | ffc MB/s | Δ |
|---------|----------|---|
| canada  | 1374     | **−9.5%** |
| mesh    | 1083     | **−13.7%** |
| random  | 1768     | −0.8% (noise) |

### Root-cause analysis

The `cold` attribute on `ffc_parse_infnan` and `ffc_digit_comp` (both `always_inline`
or called from `always_inline` functions) caused GCC to reorganize basic blocks in
the CALLER functions. GCC's `cold` annotation propagates to caller basic blocks that
invoke the cold function, causing GCC to lay out those blocks outside the hot code
region. Since `ffc_parse_infnan` and `ffc_digit_comp` are force-inlined into the
benchmark loop, this corrupted the hot-path code layout inside `findmax_ffc`.

On x86, a similar regression occurred (−9% to −14% on canada/mesh). The assembled
`findmax_ffc` function grew from 3284 bytes to over 4000 bytes with scattered hot-path
blocks.

Lesson: `cold` attribute on called functions disrupts GCC basic-block layout in their
callers. Never apply `cold` to functions that are inlined (or force-inlined) into
hot-path code. The assembly-level analysis confirmed I-cache degradation as the
primary cause.

### Decision

**REJECT** — catastrophic regression: −9.5% canada, −13.7% mesh. Root cause: cold
attribute reorganizes basic blocks in inlined callers, destroying hot-path I-cache
locality.

---

## EXP-009 — 2026-05-26 — FFC_IMPL_INLINE: force inline via always_inline on declarations

**Status**: ACCEPTED
**ffc commit**: (pending — changes in ffc/src/api.h, ffc/src/ffc.h, ffc/ffc.h)

### Hypothesis

The benchmark's `findmax_ffc` calls `ffc_from_chars_double`, which was calling the
IPA-CP constprop clone `ffc_from_chars_double_options.constprop.0.isra.0` as an
out-of-line function (~6-10 cycles overhead per float). The C++ `findmax_fastfloat`
gets full inlining from templates; `findmax_ffc` didn't because `ffc_from_chars_double`
has external linkage and GCC won't inline it across the linkage boundary.

Root cause: GCC's `ipa_early_inline` pass (which honors `always_inline` on declarations)
runs BEFORE `ipa_cp`. If we mark the forward declarations of `ffc_from_chars_double` and
`ffc_from_chars_double_options` with `__attribute__((always_inline)) inline` (conditional
on `FFC_IMPL` being defined), then when `benchmark.cpp` defines `#define FFC_IMPL` before
`#include "ffc.h"`, `ipa_early_inline` inlines these functions at call sites before IPA-CP
can create constprop clones.

The `FFC_IMPL_INLINE` macro conditionally expands to `__attribute__((always_inline)) inline`
in FFC_IMPL translation units, and to nothing (empty) in non-FFC_IMPL units (preserving
external linkage).

### Files changed

- `ffc/src/api.h`: added `FFC_IMPL_INLINE` conditional macro (lines 118-134); added
  `FFC_IMPL_INLINE` to declarations of `ffc_from_chars_double` and `ffc_from_chars_double_options`
- `ffc/src/ffc.h`: changed `ffc_result ffc_from_chars_double_options(...)` and
  `ffc_result ffc_from_chars_double(...)` definitions to `extern FFC_IMPL_INLINE ffc_result ...`
- `ffc/ffc.h`: regenerated via `amalgamate.py`

### ABI note

`ffc_from_chars_double` and `ffc_from_chars_double_options` have no external symbols
in FFC_IMPL translation units — GCC docs: "An out-of-line version is not generated."
The wrappers `ffc_parse_double`, `ffc_parse_double_simple`, `ffc_from_chars_float`,
`ffc_from_chars_float_options`, and all integer parse functions are still exported.

### Benchmark results

**Baseline (post-EXP-006, x86)**:

| Dataset | ffc MB/s | fastfloat MB/s |
|---------|----------|----------------|
| random  | 1785     | 2018           |
| canada  | 1494     | 1407           |
| mesh    | 1099     | 1124           |

**EXP-009 x86 (5-run)**:

| Dataset | ffc MB/s | Δ vs baseline | vs fastfloat |
|---------|----------|---------------|--------------|
| random  | 1960     | **+9.7%**     | −2.9%        |
| canada  | 1565     | **+4.8%**     | **+11.2% (ffc leads)** |
| mesh    | 1187     | **+8.0%**     | **+5.6% (ffc leads)**  |

**Baseline (post-EXP-006, ARM)**:

| Dataset | ffc MB/s | fastfloat MB/s |
|---------|----------|----------------|
| random  | 1543     | 1085           |
| canada  | 1344     | 891            |
| mesh    | 1030     | 498            |

**EXP-009 ARM (3-run)**:

| Dataset | ffc MB/s | Δ vs baseline | vs fastfloat |
|---------|----------|---------------|--------------|
| random  | 1795     | **+16.3%**    | **+65.4% (ffc leads)** |
| canada  | 1512     | **+12.5%**    | **+69.7% (ffc leads)** |
| mesh    | 1257     | **+22.1%**    | **+152% (ffc leads)**  |

### Analysis

The improvements are uniform across all datasets and both architectures — confirming the
root cause was function-call overhead, not a dataset-specific hot path. The x86 random
result (+9.7%) nearly closes the remaining gap with fastfloat (−13% → −2.9%). On ARM,
all datasets improve by double digits; ffc's lead over fastfloat widens substantially.

`ipa_early_inline` seeing `always_inline` on the forward declarations is the mechanism.
GCC inlines `ffc_from_chars_double` → `ffc_from_chars_double_options` → `ffc_from_chars`
into the benchmark loop before IPA-CP creates the constprop clone. The IPA-CP clone
(`ffc_from_chars_double_options.constprop.0.isra.0`) no longer appears as a symbol in the
EXP-009 binary.

### Decision

**ACCEPT** — uniform improvement across all datasets and architectures. No regressions.
x86 random +9.7% (close to 10% notify threshold), ARM mesh +22.1% (exceeds 10% threshold).

---

## EXP-008 — 2026-05-26 — Cache `ffc_rounds_to_nearest()` result in local variable

**Status**: REJECTED
**ffc commit**: (reverted, no commit)

### Hypothesis

`ffc_rounds_to_nearest()` uses a floating-point comparison (0.5 round-trip) to detect
the FP rounding mode. The call happens on every Eisel-Lemire fast path. Caching the
result in a `static` or local variable would avoid re-executing the FP comparison on
repeated calls, saving ~2-3 instructions per float on the random dataset where
Eisel-Lemire fires for ~90% of inputs.

### Files changed

- `ffc/src/ffc.h`: `ffc_rounds_to_nearest()` result cached in local variable in
  `ffc_from_chars` — REVERTED

### Benchmark results

**Baseline (post-EXP-007, x86)**:

| Dataset | ffc MB/s |
|---------|----------|
| random  | 1785     |

**EXP-008 x86**:

| Dataset | ffc MB/s | Δ |
|---------|----------|---|
| random  | 1763     | **−1.2%** |
| canada  | ~1490    | noise |
| mesh    | ~1095    | noise |

### Root-cause analysis

Out-of-order execution already hides the `ffc_rounds_to_nearest()` FP comparison latency —
the result is not on the critical path because subsequent instructions don't immediately
depend on it. The cache variable (local int) adds an integer load to a critical-path
register, increasing register pressure and slightly displacing an instruction that WAS
on the critical path. Net result: −1.2% regression on random, noise everywhere else.

The OOO speculation insight: on both Intel Xeon and Graviton4, the FP-compare in
`ffc_rounds_to_nearest()` has enough ILP slack (non-critical path) that removing it
provides zero benefit, while adding a new load to hold the cached value adds cost.

### Decision

**REJECT** — x86 random regression −1.2%. OOO speculation already handles this at no cost.

### Lesson

`ffc_rounds_to_nearest()` is not a bottleneck. The OOO engine hides its latency by
executing it in parallel with independent instructions. Any attempt to "cache" it
introduces a new register dependency that costs more than the FP comparison saves.

---

## EXP-007 — 2026-05-26 — Guard 4-digit SWAR with first-byte digit check

**Status**: REJECTED
**ffc commit**: (reverted, no commit)

### Hypothesis

The 4-digit SWAR follow-up in `ffc_loop_parse_if_eight_digits` (EXP-001) always
attempts a 4-byte load + SWAR check after the 8-digit loop. For random [0,1]
numbers with exactly 16 fractional digits (2× 8-digit SWAR cycles), the
character at `*p` after the loop is `'\n'` — not a digit. The 4-byte load and
`ffc_is_made_of_four_digits_fast` call are entirely wasteful.

Adding `ffc_is_integer(**p)` as a guard before the 4-byte load short-circuits
this check using a single byte load + compare (cheaper than a 4-byte load +
SWAR). This should recover the ~2.5% regression EXP-001 caused on random [0,1].

### Root cause of rejection

The guard adds 1 byte load + compare to EVERY 4-digit check where `*p` is a
digit — i.e., every case where the 4-digit SWAR is actually useful (canada/mesh).
For mesh.txt (short numbers, many non-8-multiple digit fractions), the extra load
costs more on ARM's pipeline than the \n-skip saves.

ARM Graviton4 is less aggressive at out-of-order overlap for this specific pattern:
the guard byte load adds to the critical path for the 4-digit → digit → proceed
case. x86 Xeon (deep OOO) can hide this overhead; ARM Graviton4 cannot.

### Benchmark results (vs EXP-006 baseline: random 1747/1555, canada 1445/1332, mesh 1108/1020)

| Dataset | x86 Δ | ARM Δ | Verdict |
|---------|--------|--------|---------|
| random [0,1] | +1.3% (1747→1770) | +2.6% (1555→1598) | positive |
| canada.txt | −0.7% (1445→1435) | −0.9% (1332→1320) | noise |
| mesh.txt | **+3.6% (1108→1148)** | **−3.9% (1020→980 stable, 5-run)** | mixed |

ARM mesh regression is real (5-run stable: 975, 980, 986, 987, 970 MB/s).
Unexpected x86 mesh gain (+3.6%) likely from different code layout improving
branch prediction for the frequent `'\n'`-check path in mesh.

### Files changed

- `ffc/src/parse.h`: changed `pend - *p >= 4` to `pend - *p >= 4 && ffc_is_integer(**p)` — REVERTED

---

## EXP-006 — 2026-05-26 — Local variables in `too_many_digits` path to allow GCC DSE of struct stores

**Status**: ACCEPTED  
**ffc commit**: bac793d

### Hypothesis

In `ffc_parse_number_string`, four fields (`int_part_start`, `int_part_len`,
`fraction_part_start`, `fraction_part_len`) are stored to the `ffc_parsed` answer
struct unconditionally. These same fields are then read back in the rare
`too_many_digits` recovery path (lines 417-429), which forces GCC to keep those
stores live even though:
1. In the non-JSON constprop clone, the caller never reads these fields (removed by ISRA)
2. The reads within the function are the ONLY thing preventing GCC DSE

By restructuring the `too_many_digits` path to use existing local variables
(`start_digits`, `end_of_integer_part`, the hoisted `before`, and a new `frac_end_local`)
instead of reading back from the struct, the stores to `answer.int_part_*` and
`answer.fraction_part_*` become dead within `ffc_parse_number_string` itself.
GCC ISRA + DSE can then eliminate those stores in the non-JSON constprop clone.

### Files changed

- `ffc/src/parse.h`: `ffc_parse_number_string` — hoist `before` and `frac_end_local`
  declarations; restructure `too_many_digits` path to use locals instead of struct reads.

### Benchmark results

**Baseline** (EXP-001, cf971fe, confirmed 5-run):

| Dataset | ffc MB/s (x86) | ffc MB/s (ARM) | fastfloat MB/s (x86) | fastfloat MB/s (ARM) |
|---------|----------------|----------------|----------------------|----------------------|
| random  | 1736           | 1555           | 2018                 | 1076                 |
| canada  | 1414           | 1332           | 1449                 | 885                  |
| mesh    | 1113           | 1019           | 1165                 | 485                  |

**EXP-006 x86** (5-run):

| Dataset | ffc MB/s | Δ vs baseline |
|---------|----------|---------------|
| random  | 1747     | +0.6% (noise) |
| canada  | 1445     | **+2.2%**     |
| mesh    | 1108     | −0.4% (noise) |

**EXP-006 ARM** (3-run):

| Dataset | ffc MB/s | i/f | c/f | IPC | Δ vs baseline |
|---------|----------|-----|-----|-----|---------------|
| random  | 1555     | 276.04 | 37.72 | 7.32 | ±0% (no change) |
| canada  | 1332     | 249.37 | 36.53 | 6.82 | ±0% (no change) |
| mesh    | 1020     | 145.45 | 20.15 | 7.22 | ±0% (no change) |

### Analysis

**x86**: Canada improved +2.2% (1414 → 1445 MB/s). Random and mesh are within noise.
The canada improvement is consistent across 5 runs (σ < 1 MB/s). Canada's Clinger-only
path (all 9-digit mantissas < 2^53) benefits most because the parse path runs completely
through the main digit-scanning block without the Eisel-Lemire call dominating.

**ARM**: Zero change — instruction counts are exactly identical to baseline (276.04/249.37/145.45 i/f).
ARM GCC was already eliminating those stores via ISRA + DSE without any help from
restructuring. The ARM backend's ISRA is more aggressive than x86 GCC's.

**Key insight**: The improvement is x86-specific. ARM already handled these stores
optimally. The change is still worth keeping as it benefits x86 and has no cost anywhere.

### Decision

**ACCEPT** — x86 canada +2.2% (5-run stable), no regressions on any architecture/dataset.
Change kept in `ffc/src/parse.h`.

### Lesson

On x86 GCC, storing struct fields that are later read back within the same function
prevents ISRA+DSE from removing those stores on non-JSON callers. Moving the reads to
use original local variables (which GCC can trivially see as registers) enables DSE.
ARM GCC handles this automatically via more aggressive ISRA. The benefit is architecture-
and compiler-dependent.

---

## EXP-005 — 2026-05-26 — Static const options to force compile-time format specialization

**Status**: REJECTED  
**ffc commit**: reverted to cf971fe (EXP-001 state)

### Hypothesis

`ffc_from_chars_double` calls `ffc_from_chars_double_options` which passes an
`ffc_parse_options` struct (format flags + decimal_point) into `ffc_from_chars` (marked
`ffc_internal ffc_inline`). The hypothesis was that because `ffc_from_chars_double_options`
has external linkage, GCC cannot constant-propagate its `options` argument into the inlined
`ffc_from_chars`, leaving 5–6 dead format-flag branches in the hot path.

Proposed fix: introduce `static ffc_result ffc_from_chars_double_general(...)` with
`static const ffc_parse_options opts = {FFC_PRESET_GENERAL, '.'}`. With a `static const`
local, GCC would see the format flags as compile-time constants and eliminate dead branches.

### Files changed

- `ffc/src/ffc.h`: added `ffc_from_chars_double_general` static function; changed
  `ffc_from_chars_double` to call it instead of `ffc_from_chars_double_options`

### Benchmark results

**Baseline** (EXP-001, cf971fe, confirmed 5-run average):

| Dataset | ffc MB/s | fastfloat MB/s |
|---------|----------|----------------|
| random  | 1736     | 2018           |
| canada  | 1414     | 1449           |
| mesh    | 1113     | 1165           |

**EXP-005 x86**:

| Dataset | ffc MB/s | Δ vs EXP-001 |
|---------|----------|--------------|
| random  | 1673     | −3.6%        |
| canada  | 1338     | −5.4%        |
| mesh    | 993      | **−11%**     |

**EXP-005 ARM** (stable baseline for reference — ARM not fully measured):

| Dataset | ffc MB/s | fastfloat MB/s |
|---------|----------|----------------|
| random  | 1555     | 1076           |
| canada  | 1332     | 885            |
| mesh    | 1019     | 485            |

### Root-cause analysis

**Key discovery: GCC IPA-CP already does this optimization.**

`nm` on the EXP-001 benchmark binary shows:

```
ffc_from_chars_double_options.constprop.0.isra.0  (9888 bytes)
```

GCC's interprocedural constant propagation (`-fipa-cp`, enabled at `-O3`) automatically creates
a specialized clone of `ffc_from_chars_double_options` when it is called with a constant
`ffc_parse_options_default()` value. Assembly inspection shows the clone starts identically to
the EXP-005 static function — both have format-flag checks already eliminated in their first
40+ instructions.

`nm` on EXP-005 binary shows:

```
ffc_from_chars_double_general  (10064 bytes)
```

The sizes are nearly identical (9888 vs 10064 bytes), confirming that EXP-005 produced no
structural improvement over what GCC was already doing in EXP-001.

**Why it regressed**: the `static` function has internal linkage, which changed GCC's inlining
decisions slightly. The differently-named symbol produced a slightly different code layout
causing I-cache pressure on x86, especially on mesh (shortest inputs, highest call:work ratio).

**The 276 vs 252 i/f gap** (ffc vs fastfloat on ARM random) is NOT from format-flag checks.
Those are already eliminated. The gap is from structural differences (storing `int_part_*` and
`fraction_part_*` fields to `ffc_parsed` unconditionally, plus Clinger fast-path differences).

### Decision

**REJECT** — x86 regressed up to −11% on mesh. Root cause: GCC IPA-CP already performs the
intended optimization in EXP-001; EXP-005 merely produces a slightly different code layout.

### Lesson / Known Non-Starter

**GCC already constant-propagates `ffc_parse_options_default()` via IPA-CP.** Any experiment
attempting to "help" the compiler see the format flags as constants is redundant — the compiler
already does this. The constprop clone (`ffc_from_chars_double_options.constprop.0.isra.0`) IS
the hot path. Do not attempt static-specialization or constant-opts approaches.

The actual source of the 24 i/f gap vs fastfloat (ARM random) is:
1. Unconditional stores of `int_part_*`/`fraction_part_*` to `ffc_parsed` (needed for
   `too_many_digits` path — GCC cannot DSE them; confirmed by `cmp $0x13,%r8` in assembly)
2. Structural differences in the Clinger fast-path implementation

---

## EXP-004 — 2026-05-26 — `__builtin_expect` branch hints on 4 hot branches

**Status**: REJECTED  
**ffc commit**: reverted to cf971fe (EXP-001 state)

### Hypothesis

Adding `__builtin_expect(..., 0)` to 4 unlikely branches in `ffc.h` (the sign-detection,
decimal-point, exponent-char, and fallback-path branches) would let GCC lay out hot code
linearly, reducing branch-not-taken penalties and improving I-cache efficiency.

### Files changed

- `ffc/src/ffc.h`: `__builtin_expect(..., 0)` added to 4 branch conditions in `ffc_from_chars`

### Benchmark results

**Baseline** (EXP-001, cf971fe):

| Dataset | ffc MB/s (ARM) |
|---------|----------------|
| random  | 1552           |
| canada  | 1332           |
| mesh    | 1019           |

**EXP-004 ARM**:

| Dataset | ffc MB/s | Δ vs EXP-001 |
|---------|----------|--------------|
| random  | 1484     | **−4.4%**    |
| canada  | 1237     | **−7.2%**    |
| mesh    | ~1010    | ~−1% (noise) |

### Root-cause analysis

`__builtin_expect` moved cold branch targets out-of-line, increasing the total size of the
inlined function body in the benchmark's hot loop. This created I-cache pressure on the
benchmark's per-float call site.

The pattern mirrors EXP-003: any change that increases the size of the inlined call sequence
(even by rearranging code, not adding instructions) degrades performance through I-cache effects.
The canada dataset showed the strongest regression (−7.2%) because it exercises the most
code paths per float (2-digit integer + 5-digit fraction = most branches taken).

### Decision

**REJECT** — ARM canada regressed −7.2%, ARM random −4.4%. I-cache pressure from increased
inlined function body size.

### Lesson / Known Non-Starter

`__builtin_expect` that moves cold blocks out-of-line increases the inlined function body size
and causes I-cache regressions on these benchmarks. The hot path is already nearly linear in
EXP-001 due to GCC's own profiling-free heuristics. Adding branch hints counteracts GCC's
default layout choices and hurts I-cache performance. **Do not apply `__builtin_expect` to
branches within `ffc_from_chars` or its call tree.**

---

## EXP-003 — 2026-05-26 — Constant-format specialization via `ffc_from_chars_double` restructure

**Status**: REJECTED  
**ffc commit**: reverted to cf971fe (EXP-001 state)

### Hypothesis

`ffc_from_chars_double` is a tiny 3-line wrapper that calls `ffc_from_chars_double_options`
(an external-linkage function). The external call boundary prevents constant-propagation of
`FFC_PRESET_GENERAL` into the inner parser. Format-check branches (JSON mode, Fortran, whitespace
skip, leading-plus) remain runtime checks even though they are always-false for the standard path.

Bypassing `ffc_from_chars_double_options` and calling the `ffc_internal ffc_inline`
`ffc_from_chars` directly from `ffc_from_chars_double` (with a locally-constant `opts.format =
FFC_PRESET_GENERAL`) would allow GCC to constant-fold the format, eliminate 5–6 dead branches
per call, and save 5–10 instructions per float.

### Files changed

- `ffc/src/ffc.h`: `ffc_from_chars_double` (call chain restructure)

### Profiling evidence before EXP-003

ARM perf annotate on isolated micro-benchmark:
- 13.8% at Eisel-Lemire core multiply setup
- 9.07% at exponent range check
- ffc random: 276 i/f, fastfloat: 252 i/f (24 extra instructions = format checks + struct overhead)

### Benchmark results

**Same-session ARM EXP-001 baseline** (rebuilt from cf971fe, 2.80 GHz):

| Dataset | ffc MB/s | i/f | c/f | IPC |
|---------|----------|-----|-----|-----|
| random  | 1557     | 276 | 37.68 | 7.33 |
| canada  | 1332     | 249 | 36.56 | 6.82 |
| mesh    | 1019     | 145 | 20.16 | 7.21 |

**EXP-003 ARM** (3-run average at 2.80 GHz):

| Dataset | ffc MB/s | i/f | c/f | IPC | Δ vs EXP-001 |
|---------|----------|-----|-----|-----|--------------|
| random  | 1547     | 284 | 37.92 | 7.49 | −0.6% (noise) |
| canada  | 1317     | 255 | 37.0  | 6.90 | **−1.1%** |
| mesh    | 961      | 146 | 21.5  | 6.78 | **−5.7%** |

**EXP-003 x86** (Intel Xeon Platinum 8488C, 3-run average):

| Dataset | ffc MB/s | Δ vs EXP-001 |
|---------|----------|--------------|
| random  | 1722     | −0.3% (noise) |
| canada  | 1411     | −0.1% (noise) |
| mesh    | 1100     | +2.5% |

### Root-cause analysis

The constant-folding did NOT happen as expected. The instruction count INCREASED on ARM:
- Random: 276 → 284 i/f (+8)
- Canada: 249 → 255 i/f (+6)
- Mesh: 145 → 146 i/f (≈same)

More critically, mesh IPC DROPPED: 7.21 → 6.78 i/c (−5.9%), causing the MB/s regression.

**The real failure**: making `ffc_from_chars_double` large (by inlining the full parsing logic into it)
disrupted GCC's inlining decision at the **benchmark call site**. In EXP-001:
- `ffc_from_chars_double` = 3 lines → GCC trivially inlines it into the benchmark loop
- `ffc_from_chars_double_options` is the hot function (compiled separately, well-optimized)

In EXP-003:
- `ffc_from_chars_double` ≈ 3500 bytes → GCC does NOT inline it into the benchmark
- Per-call function-call overhead on every benchmark iteration
- Especially bad for mesh (short inputs, high call:work ratio)

The dead code was NOT eliminated either — the optimizer did not constant-fold through struct
field assignment for `opts.format = FFC_PRESET_GENERAL` into the always_inline `ffc_from_chars`.

### Decision

**REJECT** — ARM mesh regressed −5.7%, ARM canada −1.1%. Root cause is clear: the approach of
making `ffc_from_chars_double` large breaks GCC's inlining heuristics for the benchmark's hot loop.

### Lesson / Known Non-Starter

Any change that makes `ffc_from_chars_double` large (inlining the full parsing logic into it)
will prevent GCC from inlining it into the benchmark loop and degrade performance on short inputs.
**The public API functions must remain tiny wrappers.**

To achieve constant-format specialization, the right approach would be:
- Add `__attribute__((flatten))` or similar to `ffc_from_chars_double_options` to force inlining
  of ALL callees into it (so the compiler sees constant folding opportunities within one function)
- Or: change the benchmark to call a `ffc_inline` variant directly

---

## EXP-002 — 2026-05-26 — 2-digit SWAR follow-up + integer-part SWAR

**Status**: REJECTED  
**ffc commit**: reverted to cf971fe (EXP-001 state)

### Hypothesis

After the 4-digit SWAR follow-up (EXP-001), the remaining byte-by-byte path handles
the residual 1–3 fractional digits plus the entire integer part. Adding:
(a) a 2-digit SWAR helper after the 4-digit block (covering 5–7-digit fractions fully),
(b) `ffc_loop_parse_if_eight_digits` applied to the integer part before the byte-by-byte loop
would eliminate the remaining scalar digit iterations and improve all three datasets.

### Files changed

- `ffc/src/parse.h`: `ffc_loop_parse_if_eight_digits` (2-digit block), `ffc_parse_number_string` (integer part loop)

### Benchmark results

**Pre-EXP-002 baseline** = EXP-001 post-results (cf971fe):

| Dataset  | x86 MB/s (EXP-001) | ARM MB/s (EXP-001) |
|----------|--------------------|--------------------|
| random   | 1728               | 1558               |
| canada   | 1412               | 1331               |
| mesh     | 1073               | 1019               |

**EXP-002 results** (approximate — exact output not archived; binary reverted on regression):

| Dataset  | x86 MB/s | Δ x86  | ARM MB/s | Δ ARM   |
|----------|----------|--------|----------|---------|
| random   | ~1410    | **−18%** | ~1363  | **−12%** |
| canada   | ~1282    | **−9%**  | ~1236  | **−7%**  |
| mesh     | ~1007    | **−6%**  | ~925   | **−9%**  |

ARM hardware performance counters (random dataset):
- instructions/float: 276 → 335 (+21%) — pure overhead, no extra work done

### Root-cause analysis

The integer part of random numbers in the benchmark dataset is exactly `0` —
the inputs are all `"0.xxxxxxxxxxxxxx"`. Adding `ffc_loop_parse_if_eight_digits`
before the byte-by-byte integer loop means the CPU executes 3 failed SWAR probes
per float **before** seeing any digits:

1. `while (pend - *p >= 8)` → 8-byte probe on `"0."` → `ffc_is_made_of_eight_digits_fast` fails (`.` is not a digit)
2. `if (pend - *p >= 4)` → 4-byte probe on `"0."` → fails
3. The 2-digit probe (new in EXP-002): fails

Each failed probe costs ~5–7 instructions (load + mask + compare + branch). That's
~15–21 instructions of pure overhead per float against a byte-by-byte loop that takes
only 4 instructions for a single-digit integer part. ARM counter confirms: +21% i/f.

For canada inputs (e.g. `73.xxxxx`), the integer part has 2 digits — 8-digit and 4-digit
probes still fail, adding ~10–14 instructions overhead before byte-by-byte handles 2 digits.

The fractional 2-digit follow-up itself is harmless, but it was never the bottleneck —
the real problem was applying SWAR to the integer part on inputs where SWAR never fires.

### Decision

**REJECT** — severe regression on all datasets (up to −18%). Root cause fully understood.

### Lesson / Known Non-Starter

SWAR checks on the integer part are a net loss when the integer part is ≤ 2 digits long
(random: 1 digit; canada: 2 digits). Adding `ffc_loop_parse_if_eight_digits` to integer
scanning before a byte-by-byte loop will always regress on these datasets. **Do not apply
SWAR probes to the integer part in this benchmark suite.**

---

## EXP-001 — 4-digit SWAR follow-up in ffc_loop_parse_if_eight_digits

**Date**: 2026-05-26  
**Status**: ACCEPTED  
**ffc commit**: cf971fe

### Hypothesis

Numbers with 5–7 significant fractional digits (canada.txt, mesh.txt format) never trigger
the 8-digit SWAR loop in `ffc_loop_parse_if_eight_digits` because `pend - p < 8`. All
digits fall through to byte-by-byte iteration. The existing `ffc_parse_four_digits_unrolled`
and `ffc_is_made_of_four_digits_fast` functions in parse.h were dead code on the hot path.

A 4-digit SWAR follow-up after the 8-digit loop converts 7 byte-by-byte iterations into
1×SWAR-4 + 3 byte-by-byte for 7-digit fractions — roughly 43% fewer digit-scanning operations.
Also fixed a double-read of `ffc_read8_to_u64(*p)` in the 8-digit loop (read-once, use twice).

### Files changed

- `ffc/src/parse.h`: `ffc_loop_parse_if_eight_digits`

### Benchmark results

#### Laptop (developer machine — discovery runs only)

**Baseline** (20260526-161003):

| Dataset | ffc MB/s | fastfloat MB/s | gap |
|---------|----------|----------------|-----|
| random  | 2106     | 2452           | -14% |
| canada  | 1049     | 1480           | -29% |
| mesh    | 836      | 933            | -10% |

**EXP-001, run 1** (20260526-161706):

| Dataset | ffc MB/s | fastfloat MB/s | gap |
|---------|----------|----------------|-----|
| random  | 2081     | 2525           | -18% (noise) |
| canada  | 1354     | 1381           | -2% |
| mesh    | 988      | 1054           | -6% |

**EXP-001, run 2** (20260526-161732):

| Dataset | ffc MB/s | fastfloat MB/s | gap |
|---------|----------|----------------|-----|
| random  | 1977     | 2234           | -12% (noise) |
| canada  | 1676     | 1773           | -5% |
| mesh    | **1095** | **1036**       | **+5% (ffc wins!)** |

#### x86 metal — Intel Xeon Platinum 8488C (m7i.metal-24xl)

**Baseline** (20260526-154529, commit 531a6f2):

| Dataset | ffc MB/s | fastfloat MB/s | gap |
|---------|----------|----------------|-----|
| random  | 1772     | 2057           | -14% |
| canada  | 1299     | 1439           | -10% |
| mesh    | 1048     | 1218           | -14% |

**Post-EXP-001** (20260526-153854, commit cf971fe):

| Dataset | ffc MB/s | fastfloat MB/s | gap | Δ vs baseline |
|---------|----------|----------------|-----|---------------|
| random  | 1728     | 2020           | -14% | ±0% (noise) |
| canada  | 1412     | 1453           | -3%  | **+8.7%** |
| mesh    | 1073     | 1131           | -5%  | **+2.4%** |

#### ARM metal — Graviton4 (m8g.metal-24xl)

**Baseline** (20260526-154529, commit 531a6f2):

| Dataset | ffc MB/s | fastfloat MB/s | gap |
|---------|----------|----------------|-----|
| random  | 1616     | 1098           | **+47% (ffc leads)** |
| canada  | 1216     | 919            | **+32% (ffc leads)** |
| mesh    | 956      | 486            | **+97% (ffc leads)** |

**Post-EXP-001** (20260526-153854, commit cf971fe):

| Dataset | ffc MB/s | fastfloat MB/s | gap | Δ vs baseline |
|---------|----------|----------------|-----|---------------|
| random  | 1558     | 1088           | +43% | -4% (noise) |
| canada  | 1331     | 895            | +49% | **+9.5%** |
| mesh    | 1019     | 501            | +103% | **+6.5%** |

### Analysis

**x86**: EXP-001 closes the gap with fastfloat on canada (−14% → −3%) and mesh (−14% → −5%).
Random unaffected — those numbers have 14-17 fractional digits, 8-digit SWAR already fires.

**ARM**: ffc already led fastfloat across all datasets at baseline (likely due to Graviton4's
efficient barrel-shift and bitfield instructions that SWAR benefits from). EXP-001 extended the
lead further on canada (+9.5%) and mesh (+6.5%). Random shows slight noise-level regression
(−4%) from the extra 4-digit check on a path where it never triggers.

**Overall**: The 4-digit follow-up is a clear win on both architectures for structured float
inputs (canada, mesh). No meaningful regression on random.

### Token cost

N/A — experiment run inline (no ANTHROPIC_API_KEY; OAuth token not valid for API endpoint).
Analysis performed directly in Claude Code session. Benchmark results tracked in bench-results/.
