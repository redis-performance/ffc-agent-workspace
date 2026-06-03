# PR #24 performance — baseline vs PR, 4 Intel gens + ARM

Method: ffc-only self-timing microbench (`experiments/EXP-060/ffc_tma.cpp`),
single-core pinned (taskset -c 3), best-of-9 trials. ffc parsing only (no harness
dilution). Throughput = reps × dataset-bytes / seconds.

- **Baseline**: upstream main `b1894aa` (the base PR #24 merges into; includes #23).
- **PR**: branch tip `3314128` (force-inline at call sites, exp==0 early-exit,
  integer/fraction straight-line unrolls, acc10 shift-add + 2× SWAR unroll [AArch64/Clang],
  vk fix, the merged 4-digit follow-up). FFC_ROUNDS_TO_NEAREST NOT defined in this build.
- Intel built with gcc 11 (x86 `#else` path); ARM built with clang 18.1.3
  (exercises the `__aarch64__ && __clang__` 2× unroll + acc10 asm).

## Throughput (MB/s), and PR Δ vs baseline

| Env | dataset | base MB/s | PR MB/s | Δ |
|-----|---------|-----------|---------|---|
| Cascade Lake (gcc)    | random | 550.0  | 682.2  | +24.0% |
| Cascade Lake (gcc)    | mesh   | 356.8  | 577.7  | +61.9% |
| Cascade Lake (gcc)    | canada | 533.6  | 702.8  | +31.7% |
| Ice Lake (gcc)        | random | 848.7  | 1054.4 | +24.2% |
| Ice Lake (gcc)        | mesh   | 607.7  | 988.3  | +62.6% |
| Ice Lake (gcc)        | canada | 871.7  | 1091.7 | +25.2% |
| Emerald Rapids (gcc)  | random | 1226.8 | 1491.5 | +21.6% |
| Emerald Rapids (gcc)  | mesh   | 904.5  | 1517.4 | +67.7% |
| Emerald Rapids (gcc)  | canada | 1363.0 | 1712.8 | +25.7% |
| Granite Rapids (gcc)  | random | 1240.3 | 1539.3 | +24.1% |
| Granite Rapids (gcc)  | mesh   | 926.7  | 1532.9 | +65.4% |
| Granite Rapids (gcc)  | canada | 1352.3 | 1762.5 | +30.3% |
| Graviton4 (clang)     | random | 1252.4 | 1529.1 | +22.1% |
| Graviton4 (clang)     | mesh   | 829.6  | 1373.1 | +65.5% |
| Graviton4 (clang)     | canada | 1063.6 | 1288.4 | +21.1% |

All datasets, all envs: PR faster, no regressions. random +21.6–24.2%,
mesh +61.9–67.7%, canada +21.1–31.7%. Raw logs in `perf-logs/`.
