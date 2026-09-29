# EXP-070 Linux validation — 2026-09-29

**Decision: remains parked (partial win).** Correctness and linkage passed on Intel, AMD and ARM. Float gains reproduce on every dataset. A strict no-regression acceptance is not established: AMD double random decreases about 0.45% in two independent seven-round campaigns; Intel double mesh decreases 0.46% and 0.82%. The earlier Apple M6 double-mesh decrease (1.61%) remains unresolved. No upstream PR was opened.

## Hosts and method

| Label | CPU | Compiler / tuning | Campaigns |
|---|---|---|---|
| intel-2 | Xeon Platinum 8488C, Sapphire Rapids | Clang 18.1.3, `-march=native` | seven rounds on CPU 3, seven fresh rounds on CPU 8 |
| amd | EPYC 9R45, Zen 5 | Clang 18.1.3, `-march=native` | seven rounds on CPU 3, seven fresh rounds on CPU 8 |
| arm-2 | Graviton4 / Neoverse V2 | Clang 18.1.3, `-mcpu=native` | seven rounds on CPU 3 |

Live fleet work, CPU activity, containers and reservation history were checked before selection. The primary Intel/ARM hosts were busy and excluded. Idle selected coordinators were temporarily paused with PID identity checks and a two-hour release guard. The AMD host retained its pre-existing idle container. All original coordinators were independently verified resumed; all ffc source trees were restored clean. Fleet ownership, private preflight evidence and release records were published in the Redis workspace.

The recorded source pins are ffc `965d4db`, fast_float `9498cc3`, benchmark `a856c09`; the exact candidate is `variants/float-inline-clang-on.patch`. No parser logic changes were added. Each binary uses `-O3 -DFFC_ROUNDS_TO_NEAREST`; the candidate also defines `FFC_ENABLE_FLOAT_INLINING`. Both precisions and all three datasets use the original 100-repetition harness. Baseline/candidate order alternates each round; the confirmation campaign starts in the opposite order.

The existing benchmark script selects CPU 3 independently of inherited affinity. Thus the initial directories named `*-clang18-cpu8` contain **CPU 3 benchmarks and CPU 8 profiles/builds**; their names refer to the outer process affinity. The x86 `repeat-cpu8` campaigns explicitly set `PIN_CPU=8`. Profiles and benchmarks are separate measurements. Results are compared only within the same host, never between sibling runners.

## Correctness and compatibility

- On every host, baseline and enabled Clang builds passed `make -B -C ffc test`, supplemental tests, and all four separate C99/C++17 implementation/caller combinations before benchmarking. The fixed fast_float control passed its core/supplemental suite.
- Additional baseline, patched-disabled and patched-enabled checks passed with Clang 18.1.3 and GCC 13.3: 24 C/C++ linkage combinations per host, 72 total. GCC parser, integer, format and supplemental tests passed in all three configurations.
- All 18 differential executions (three hosts × three variants × two compilers) produced `checks=268800 fingerprint=5279b5f6dcd5e7e5`: 4,838,400 checks spanning float/double, four rounding modes, long mantissas, and extreme/malformed exponents.
- GCC implementation-object `.text` is byte-identical across all three variants on each host. Clang baseline and patched-disabled `.text` also match. This supports the intended compiler/opt-in gate; no GCC speedup is claimed. No full exhaustive sweep was run.
- The first additional GCC helper invocation used the workspace directory instead of `ffc/`, so baseline tests could not load their relative CSV fixture. The failure is retained under `compatibility/` and `compatibility.log`; the corrected complete run is `compatibility-r2/` and `compatibility-r2.log`. This was a validation-helper error, not a parser failure.

## Throughput

Numbers are medians of seven runs. Each cell contains **MB/s / Mfloat/s**, using the harness labels (its MB/s is actually MiB/s). All raw logs, min/max ranges and both parsers are in the per-campaign `summary.json` and `bench-results/`.

| Host / CPU | Precision / dataset | Baseline | Enabled | ffc delta | fast_float control delta |
|---|---|---:|---:|---:|---:|
| intel-2 / 3 | double / random [0,1] | 1418.42 / 67.61 | 1418.96 / 67.63 | +0.04% | -0.04% |
| intel-2 / 3 | double / canada.txt | 1333.60 / 76.64 | 1338.75 / 76.93 | +0.39% | +0.36% |
| intel-2 / 3 | double / mesh.txt | 1400.90 / 190.84 | 1394.48 / 189.97 | -0.46% | -0.27% |
| intel-2 / 3 | float / random [0,1] | 1346.30 / 64.17 | 1435.36 / 68.41 | +6.62% | -0.47% |
| intel-2 / 3 | float / canada.txt | 1207.73 / 69.40 | 1352.48 / 77.72 | +11.99% | +0.87% |
| intel-2 / 3 | float / mesh.txt | 812.06 / 110.63 | 1085.09 / 147.82 | +33.62% | +8.69% |
| intel-2 / 8 | double / random [0,1] | 1418.48 / 67.61 | 1421.15 / 67.74 | +0.19% | +0.11% |
| intel-2 / 8 | double / canada.txt | 1333.55 / 76.63 | 1338.49 / 76.92 | +0.37% | +0.28% |
| intel-2 / 8 | double / mesh.txt | 1403.88 / 191.25 | 1392.41 / 189.68 | -0.82% | -1.61% |
| intel-2 / 8 | float / random [0,1] | 1346.21 / 64.16 | 1434.82 / 68.39 | +6.58% | -0.49% |
| intel-2 / 8 | float / canada.txt | 1209.04 / 69.48 | 1352.40 / 77.72 | +11.86% | +1.03% |
| intel-2 / 8 | float / mesh.txt | 812.67 / 110.71 | 1081.81 / 147.37 | +33.12% | +7.63% |
| amd / 3 | double / random [0,1] | 1637.25 / 78.04 | 1629.66 / 77.67 | -0.46% | +0.12% |
| amd / 3 | double / canada.txt | 1521.56 / 87.44 | 1527.83 / 87.80 | +0.41% | +0.19% |
| amd / 3 | double / mesh.txt | 1637.96 / 223.13 | 1643.13 / 223.84 | +0.32% | +2.69% |
| amd / 3 | float / random [0,1] | 1427.00 / 68.01 | 1701.35 / 81.09 | +19.23% | -0.06% |
| amd / 3 | float / canada.txt | 1389.94 / 79.88 | 1535.23 / 88.22 | +10.45% | +0.03% |
| amd / 3 | float / mesh.txt | 971.89 / 132.40 | 1245.34 / 169.65 | +28.14% | +0.11% |
| amd / 8 | double / random [0,1] | 1632.79 / 77.82 | 1625.52 / 77.48 | -0.45% | +0.12% |
| amd / 8 | double / canada.txt | 1517.87 / 87.23 | 1524.15 / 87.59 | +0.41% | +0.21% |
| amd / 8 | double / mesh.txt | 1633.37 / 222.51 | 1637.16 / 223.03 | +0.23% | +3.97% |
| amd / 8 | float / random [0,1] | 1427.39 / 68.03 | 1696.08 / 80.84 | +18.82% | -0.00% |
| amd / 8 | float / canada.txt | 1386.23 / 79.66 | 1533.38 / 88.12 | +10.62% | +0.07% |
| amd / 8 | float / mesh.txt | 966.84 / 131.71 | 1242.08 / 169.20 | +28.47% | +0.08% |
| arm-2 / 3 | double / random [0,1] | 1427.50 / 68.04 | 1428.76 / 68.10 | +0.09% | -0.09% |
| arm-2 / 3 | double / canada.txt | 1303.28 / 74.90 | 1303.11 / 74.89 | -0.01% | -0.02% |
| arm-2 / 3 | double / mesh.txt | 1440.11 / 196.18 | 1443.12 / 196.59 | +0.21% | -0.07% |
| arm-2 / 3 | float / random [0,1] | 1266.76 / 60.38 | 1494.63 / 71.24 | +17.99% | +0.14% |
| arm-2 / 3 | float / canada.txt | 1157.11 / 66.50 | 1326.04 / 76.20 | +14.60% | -0.05% |
| arm-2 / 3 | float / mesh.txt | 794.13 / 108.18 | 1059.71 / 144.36 | +33.44% | -0.00% |

The x86 repeat used the exact same binaries on another idle core, without rebuilding. It confirmed the float gains and the small double decreases. Intel fast_float float mesh moved +8.69% and +7.63%; AMD fast_float double mesh moved +2.69% and +3.97%. These controls are therefore **not timing-neutral**. Do not normalize ffc by them or claim that they prove absence of environmental/layout effects. The fast_float wrappers keep their sizes but move addresses between binaries, as do the unchanged-size double ffc callers. Binary layout is a plausible explanation; these measurements do not isolate a hardware cause. The ARM fast_float controls stayed within 0.15%.

## Profiles

Each build/precision has a five-second hardware-counter run and a separate five-second `perf record -g -F 999` run on mesh. `perf report --no-children` reports self samples. The default x86 `/usr/bin/perf` launcher was broken for the running kernel; `PERF_BIN` selected a pre-existing working tool binary, verified with counters before use. No system perf installation was changed.

| Host | Baseline float hot symbol / self % / module | Enabled float hot symbol / self % / module |
|---|---|---|
| Intel | `ffc_from_chars_float_options` / 87.40% / `ffc-profile-float` | `profile_ffc(...)` / 99.70% / `ffc-profile-float` |
| AMD | `ffc_from_chars_float_options` / 90.80% / `ffc-profile-float` | `profile_ffc(...)` / 99.90% / `ffc-profile-float` |
| ARM | `ffc_from_chars_float_options` / 74.97% / `ffc-profile-float` | `profile_ffc(...)` / 99.90% / `ffc-profile-float` |

The out-of-line float options call disappears from the sampled hot path, as expected. Disassembly shows the caller expanding to contain the specialized parser; the exported float API symbols remain present. All double profiles remain dominated by `profile_ffc(...)` (99.74–99.92%, module `ffc-profile-double`). No new out-of-line bottleneck appears. Inline scanner/conversion attribution cannot be separated from these symbol-level reports alone.

Counters below are normalized by each driver’s reported `lines × repetitions`, including small startup overhead. The driver validates full input and is not a replacement throughput benchmark.

| Host / precision | Instructions/value, baseline → enabled | Cycles/value, baseline → enabled |
|---|---:|---:|
| intel-2 / float | 209.38 → 144.71 | 35.06 → 26.23 |
| intel-2 / double | 118.08 → 118.08 | 19.15 → 19.65 |
| amd / float | 211.47 → 146.78 | 34.98 → 26.10 |
| amd / double | 121.86 → 121.86 | 20.12 → 20.31 |
| arm-2 / float | 169.92 → 125.79 | 26.81 → 19.60 |
| arm-2 / double | 102.58 → 102.58 | 14.75 → 14.84 |

Float instructions/value fall about 26–31% and cycles/value about 25–27% in the separate profile driver. Double instruction counts are essentially unchanged; single-sample cycle differences are not a no-regression proof.

## Integration decision

The opt-in patch is functionally validated on these three Linux architectures with Clang 18 and GCC 13 compatibility. It is **not accepted under the workspace’s no-regression rule**, and must not be presented as universally faster. Retain the saved patch and unchanged default. Before an upstream performance PR, investigate emitted-float-function layout effects on double, particularly AMD random and the existing M6 mesh result, then repeat the same benchmark/profile gates.

The only tracked harness changes from this validation are an explicit `PERF_BIN` override with noninteractive sudo and recording benchmark CPU selection. Existing source pins and the candidate patch are unchanged. Raw perf data and compatibility binaries are retained in local artifact archives; readable logs, summaries, disassembly, hashes and profile reports are committed here.
