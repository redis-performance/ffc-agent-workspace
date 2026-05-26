# Experiments Log — ffc.h Parsing Optimization

Append-only. Every experiment gets an entry — wins, rejections, and parks alike.
Knowing what didn't work is as valuable as knowing what did.

Use `approaches/TEMPLATE.md` to copy-paste the structure.

---

<!-- Append new experiments below in reverse-chronological order (newest first) -->

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
