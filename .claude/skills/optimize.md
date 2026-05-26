# Skill: optimize

One full iteration of the population-based optimization loop:
select → implement (N variants) → multi-stage verify → benchmark → profile → commit/revert → log.

Inspired by AutoKernel (arXiv:2603.21331): immutable benchmark + mutable code +
git as the experiment ledger. Extended with population-based selection AND
population-based implementation.

---

## Full Loop

```
Profile
  ↓
SELECTION PHASE — 3 agents propose (opus / sonnet / haiku) → chair picks winner
  ↓
IMPLEMENTATION PHASE — 3 agents implement in parallel → best variant wins
  ↓
Multi-stage correctness (all stages, winner variant)
  ↓
Step 1: Benchmark
  ↓
Step 2: Profile → classify new bottleneck
  ↓
Accept (git commit) or Reject (git checkout)
  ↓
Log to EXPERIMENTS.md + token-ledger.tsv
```

---

## Steps

### 1. Run profile (if stale)
```bash
scripts/run-profile.sh
```
If the last profile in `experiments/` is from the current ffc commit, skip this.

### 2. Selection phase
```bash
EXP_ID=EXP-NNN scripts/select.sh
```
This runs 3 proposer agents in parallel (opus / sonnet / haiku), then a chair
agent (opus) synthesizes the winner. Output goes to `experiments/proposals/`.

Read `experiments/proposals/TIMESTAMP/chair-decision.md` to see the winning
hypothesis before proceeding.

If `scripts/select.sh` is unavailable (interactive session): manually act as
chair — read the profile + playbook, propose 3 alternatives from different tiers,
pick the strongest one. State the winning hypothesis explicitly.

### 3. Implementation phase
```bash
EXP_ID=EXP-NNN scripts/implement.sh experiments/proposals/TIMESTAMP/chair-decision.md
```
This runs 3 implementer agents in parallel (opus, sonnet-a, sonnet-b), each
producing a unified diff. Each diff is applied to a fresh copy of `ffc/src/`,
built, tested, and benchmarked. The best-performing variant that passes all tests
wins and is applied to `ffc/src/`.

If `scripts/implement.sh` is unavailable: implement the hypothesis yourself
(single implementation, no parallel variants).

### 4. Multi-stage correctness (winner variant — all stages before benchmarking)

**Stage 1** — unit tests:
```bash
make -C ffc ffc.h && make -C ffc test
```

**Stage 2** — supplemental corpus:
```bash
make -C ffc supplemental_tests
```

**Stage 3** — exhaustive (when touching mantissa loop):
```bash
make -C ffc exhaustive
```

If any stage fails: `git -C ffc checkout -- src/` and return to step 2.

### 5. Step 1 — Benchmark
```bash
scripts/build-bench.sh
scripts/run-bench.sh
```
Compare MB/s for all three datasets vs last accepted entry.

### 6. Step 2 — Profile
```bash
scripts/run-profile.sh
```
Classify the new bottleneck for the next iteration.

### 7. Commit or revert

**Accept** (≥ +2% on ≥ 1 dataset, no regression > 1%):
```bash
git -C ffc add src/
git -C ffc commit -m "EXP-NNN: [one-line change description]"
```

**Reject**:
```bash
git -C ffc checkout -- src/
```

The ffc submodule tip always reflects the best accepted state.

### 8. Log
Append to `experiments/EXPERIMENTS.md` using `experiments/TEMPLATE.md`.
All seven agent token counts go in the Token Cost table and `experiments/token-ledger.tsv`.
If rejected: add technique to "Known Non-Starters" in `.claude/program.md`.

### 9. Update tracking
- Update `experiments/SUMMARY.md`
- Update `README.md` counts
- If accepted: the new profile becomes the starting state for the next iteration

---

## Move-On Criteria

- **5 consecutive rejects** from the same tier → move to next tier
- **2 hours wall time** → stop, log current state, pick up next session
- **< 2% CPU** in the target function after profiling → re-classify, pick new tier
- **≥ +10% accepted** → re-profile before choosing next experiment

---

## Decision Thresholds

| | Criteria |
|--|---------|
| **Accept** | ≥ +2% on ≥ 1 dataset, no regression > 1% on others, profile confirms shift |
| **Reject** | < 1% delta (noise), or any regression, or correctness failure |
| **Park** | ≥ +1% but < 2%, or needs prerequisite, or architecture-specific only |
