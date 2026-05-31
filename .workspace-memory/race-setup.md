---
name: race-setup
description: The workspace is a race between two mutable parsers — ffc vs fast_float — not solo ffc optimization
metadata:
  type: project
---

As of 2026-05-31 (EXP-049), the goal changed from optimizing ffc alone to a
**race between two mutable competitors**, scored in `experiments/RACE.md` across 12
cells = {ARM m8g, x86 m7i} × {GCC, Clang} × {random, canada, mesh}. See [[metal-fleet]].

- `ffc` — submodule `redis-performance/ffc.h`.
- `fast_float` — submodule `redis-performance/fast_float` @ branch `redis-perf/optim`,
  **live-tracking** `upstream/main` (fastfloat/fast_float, currently v8 `7790aa6`).
  We carry edits on top and open PRs upstream.

**Why:** push both forward; cross-pollinate wins; portable fast_float gains become
upstream PRs.

**How to apply:**
- An experiment targets exactly ONE parser; edit `ffc/src/*.h` OR
  `fast_float/include/fast_float/*.h`. Commit/revert in that submodule.
- Build: `scripts/build-bench.sh` (redirects fast_float to the submodule via
  `-DFETCHCONTENT_SOURCE_DIR_FAST_FLOAT`; `COMPILER=gcc|clang` for the matrix;
  per-compiler trees nest under `build/<compiler>`).
- fast_float correctness gate: `scripts/test-fast_float.sh` (+ `EXHAUSTIVE=1` for
  mantissa-loop changes). ffc keeps its `make -C ffc test/supplemental/exhaustive`.
- The benchmark harness stays immutable; canonical scoreboard row is the FIRST
  `fastfloat` line per section (char from_chars→double), NOT the UTF-16 one.
