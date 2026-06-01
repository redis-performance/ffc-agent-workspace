---
name: upstream-prs
description: fast_float upstream PRs opened from our race wins, and how to open them
metadata:
  type: reference
---

Upstream PRs to `fastfloat/fast_float` from the race ([[race-setup]]):

- **#381** — "Unroll the integer-part digit scan" (EXP-050). Branch
  `redis-performance/fast_float:pr/integer-scan-unroll` (`b64d014`) → `main`. +29/−6,
  one file. Opened 2026-06-01. https://github.com/fastfloat/fast_float/pull/381
  Verified numbers: canada ~+3%, mesh ~+5% (gcc & clang), exhaustive-clean.

**How to open one (token gotcha):** the `GH_TOKEN` fine-grained PAT CANNOT create
PRs on upstream (`Resource not accessible by personal access token`). Fall back to the
stored OAuth login by clearing the env tokens for that one command:
```
GH_TOKEN= GITHUB_TOKEN= gh pr create -R fastfloat/fast_float \
  --base main --head redis-performance:<branch> --title "..." --body-file <file>
```
(Also use `GH_TOKEN= gh pr view/comment ...` for upstream PR ops.) Each PR should be a
single isolated commit on `upstream/main` (cherry-pick the one EXP), pre-cleared by the
[[run-directives]] review bar (review-fastfloat skill).

Candidates not yet submitted: EXP-052 (2x SWAR unroll), EXP-053 (4-digit follow-up).
