# Session handoff — float-parser race (ffc / fast_float) + downstream

Last updated end of session 2026-06-09. Resume from here.

## Open PRs (monitor was watching #24)
- **kolemannix/ffc.h #24** — "nine micro-optimizations" — OPEN, MERGEABLE, CLEAN,
  reviewDecision=CHANGES_REQUESTED. Both reviewer asks answered with benchmark-backed
  pushbacks (acc10 asm: keep; loop unconditional: rejected, regresses gcc). Awaiting @kolemannix.
  Branch redis-performance:perf/force-inline-ffc-impl @ 3314128.
- **kolemannix/ffc.h #25** — Clang/AArch64 shift-add + 2x unroll. OPEN, no review.
- **kolemannix/ffc.h #26** — vk float-slow-path correctness fix. OPEN, no review.
- **fastfloat/fast_float #387** — MERGED (lemire, 3044c9b) — our lazy-spans work; #386 closed in favor.
- **redis/hiredis #1328** — MERGED — ffc as RESP3 double parser; hiredis-py/redis-py inherit it.

## The held optimization (this session's win, NOT yet PR'd)
ffc: out-of-line the rare too_many_digits/power2<0 disambiguation (mirror fast_float's
parse_number_slow_path), GCC-gated (clang keeps inline = neutral). Hot frame -21..-24%.
- Branch `perf/outline-slow-resolve` @ ead51af (off #24 tip): CLEAN win +3-15% gcc, clang neutral, exhaustive all-ok. Pushed to origin.
- Branch `perf/outline-slow-resolve-clean` (off kolemannix/main): regresses canada -2.9% on bare main (gcc), because #24's exp==0 early-exit is absent. Pushed to origin.
- DECISION: HOLD the PR. Open after #24 merges (rebase on new main, clean there), or fix the canada fast-path codegen perturbation first.
- Full data: experiments/ff-outline-slow-resolve/RESULTS.md

## Optimization rounds this session (all logged under experiments/)
PARKED: fast_float FASTFLOAT_ASSUME_ROUNDS_TO_NEAREST (marginal); ffc integer-SWAR (+18% int-heavy, regresses standard cells).
REJECTED: ffc Clinger mantissa-before-probe reorder (mesh -2.8%).
Key insight: both parsers at their Eisel-Lemire ceiling for random/mesh/canada; the
datasets cover only ~82% of ffc (slow path / exponent / inf-nan / long-int / JSON uncovered).

## Lab access (Intel fleet)
Use `scripts/intelx.sh <node> '<cmd>'` (now self-heals the /tmp bastion proxy on reboot).
Password in ~/.ffc-lab-pw (0600, NOT in repo). Nodes: clx1/clx2/icx2/spr/gnr1 (root).
ARM Graviton4: ubuntu@3.92.205.222 via ~/.ssh/benchmarksredislabsus-east-1.pem (clang).
NEVER run heavy benchmarks/exhaustive on the local machine — lab only.

## Impact summary: experiments/IMPACT.md ; redis-clients/ has the e2e redis-py benchmark.
