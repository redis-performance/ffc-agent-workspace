# Skill: bench

Run the full benchmark suite and report results.

## Steps

1. Ensure benchmark is built with current ffc.h:
   ```bash
   make -C ffc ffc.h
   scripts/build-bench.sh
   ```

2. Run all datasets (double):
   ```bash
   scripts/run-bench.sh
   ```

3. Run float benchmark:
   ```bash
   sudo simple_fastfloat_benchmark/build/benchmarks/benchmark32
   ```

4. Report the ffc and fastfloat rows for each dataset.
   Compute Δ% = (ffc_MBs - fastfloat_MBs) / fastfloat_MBs * 100.

5. Compare to the last entry in `approaches/EXPERIMENTS.md`.
   If this is the first run, set it as the baseline in `README.md`.

## Output Format

```
Dataset: random [0,1]
  ffc       : NNN MB/s  (N.NN Mfloat/s)
  fastfloat : NNN MB/s  (N.NN Mfloat/s)
  delta     : +N.N%

Dataset: canada.txt
  ...

Dataset: mesh.txt
  ...
```

## Notes

- `sudo` is needed for perf hardware counters (branch misses, IPC)
- If `sudo` is not available, run without it — you lose the counter columns but MB/s still works
- Run 3 times and take the median if numbers are noisy (> 5% variance)
