---
name: upstream-prs
description: fast_float upstream PRs opened from our race wins, and how to open them
metadata:
  type: reference
---

Upstream PRs to `fastfloat/fast_float` from the race ([[race-setup]]):

- **#381** — ✅ **MERGED** (lemire, 2026-06-01). "Unroll the integer-part digit scan" (EXP-050). Branch
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

- **#382** — ✅ **MERGED** (lemire, 2026-06-01; clang gate accepted as-is). "Add a 4-digit SWAR follow-up to loop_parse_if_eight_digits (clang)"
  (EXP-053, re-validated). Branch `redis-performance/fast_float:pr/four-digit-followup`
  (`7589a4f`) → `main`. +15, one file. Opened 2026-06-01.
  https://github.com/fastfloat/fast_float/pull/382
  **Gated `#if defined(__clang__)`** — clang canada +11.7%, mesh +7.7% (reproduced 3×);
  ungated it regresses gcc `random` −3% (check is overhead when remainder < 4 digits).
  PR body is upfront about the gate and invites the maintainer's preference. Clang
  default suite 14/14 passes; clang float32 exhaustive validated separately.

- **#383** — APPROVED (lemire, "This looks good"); CI green except slow QEMU Alpine aarch64/riscv64/armv7 pending; will merge on green. "Parallelize the exhaustive midpoint test across hardware threads
  (~75x faster)". Branch `redis-performance/fast_float:pr/parallel-exhaustive`
  (`b20c420`) → `main`. Opened 2026-06-01.
  https://github.com/fastfloat/fast_float/pull/383
  `std::thread` over `hardware_concurrency()`, atomic fail-fast; `check_word()` helper;
  CMake links `Threads::Threads`. 96-core metal: ~1900s → ~25s, gcc+clang clean under
  -Werror, identical pass/fail. Low CI risk (exhaustive tier not built in CI). Grew out
  of validating #382 (the single-threaded sweep was unbearably slow). Offered to extend
  to the sibling sweeps if welcomed. **Extended 2026-06-01** to all three
  (exhaustive32 ~88x, exhaustive32_64 ~86x, midpoint ~75x); title now "...float32
  sweeps..."; offered to revert to midpoint-only if he prefers the focused PR.

**Not submitted:** EXP-052 (2x SWAR unroll) — re-validation showed only clang `random`
+3.3% and nothing else; too marginal to justify a compiler-`#ifdef`. Held on the fork.

**Cross-session baseline trap:** the original EXP-050/052/053 deltas were inflated by
measuring against prior-session baselines. Same-session re-measurement gave the real
numbers (EXP-050 ~+3-5% not +34%; EXP-053 the big clang win above). Always base+patch
back-to-back, ≥2 samples — see program.md.

**Pre-existing upstream issue (noticed):** `ascii_number.h:690/696` (the uint16/uint8
parsing) fails to build under **clang-18 `-Werror -Wimplicit-int-conversion`**
(`uint16_t`→`unsigned char`) — only surfaces building the EXHAUSTIVE-tier `ipv4_test`
under clang. Not ours; a candidate one-line upstream warning fix for later.

- **issue #384** — "GCC: parsed_number_string marshaling dominates short-float parsing
  on aarch64". Discussion (not PR) of the gcc-mesh struct-marshaling bottleneck:
  ~74% in returning/consuming parsed_number_string_t by value; cheap SRA fix proven
  no-op; only an internal fused fast path would help; asks Lemire if it's worth it.
  https://github.com/fastfloat/fast_float/issues/384 — if he engages, the fused-path
  refactor becomes worth building (with his buy-in + cross-platform validation).
