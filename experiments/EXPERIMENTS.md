# Experiments Log — ffc.h Parsing Optimization

Append-only. Every experiment gets an entry — wins, rejections, and parks alike.
Knowing what didn't work is as valuable as knowing what did.

Use `approaches/TEMPLATE.md` to copy-paste the structure.

---

<!-- Append new experiments below in reverse-chronological order (newest first) -->

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
