# EXP-072 — Apple M6 ASCII digit scanning

**Decision: Parked direction; no parser change accepted.** NEON accelerates
scientific input, but the short-input regressions repeat. Compact scalar
scanning and the outlined NEON helper are rejected implementations. Both
parser sources are restored to upstream. This experiment is independent of
EXP-070 float inlining, which the user is validating on Intel, AMD and AWS ARM.

## Hypothesis and variants

The existing AArch64/Clang scanner processes two eight-digit SWAR blocks per
loop iteration. That shape was tuned on an older compiler/Graviton combination.
On M6, the helper still accounts for roughly 8–15% of scientific-input time
samples in recent profiles. Existing NEON helpers handle UTF-16, not ASCII.

Four variants, all against the same upstream baseline:

1. **Compact scalar:** use the existing generic eight-digit loop on Apple,
   leaving the four-digit follow-up intact.
2. **NEON16:** when at least 16 bytes remain, validate and convert 16 ASCII
   digits using NEON; retain the existing two-block scalar path on failure.
3. **Compact NEON16:** on failed 16-byte validation, use the shared eight-/four-
   digit remainder path instead of retaining the duplicated two-block fallback.
4. **Outlined NEON16:** move vector conversion into a noinline helper returning
   the converted chunk, or UINT64_MAX for invalid input. Accumulation stays in
   the caller; valid 16-digit chunks cannot collide with that sentinel.

The vector conversion subtracts ASCII zero, rejects any lane greater than nine,
then groups decimal digits using widened multiply/pairwise-add stages. Pair,
quad and octet values fit their lane widths. Accumulation remains unsigned
64-bit arithmetic, with the same intentional modulo-2^64 behavior as SWAR.
The existing scanner handles invalid chunks and short remainders.

Experimental changes select Apple/AArch64/Clang only. They are not enabled on
AWS ARM or x86 by these patches, and there is no all-Apple performance claim.
The fallback and generic compiler paths remain intact. Exact patches are in
`variants/`; only `ffc/src/parse.h` was edited, followed by forced amalgamation.

## Correctness

Every variant passed `make -C ffc test` before benchmarking, including the
274,944 formatting checks, and passed the supplemental corpus. The separate
`check-scan.c` test provides:

- 529,416 comparisons of the scanning helper against an independent scalar
  oracle, checking both consumed bytes and accumulator value. It covers lengths
  0–128, multiple accumulator seeds including UINT64_MAX, and invalid bytes at
  every position, including NUL and high-bit bytes.
- Buffers adjacent to inaccessible pages at both ends, including unaligned
  input endings and ranges without a terminating NUL.
- 21,728 public float/double parses of fractional strings with up to 96 digits,
  valid/invalid suffixes, and four rounding modes, compared by fingerprint to
  the baseline.

All four variants and baseline report:

```
checks=551144 fingerprint=f1a2fa492f7ee615
```

All three NEON variants also pass AddressSanitizer and UndefinedBehaviorSanitizer
with the same output. This is targeted coverage, not a full IEEE floating-point
exhaustive sweep. Sanitized binaries are never benchmarked.

## Benchmark

Apple M6, Apple Clang 21, `-mcpu=apple-m6 -O3 -DFFC_ROUNDS_TO_NEAREST`.
Upstream pins: ffc `965d4db`, fast_float `9498cc3`, benchmark `a856c09`.
fast_float stays unchanged as the control; only its first ASCII row is scored.

Discovery: five interleaved runs each for upstream, compact scalar and NEON16.
Confirmation: seven new interleaved runs each for upstream, NEON16 and compact
NEON16. Outlining: five new paired runs of upstream and outlined NEON16.
Both precisions and all three datasets; the unchanged harness uses 100
repetitions per dataset. Runs, builds and profiles are sequential.

| Cohort / variant | Double random / canada / mesh | Float random / canada / mesh |
|---|---:|---:|
| discovery / compact scalar | -5.88% / -2.15% / -5.24% | -0.87% / -0.22% / -0.28% |
| discovery / NEON16 | +14.77% / +3.48% / -2.41% | +5.19% / -0.11% / -1.21% |
| confirmation / NEON16 | +14.68% / +3.41% / -6.12% | +5.16% / -1.02% / +0.81% |
| confirmation / compact NEON16 | +16.84% / -2.31% / -12.11% | +9.60% / -0.36% / -1.63% |
| outlining / outlined NEON16 | +5.17% / -6.95% / -9.00% | +2.67% / -2.92% / -6.55% |

Full MB/s and Mfloat/s tables: [discovery](benchmark-table.md),
[confirmation](confirmation/benchmark-table.md), [outlining](outlined/benchmark-table.md).
Each directory has raw logs and a JSON summary including controls and run spread.
Numbers are medians of the harness's best-of-100 throughput, not means of all
repetitions. MB/s is the harness's MiB/s label; its +/- is not a confidence interval.

The scientific-input signal repeats. The double mesh losses also repeat and
grow in confirmation; fast_float's double mesh control is essentially flat
(-0.04%/-0.05%). These losses cannot be dismissed as shared machine drift.

## Code generation and profile

Double `findmax_ffc` contains 800 instructions at baseline, 750 for compact
scalar, 859 for NEON16, and 799 for compact NEON16. Smaller code alone does not
predict throughput. Compact NEON16 increases the stack frame from 240 to 288
bytes and keeps vector constants live across the parsing loop, with vector
spills around a call. This motivated outlining, but that change did not resolve
the short-input losses. Register allocation and layout remain hypotheses;
stack-frame size alone does not prove a per-value cost.

Five-second Instruments Time Profiler runs, double precision, fixed scientific
corpus and mesh. All symbols below are in module `ffc-profile-double`:

| Scientific input, self symbol | Baseline | NEON16 | Compact NEON16 |
|---|---:|---:|---:|
| ffc_parse_number_string | 38.60% | 44.88% | 41.33% |
| ffc_compute_float | 20.45% | 21.80% | 20.44% |
| ffc_loop_parse_if_eight_digits | 8.39% | 3.90% | 3.72% |
| ffc_parse_sixteen_ascii_neon | absent | 3.00% | 5.02% |

Scalar-helper share decreases and the vector helper appears as expected, but
the outer scanner remains dominant. Inclusive inline attribution overlaps;
these are relative time samples, not hardware counters or absolute cycles saved.
Both inline variants and the baseline observed >99% S-core samples.

Mesh scanner self share is 57.21% → 57.63%/57.70%; eight-digit helper share is
3.94% → 4.53%/8.74% (NEON16/compact NEON16). This is a remaining short-input
bottleneck, not a diagnosed microarchitectural cause. Outlining reduces the
benchmark wrapper to 752 instructions, excluding the separate helper. Its
scientific profile assigns 11.51% self time to the scanning loop and 7.32% to
the vector helper; on mesh the loop rises to 14.28%. Both runs observe >99.6%
S-core samples. Separating the call did not remove the regression.

## Reproduce / next exploration

From the clean recorded ffc pin and the local caches described in
[M6 setup](../APPLE-M6-SETUP.md):

```sh
python3 experiments/EXP-072/build-variants.py
python3 experiments/EXP-072/run-checks.py
```

Both scripts restore source on exit. They can also take selected variant names.
Builds live under `simple_fastfloat_benchmark/build/m6-scan-*`. Follow EXP-067's
benchmark/profile procedure with `EXP=EXP-072`, `EXP=EXP-072/confirmation`, or
`EXP=EXP-072/outlined`; profiles require the corresponding patch applied and
the amalgam regenerated. The profile corpus uses Python seed 20260929 and
100,000 `.16e` random values, as in EXP-067.

Next priority: profile-guided layout with separate training and held-out input
sets, comparing all six cells and preserving the short-input path. A second
useful direction is a dedicated long-input path whose dispatch and live state
do not burden common short numbers. Do not stack this experiment with EXP-070
until the latter's independent cross-platform results are available.
