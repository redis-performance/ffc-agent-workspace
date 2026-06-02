---
name: hiredis-ffc
description: Effort to propose ffc as hiredis's internal RESP3 double parser (replace strtod)
metadata:
  type: project
---

New effort opened 2026-06-02 (user direction): integrate **ffc** (pure-C99 single
header) as hiredis's internal float parser, replacing `strtod()`, and upstream it as a
PR to `redis/hiredis`.

**Why ffc specifically**: hiredis is pure C, so fast_float (C++) is disqualified — ffc
is the only high-performance `from_chars`-style parser that can drop in. This is the
strategic payoff of the [[race-setup]] (ffc ≈ fast_float in speed, ahead on ARM).

**Integration point**: `hiredis/read.c:311`, the sole float-parse site — `strtod()` in
the `REDIS_REPLY_DOUBLE` branch of `processLineItem()`. Replace with
`ffc_from_chars_double_options(p, p+len, &d, opts)` where `opts.format |= NO_INFNAN`
(RESP3 strict inf/nan handled by the existing length-checked guards). Drop the
`buf[326]` + memcpy + NUL-terminate (ffc takes a range; `createDouble` copies the string
form from `p` directly).

**Three wins over strtod**: ~2–3× speed; locale-independence (strtod honors `LC_NUMERIC`
— a latent RESP3 correctness bug in non-C-locale processes); no per-reply copy.

**Submodule**: `hiredis/` → `git@github.com:fcostaoliveira/hiredis.git` (fork of
redis/hiredis) @ `1d18adb`.

**PR OPENED (2026-06-02)**: https://github.com/redis/hiredis/pull/1328 — ffc is the
default RESP3 double parser (strtod fallback via `-DHIREDIS_FLOAT_STRTOD`), vendored under
MIT. Validated: 3M-value strtod-parity bit-identical; ~7–10× faster (x86+ARM); locale bug
fixed; in-tree tests green under both builds. Branch `ffc-double-parser` @ `f19c4b5` on
`fcostaoliveira/hiredis`. Opened via `GH_TOKEN= GITHUB_TOKEN= gh pr create` (PAT can't open
upstream PRs). Now awaiting maintainer review.

**Full plan + milestones (H0–H7, all done) + results + log**: `experiments/HIREDIS-FFC.md`
— the single source of truth for this effort.
