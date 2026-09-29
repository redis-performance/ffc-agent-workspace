# EXP-067 — Isolate native digit accumulation by source site

**Decision: Parked.** Integer and fraction substitutions regress float mesh;
the exponent substitution has a smaller unresolved float mesh loss. All source
changes were reverted. EXP-068 and EXP-069 follow the exponent signal.

Apple M6, Apple Clang 21, upstream ffc `965d4db`, fast_float `9498cc3`, benchmark
`a856c09`. All builds use `-mcpu=apple-m6 -O3 -DFFC_ROUNDS_TO_NEAREST`.
Replace the forced AArch64 assembly with native C arithmetic at only the integer,
fraction-tail, or exponent site, under Apple/Clang/AArch64 guards. The three
independent patches are in `variants/`.

## Benchmark and correctness

Each variant passed `make -C ffc test` before benchmarking (unit, integer,
274,944 format checks). Five interleaved runs per build, both precisions, all
three datasets, 100 harness repetitions. Runs were sequential, without builds
or profiles competing for CPU. Reported throughput is the median of the
harness's best-of-100 values, not an average of all repetitions. MB/s is the
harness's MiB/s label. Its +/- statistic is not a confidence interval.

| Variant | Double random / canada / mesh | Float random / canada / mesh |
|---|---:|---:|
| integer | +1.04% / +4.35% / -0.52% | -0.76% / -1.13% / -6.73% |
| fraction | -1.05% / +3.45% / -0.04% | -0.50% / +0.14% / -3.62% |
| exponent | +2.68% / -0.11% / +2.47% | +1.22% / -0.09% / -1.24% |

[Full MB/s and Mfloat/s table](benchmark-table.md). `summary.json` includes the
untouched ASCII fast_float control and min/max across runs. Raw logs retain
source diff hashes, compiler flags, dataset hashes and binary hashes.

An initial exponent patch-generation error selected the wrong end marker and
duplicated source. The compile failure was corrected before measurement; only
the corrected, passing variant is benchmarked. The builders now search for the
end marker after the start and force amalgamation to avoid same-second mtime
ambiguity. Disassembly is retained alongside the logs.

## Profile

Five-second Time Profiler runs using `scripts/run-profile.sh`, double precision,
fixed scientific-notation input. Module: `ffc-profile-double`.

| Self symbol | Baseline | Exponent variant |
|---|---:|---:|
| ffc_parse_number_string | 39.40% | 37.40% |
| ffc_compute_float | 18.09% | 19.92% |
| ffc_loop_parse_if_eight_digits | 9.74% | 12.21% |

99.64% and 99.68% of samples, respectively, were on S cores. These are relative
time samples, not hardware counters or absolute cycle savings. Scanner self
share falls, but its inclusive share rises from 56.68% to 57.76%; attribution to
inlined helpers varies. This supports investigating the site, without proving a
hardware bottleneck explanation. Scanning remains dominant. See `profile-results/`.

Canada and mesh contain no explicit exponents; the harness's random input uses
scientific notation. The mesh change therefore motivates code-layout/register
allocation investigation, rather than assuming a slower exponent calculation on
that dataset. Those causes remain hypotheses.

## Reproduce

Start from a clean ffc checkout at the recorded pin and the dependencies installed
in [the M6 setup](../APPLE-M6-SETUP.md). `python3 experiments/EXP-067/build-variants.py`
builds all three variants serially and restores source in `finally`. It reuses
the `march-native/_deps` dependency source directories. Build directories are
`apple-m6` (baseline) and `m6-site-{integer,fraction,exponent}` beneath
`simple_fastfloat_benchmark/build`.

Run `scripts/run-bench.sh` with `COMPILER=clang`, an absolute `BUILD_DIR`,
`EXP=EXP-067`, a distinct `RUN_LABEL`, and `PRECISION=both`. Rotate baseline and
variants across five rounds, reversing the order on alternate rounds.
`python3 experiments/EXP-067/summarize.py experiments/EXP-067` regenerates the
summary from raw logs; it selects the first ASCII fast_float row only.

The fixed profile corpus is generated with Python `random.Random(20260929)`:
100,000 calls to `random()`, each formatted as `.16e` plus newline. Pass its path
as `PROFILE_DATA`, with `PROFILE_SECONDS=5`. Before profiling a variant, apply
its patch to ffc and run `make -B -C ffc ffc.h`; the profile script verifies that
source matches build provenance. Reverse the patch and regenerate afterward.
