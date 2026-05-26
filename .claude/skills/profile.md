# Skill: profile

Profile the benchmark binary and identify the hottest parsing symbols.

## Steps

1. Ensure benchmark is built with debug info and current ffc.h:
   ```bash
   make -C ffc ffc.h
   scripts/build-bench.sh     # builds with -g -O3
   ```

2. Run profiler:
   ```bash
   scripts/run-profile.sh
   ```

3. Parse the output:
   - Find symbols whose name contains `ffc` — these are our code
   - Note the top-3 ffc symbols by CPU %
   - Note the total ffc CPU % vs fastfloat CPU %
   - Look for unexpected symbols (memcpy, libc, etc.)

4. For deeper analysis, run annotated:
   ```bash
   sudo perf record -g -F 999 -- \
     simple_fastfloat_benchmark/build/benchmarks/benchmark
   sudo perf report --stdio --kallsyms=/dev/null 2>/dev/null | head -60
   ```

5. For branch mispredicts specifically:
   ```bash
   sudo perf stat -e branches,branch-misses,cache-references,cache-misses,instructions,cycles \
     -- simple_fastfloat_benchmark/build/benchmarks/benchmark 2>&1 | tail -20
   ```

## Key Metrics to Report

| Metric | What to look for |
|--------|-----------------|
| Hottest ffc symbol | Is it the fast path or fallback? |
| `ffc_digit_comp` % | > 5% means too many slow-path fallbacks |
| Branch miss rate | > 3% is a red flag for branchable hot loops |
| IPC (instructions/cycle) | Higher = better; < 2.0 suggests memory/branch stalls |
| L1/L2 miss rate | Unexpected cache pressure |

## Output Format

Report like this:

```
Top ffc symbols:
  N.N%  ffc_parse_number       [ffc.h]
  N.N%  ffc_compute_float64    [ffc.h]
  N.N%  ffc_digit_comp         [ffc.h]  ← slow path

perf stat summary:
  instructions/cycle : N.NN
  branch miss rate   : N.NN%
  cache miss rate    : N.NN%
```
