---
name: run-directives
description: User's standing directives for the overnight autonomous optimization session
metadata:
  type: feedback
---

For the autonomous race-optimization sessions (started 2026-06-01):

- **Work continuously** through optimization experiments; don't stop to ask after
  each one. Keep iterating across both parsers per [[race-setup]].
- **Open upstream PRs** for clean wins (the user reversed the earlier no-PR rule).
  #381 + #382 merged by Lemire; #383 (parallel exhaustive tests) approved. Use the
  OAuth-fallback gh trick in [[upstream-prs]]. Re-validate same-session before claiming.
- **Only flag experiments that PASSED** (accepted) in progress reports. Rejections
  still get logged to EXPERIMENTS.md, but don't surface them in summaries to the user.

**Why:** the user wants a high signal-to-noise overnight run — accepted wins only,
no interruptions, no premature upstreaming.

**How to apply:** run the full profile→implement→test→bench→commit/revert loop
autonomously, commit accepted changes, log everything, and report a concise
accepted-only digest.
