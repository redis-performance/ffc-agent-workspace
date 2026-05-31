---
name: run-directives
description: User's standing directives for the overnight autonomous optimization session
metadata:
  type: feedback
---

For the autonomous race-optimization sessions (started 2026-06-01):

- **Work continuously** through optimization experiments; don't stop to ask after
  each one. Keep iterating across both parsers per [[race-setup]].
- **Do NOT open PRs** to upstream fast_float. Carry wins on `redis-perf/optim`;
  PRs are explicitly deferred (the user will decide when).
- **Only flag experiments that PASSED** (accepted) in progress reports. Rejections
  still get logged to EXPERIMENTS.md, but don't surface them in summaries to the user.

**Why:** the user wants a high signal-to-noise overnight run — accepted wins only,
no interruptions, no premature upstreaming.

**How to apply:** run the full profile→implement→test→bench→commit/revert loop
autonomously, commit accepted changes, log everything, and report a concise
accepted-only digest.
