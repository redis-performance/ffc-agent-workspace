# EXP-065 — Apple M6 setup and compiler target sweep

**Decision: Parked.** Keep `-march=native` as the default. Explicit M6 targeting
helps some cases, but double canada is consistently slightly lower, and mesh
varies across runs. No universal compiler-target win was established.

## Measurement

Apple M6, Apple Clang 21, `-O3 -g -DNDEBUG -DFFC_ROUNDS_TO_NEAREST`.
Five interleaved runs per target; each reported throughput is the upstream
harness best of 100 repetitions. The table takes the median of those five
best-throughput results, not the median of all individual timing samples.
The harness labels MiB/s as MB/s; its `+/-` column is mean-vs-best timing gap,
not a confidence interval. No build/profile ran concurrently with benchmarks.
Random generators are unchanged; file dataset hashes and all binary hashes
are recorded in the raw logs. Only ASCII fastfloat rows are scored.

| Precision / dataset | Baseline MB/s / Mfloat/s | M6 MB/s / Mfloat/s | Change |
|---|---:|---:|---:|
| double / canada.txt | 2771.73 / 159.28 | 2753.97 / 158.26 | -0.64% |
| double / mesh.txt | 2855.55 / 389.00 | 2916.39 / 397.29 | +2.13% |
| double / random [0,1] | 3495.83 / 166.62 | 3482.05 / 165.96 | -0.39% |
| float / canada.txt | 2466.51 / 141.74 | 2486.20 / 142.87 | +0.80% |
| float / mesh.txt | 1680.06 / 228.87 | 1747.61 / 238.07 | +4.02% |
| float / random [0,1] | 3140.06 / 149.66 | 3141.43 / 149.73 | +0.04% |

`-mcpu=native` selects apple-m4 locally and is largely flat; full numbers and
ranges are in [summary.json](summary.json).

## Profile

Five-second, ffc-only float32 mesh profiles using the CPU Counters template.
The export contains time samples; hardware bottleneck counters were NOT
established. Percentages below are self sampled time, module `ffc-profile-float`.

| Symbol | Existing target | apple-m6 |
|---|---:|---:|
| ffc_parse_number_string | 44.10% | 44.66% |
| ffc_compute_float | 9.75% | 11.41% |
| ffc_loop_parse_if_eight_digits | 4.32% | 4.44% |

Both profiles spent >99% of sampled time on Super cores. Digit scanning remains
dominant; no clear bottleneck shift supports promoting the target flag.
Raw traces stay local (ignored); reproducible text reports and provenance are
in profile-results/. The first diagnostic double trace had missing debug symbols
and is superseded by the symbolized float traces used above.

## Correctness and readiness

- ffc unit/integer/format tests pass, including 274,944 format checks.
- ffc supplemental corpus passes on restored upstream code.
- fast_float core and supplemental suite: 15/15 pass.
- Both benchmark precisions build and all benchmark invocations succeed.
- No parser source change retained. Setup scripts are infrastructure changes,
  not a claimed parsing optimization.
- See [dependency-versions.json](dependency-versions.json) for exact source and
  tool versions and [../APPLE-M6-SETUP.md](../APPLE-M6-SETUP.md) for reproduction.
