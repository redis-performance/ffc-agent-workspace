# Skill: optimize

Run one full optimization iteration on ffc.h:
profile → hypothesize → implement → validate (bench + profile) → log → decide.

## Steps

1. **Read current profile** (from `experiments/EXPERIMENTS.md` last entry or run `scripts/run-profile.sh`)
   - Identify the hottest symbol in ffc parsing
   - Note its % CPU and the surrounding call chain

2. **Read the source** of the hot symbol in `ffc/src/`
   - Look for: branches that could be branchless, redundant loads, missed SIMD opportunities,
     loop structure that prevents auto-vectorization, unnecessary fallback triggers

3. **Form a hypothesis** — one sentence, falsifiable:
   - Bad: "optimize the mantissa parsing"
   - Good: "the loop in `ffc_parse_number` checks `isdigit()` per byte; replacing with a
     SWAR 8-byte digit check should reduce branch mispredicts and improve IPC"

4. **Implement** — edit `ffc/src/*.h` only (not `ffc/ffc.h`)

5. **Regenerate + test**:
   ```bash
   make -C ffc ffc.h
   make -C ffc test
   ```
   If tests fail, fix the bug before continuing. Do not benchmark broken code.

6. **Step 1 — Benchmark**:
   ```bash
   scripts/build-bench.sh
   scripts/run-bench.sh
   ```
   Compare MB/s vs the previous entry in `experiments/EXPERIMENTS.md`.

7. **Step 2 — Profile**:
   ```bash
   scripts/run-profile.sh
   ```
   Compare top symbol percentages. Did the target symbol's % drop?

8. **Log** — append to `experiments/EXPERIMENTS.md` using the template in `experiments/TEMPLATE.md`

9. **Decide**:
   - **Accept**: ≥ +2% on ≥ 1 dataset, no regression, profile confirms bottleneck shifted
   - **Reject**: < 1% delta or regression; revert the change in `ffc/src/`
   - **Park**: real improvement but < 2%, or needs a prerequisite

10. **Update** `experiments/SUMMARY.md` and `README.md` counts

## Move-On Criteria

Stop the current hypothesis after any of:
- 3 consecutive failed micro-variants of the same idea
- 2 hours wall time on the same approach
- Profile shows the bottleneck shifted away from this function (< 2% CPU)
- You've accepted an improvement — run a fresh profile before choosing the next target
