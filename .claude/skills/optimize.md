# Skill: optimize

Run one full optimization iteration on ffc.h:
profile → classify → consult playbook → implement → multi-stage verify → benchmark → profile → git-commit or revert → log.

Inspired by AutoKernel (arXiv:2603.21331): the agent loop is immutable benchmark +
mutable code + git as the experiment ledger.

---

## Steps

### 1. Read current state
- Check `experiments/EXPERIMENTS.md` for the last experiment's profile output
- If no profile exists yet, run `scripts/run-profile.sh` first

### 2. Classify the bottleneck
Using the profile output, pick the bottleneck type from `.claude/program.md`
**Bottleneck Classification** table. State it explicitly before continuing:
> "Profile shows branch miss rate 4.2% → Tier 3 (Branch Elimination)"

### 3. Consult the playbook
Read the relevant tier in `.claude/program.md`. Pick the specific technique
with the highest expected gain that hasn't been tried yet (check
`experiments/EXPERIMENTS.md` and the "Known Non-Starters" table).

State the hypothesis in one falsifiable sentence before touching any code.

### 4. Implement
Edit `ffc/src/*.h` only. One technique per experiment. Keep the diff minimal —
AutoKernel's key insight: **one file, clean diff, easy to revert**.

### 5. Multi-Stage Correctness (all stages must pass before benchmarking)

**Stage 1 — Unit tests** (< 5s): catch compile errors and basic logic bugs
```bash
make -C ffc ffc.h && make -C ffc test
```

**Stage 2 — Exhaustive** (minutes, optional — run when touching the mantissa loop):
```bash
make -C ffc exhaustive   # requires make fetch-supplemental-data first
```

**Stage 3 — Supplemental** (against fastfloat reference corpus):
```bash
make -C ffc supplemental_tests
```

If any stage fails: fix the bug or abort. **Never benchmark broken code.**

### 6. Step 1 — Benchmark
```bash
scripts/build-bench.sh
scripts/run-bench.sh
```
Compare MB/s for all three datasets vs the last accepted entry in `experiments/EXPERIMENTS.md`.

### 7. Step 2 — Profile
```bash
scripts/run-profile.sh
```
Did the target symbol's CPU % drop? Did IPC improve? Did branch misses decrease?
Classify the new bottleneck for the next experiment.

### 8. Git commit or revert (AutoKernel pattern)

**If benchmark + profile both accept:**
```bash
git -C ffc add src/
git -C ffc commit -m "EXP-NNN: [one-line description of the change]"
```

**If rejected (no improvement or regression):**
```bash
git -C ffc checkout -- src/
```
The ffc submodule tip always reflects the best accepted state.

### 9. Log
Append to `experiments/EXPERIMENTS.md` using the template in `experiments/TEMPLATE.md`.
Fill in both benchmark table and profile section — even for rejections.

If the technique is a permanent dead end, add it to the "Known Non-Starters"
table in `.claude/program.md`.

### 10. Decide and update tracking
- **Accept**: update `experiments/SUMMARY.md` and `README.md` counts; run fresh profile to set new baseline
- **Reject**: note why in log; pick next technique from playbook
- **Park**: note what prerequisite is needed

---

## Move-On Criteria (from AutoKernel)

Stop the current tier/technique after any of:
- **5 consecutive reverted experiments** on the same idea → move to next tier
- **2 hours wall time** on the same approach
- **Profile shows < 2% CPU** in the target function → bottleneck shifted, re-classify
- **≥ +10% accepted** on the target dataset → run fresh profile before continuing

---

## Decision Thresholds

| Outcome | Criteria |
|---------|----------|
| **Accept** | ≥ +2% on ≥ 1 dataset, no regression > 1% on others, profile confirms shift |
| **Reject** | < 1% delta (within noise), or any regression, or correctness failure |
| **Park** | ≥ +1% but < 2%, or needs prerequisite, or architecture-specific only |
