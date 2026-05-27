# EXP-NNN — YYYY-MM-DD — [Short Title]

## Status: IN PROGRESS

---

## Selection Phase

### Proposals

| Agent | Model | Tier | Technique | Expected Gain | Confidence |
|-------|-------|------|-----------|---------------|------------|
| opus | claude-opus-4-7 | | | | |
| sonnet | claude-sonnet-4-6 | | | | |
| haiku | claude-haiku-4-5 | | | | |

Full proposals: `experiments/EXP-NNN/proposals/TIMESTAMP/`

### Chair Decision

**Winner**: [agent name]  
**Hypothesis**: [one falsifiable sentence]  
**Runner-up**: [agent, technique — why it didn't win]  
**Park for later**: [technique, or "none"]

---

## Implementation Phase

### Variants

| Variant | Model | Change summary | Correctness | Random MB/s |
|---------|-------|---------------|-------------|-------------|
| opus | claude-opus-4-7 | | pass/fail | |
| sonnet-a | claude-sonnet-4-6 | | pass/fail | |
| sonnet-b | claude-sonnet-4-6 | | pass/fail | |

**Winner variant**: [name] — [score] MB/s  
Full variant diffs: `experiments/EXP-NNN/variants/TIMESTAMP/`

---

## Step 1: Benchmark (winner variant vs baseline)

| Dataset | Before (MB/s) | After (MB/s) | Δ% |
|---------|--------------|--------------|-----|
| random [0,1] | | | |
| canada.txt | | | |
| mesh.txt | | | |

Benchmark file: `experiments/EXP-NNN/bench-results/TIMESTAMP.txt`

---

## Step 2: Profile (winner variant)

```
# Top ffc symbols after change:
N.N%  symbol_name  [ffc.h]

perf stat:
  IPC        : N.NN  (before: N.NN)
  branch miss: N.NN% (before: N.NN%)
```

**New bottleneck classification**: [Tier N — reason] → feeds next selection round

---

## Decision

**Status**: accept / reject / park  
**Reason**: [one or two sentences — what the numbers showed]

If rejected: add technique to "Known Non-Starters" in `.claude/program.md`.

---

## Token Cost

| Phase | Agent | Model | Tokens In | Tokens Out |
|-------|-------|-------|-----------|------------|
| select-propose | opus | claude-opus-4-7 | | |
| select-propose | sonnet | claude-sonnet-4-6 | | |
| select-propose | haiku | claude-haiku-4-5 | | |
| select-chair | chair | claude-opus-4-7 | | |
| implement | opus | claude-opus-4-7 | | |
| implement | sonnet-a | claude-sonnet-4-6 | | |
| implement | sonnet-b | claude-sonnet-4-6 | | |
| **Total** | | | **0** | **0** |

Full ledger: `experiments/token-ledger.tsv`

---

## Lessons

What this experiment revealed that applies to future attempts.
