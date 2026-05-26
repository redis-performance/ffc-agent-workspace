# EXP-NNN — YYYY-MM-DD — [Short Title]

## Status: IN PROGRESS
## Commit: (fill after implement)

## Hypothesis

One falsifiable sentence: "Changing X in `ffc/src/Y.h` should reduce Z because W."

## Files Changed

- `ffc/src/parse.h` lines N–M: [what]

## Step 1: Benchmark

Run `scripts/run-bench.sh` before and after. Fill both columns.

| Dataset | Before (MB/s) | After (MB/s) | Δ% |
|---------|--------------|--------------|-----|
| random [0,1] | | | |
| canada.txt | | | |
| mesh.txt | | | |

Float benchmark (benchmark32):

| Dataset | Before (MB/s) | After (MB/s) | Δ% |
|---------|--------------|--------------|-----|
| random [0,1] | | | |

## Step 2: Profile

Run `scripts/run-profile.sh` after the change. Paste top ffc symbols.

```
# After change:
N.N%  symbol_name  [ffc.h]
...

perf stat:
  IPC        : N.NN  (before: N.NN)
  branch miss: N.NN% (before: N.NN%)
```

## Decision

**Status**: accept / reject / park

**Reason**: One or two sentences. If reject: what the numbers showed. If park: what's blocking.

## Lessons

What this experiment revealed that's useful for future attempts.

## Agent Log

| Session | Model | Work Done |
|---------|-------|-----------|
| | | |
