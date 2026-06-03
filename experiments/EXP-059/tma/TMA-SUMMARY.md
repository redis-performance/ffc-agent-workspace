# Intel TMA (top-down) proof — EXP-058+059 marshaling elision

fast_float-ONLY microbench (ff_tma.cpp: from_chars<double> in a tight loop over the
dataset, no other parsers), icx2 = Intel Xeon Platinum 8360Y (Ice Lake), pinned core 3,
`perf stat -M TopdownL1/L2`. base = redis-perf/optim, patch = EXP-059.

## mesh (short floats — the biggest win)
| metric                | BASE   | PATCH (EXP-059) | Δ |
|-----------------------|--------|-----------------|---|
| tma_backend_bound     | 26.0%  | 2.2%            | **−23.8 pts** |
| tma_retiring          | 60.3%  | 77.3%           | **+17 pts** |
| TOPDOWN.SLOTS         | 37.2B  | 23.7B           | −36% |
| wall time (2500 reps) | 2.41s  | 1.53s           | **−37% (≈1.57× parser)** |

Interpretation: the base spends 26% of pipeline slots BACKEND-BOUND — stalled on the
parsed_number_string_t span stores/reloads (the "fat struct" spill). EXP-059 removes the
span materialization on the hot path, so backend-bound collapses to 2.2% and the pipeline
spends 77% retiring useful work. Total slots drop 36% (fewer uops = the eliminated stores)
and wall time drops 37%. This is the microarchitectural mechanism behind the benchmark win.

## canada (longer numbers)
| metric            | BASE  | PATCH |
|-------------------|-------|-------|
| tma_backend_bound | 13.1% | 13.2% |
| tma_retiring      | 76.9% | 74.1% |
| TOPDOWN.SLOTS     | 83.2B | 69.8B (−16%) |
| wall time         | 5.38s | 4.51s (−16%) |

canada is less backend-bound at baseline (longer parse amortizes the struct cost), so the
win there is a ~16% reduction in total slots/work (the removed span stores) rather than a
backend-stall collapse. Both datasets confirm: EXP-059 removes real pipeline work.

Files: icx2-BASE-tma.txt, icx2-PATCH-tma.txt (full L1+L2 perf output).
