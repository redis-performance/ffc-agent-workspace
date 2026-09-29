# EXP-066 — Native digit accumulation on Apple Clang

**Decision: Parked; source reverted.** This is a promising candidate, not an
accepted optimization. Double canada improves materially, but double mesh is
slightly slower and all-Apple gating is broader than the M6 evidence.

Candidate: exclude `__APPLE__` from the Clang/AArch64 forced shift/add helper.
Plain C `acc*10+d` then lets the compiler select the instruction sequence.
Both builds use `-mcpu=apple-m6`; this isolates the source change from EXP-065.
The exact source patch is [candidate.patch](candidate.patch).

## Benchmark

Three interleaved runs per build, both precisions, all three datasets.
Same timing methodology and limitations as EXP-065; no concurrent builds.

| Precision / dataset | Baseline MB/s / Mfloat/s | Candidate MB/s / Mfloat/s | Change |
|---|---:|---:|---:|
| double / canada.txt | 2751.68 / 158.13 | 3029.56 / 174.10 | +10.10% |
| double / mesh.txt | 2943.08 / 400.93 | 2915.07 / 397.11 | -0.95% |
| double / random [0,1] | 3485.19 / 166.11 | 3601.60 / 171.66 | +3.34% |
| float / canada.txt | 2468.48 / 141.86 | 2505.66 / 143.99 | +1.51% |
| float / mesh.txt | 1725.82 / 235.10 | 1744.77 / 237.69 | +1.10% |
| float / random [0,1] | 3145.95 / 149.94 | 3142.02 / 149.76 | -0.12% |

Double mesh has substantial run spread; its -0.95% median change is unresolved,
not proof of a permanent regression. It prevents claiming the required
no-regression result from this small sample. Float random is effectively flat.

## Profile

Five-second Time Profiler runs on double canada. Self sample percentages:

| Symbol (module ffc-profile-double) | Baseline | Candidate |
|---|---:|---:|
| ffc_parse_number_string | 44.82% | 44.96% |
| ffc_loop_parse_if_eight_digits | 7.27% | 4.06% |
| ffc_compute_float | 17.36% | 18.68% |

The scan remains dominant. Less relative time appears in the eight-digit helper,
while conversion takes a greater share; percentages alone do not establish
absolute cycles saved or a hardware stall cause. These samples include inline
frames, and the separate profile driver adds full-input validation.
Both profiles ran predominantly on Super cores. Text summaries/provenance are
in profile-results/; local trace bundles and raw XML are ignored.

## Correctness / next experiment

Candidate passed `make -C ffc test` before benchmarking. No exhaustive sweep or
cross-platform campaign was run because this candidate was not accepted.
After restoring source and regenerating the amalgam, upstream tests and the
supplemental corpus passed again.

Next: isolate native accumulation at integer, fractional-tail, and exponent
sites, and retest mesh with tighter control over layout/core placement. Avoid
changing every Apple chip based solely on M6 measurements. Preserve the
Graviton path unless independent evidence supports changing it.
