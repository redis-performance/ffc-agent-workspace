# Apple M6 readiness audit and optimization plan

**Follow-up:** setup and the first two experiments are complete; see
[APPLE-M6-SETUP.md](APPLE-M6-SETUP.md). The audit below preserves the initial
state before installation, dependency updates, and benchmark recovery.

Audited 2026-09-29. This is a planning document, not an accepted experiment.
No parser source or dependency checkout was changed. Remote refs were fetched.

## Repository and dependency status

The workspace matches `origin/main` at `846b282`. Matching workspace pins does
not mean matching canonical upstreams. All configured submodule remotes were
fetched recursively; canonical parser and benchmark remotes were also fetched
into `audit-upstream/*` refs without changing remote configuration.

| Component | Checkout | Comparison | Result |
|---|---|---|---|
| Workspace | `846b282` | `origin/main` | Current |
| ffc | `ff899f5` | Fork `perf/force-inline-ffc-impl` | Current on that branch |
| ffc | `ff899f5` | kolemannix/main `965d4db` | Diverged: 17 local-only / 5 upstream-only commits |
| fast_float | `46b2fba` | Fork `redis-perf/optim` | Current on that branch |
| fast_float | `46b2fba` | fastfloat/main `9498cc3` | 51 commits behind; can fast-forward by ancestry |
| Benchmark | `a28e2c4` | lemire/master `a856c09` | 18 commits behind; checkout also damaged or intentionally deleted |
| Experimental hiredis fork | `f7b670d` | Fork `ffc-double-parser` | Current on that branch |
| Experimental hiredis fork | `f7b670d` | redis/master `058ebcd` | Diverged: 3 local-only / 45 upstream-only commits |
| redis-clients/hiredis | `0ec54a8` | redis/master `058ebcd` | 33 commits behind |
| redis-clients/hiredis-py | `ee55dd4` | redis/master `9b16075` | 3 commits behind |
| hiredis-py/vendor/hiredis | `67c88a0` | redis/master `058ebcd` | 37 commits behind; follow parent pin when updating |
| redis-clients/redis-py | `095aa225` | redis/master `3b8e4eab` | 112 commits behind |

ffc's divergence is historical: `src/parse.h` and `src/common.h` are byte-identical
to canonical upstream. The `src/ffc.h` diff adds formatting integration and integer
APIs, with no changes to the floating-point conversion functions. Preserve the
old experiment branch, compare trees, and migrate to current upstream rather
than blindly replaying optimizations already incorporated there.

fast_float upstream includes the workspace's #398 combo, plus newer changes such
as #413 (Clang format folding/cold checks) and #410 (JavaScript format hot path).
An M6 comparison against the old fast_float checkout would miss these changes.

The benchmark has every tracked file staged for deletion. Its workspace pin,
`228c2241cdd2067a0f020fda5bbe1faaa047a03a`, is absent locally, and both
filipecosta90 and lemire remotes reject fetching that SHA with `not our ref`.
Do not discard the staged state without resolving the user's intent. Recovery
needs another copy of that commit, or migration to an available harness revision.

The checked-out benchmark revision's CMake file pins Abseil `d7aaad8` and
double-conversion `v3.1.5`, with optional Ryu at a fixed SHA. Canonical benchmark
`a856c09` instead pins Abseil `20250814.1`, removes double-conversion, and fetches
ffc and fast_float from moving main branches. These are manifest observations;
no dependency build was configured or validated. Freeze exact source revisions
for reproducible comparisons. When migrating to this harness, redirect BOTH
`FETCHCONTENT_SOURCE_DIR_FFC` and `FETCHCONTENT_SOURCE_DIR_FAST_FLOAT` to the
workspace checkouts; the current script only redirects fast_float and passes
the older `FFC_DIR` interface.

Latest hiredis-py pins vendor/hiredis to `616f228` (10 commits ahead of the current
vendor checkout), not hiredis master. Update nested submodules to the parent’s
declared revision, not independently to the newest master.

## Local readiness and verified findings

- Mac mini, Apple M6, arm64, 16 GB RAM; 2 Super, 4 Performance, 6 Efficiency cores.
  Both `system_profiler` and `sysctl hw.perflevel*.name` identify the core classes.
- Apple Clang 21.0.0 (`clang-2100.3.34.2`), macOS Darwin 27.
- CMake, `nproc`, and Linux `perf` are unavailable on PATH. Python is 3.9.6,
  below the workspace's stated >=3.10 prerequisite.
- Xcode lists CPU Counters, CPU Profiler, Processor Trace, and Time Profiler
  templates. Actual counter/trace collection has not been validated.
- `make -C ffc test` PASSED for the current checkout. Existing warnings concern
  `_Atomic` under C99 and static functions referenced from external inline code.
- Clang `-###` reports `apple-m1` for default flags and `-march=native`,
  `apple-m4` for `-mcpu=native`, and `apple-m6` for `-mcpu=apple-m6`.
  A small scalar C function compiled successfully to assembly with all three
  explicit flag choices. CPU-model selection alone does not prove a speedup.
- A standalone `uint64_t acc*10+d` function emits `mov #10; madd` for all three
  flags. The parser forces two shifted adds through inline assembly on Clang
  AArch64. This identifies a concrete comparison, not a latency conclusion.

No local benchmarks or profiles were run. This task requested an audit/plan;
`.workspace-memory/no-heavy-tests-local.md` also records a standing restriction
against local benchmark/profile workloads. A subsequent M6 execution phase needs
an explicit local-run scope, preferably short, single-worker runs. No exhaustive
all-core sweep is needed for this planning phase.

## Execution plan

1. **Recover and freeze the baseline.** Resolve benchmark deletions and missing
   pin; retain old revisions for historical reproducibility. Refresh parsers on
   an isolated integration branch and update downstream clients separately.
   Verify current ffc and fast_float correctness before measuring anything.
2. **Make the measurement scripts work on macOS.** Install missing prerequisites;
   use bounded build parallelism; collect CPU identity with `sysctl`; expose
   compiler target flags and float/double selection. Preserve failed command
   exit statuses (current scripts hide some failures with `|| true`). Make the
   profiler use the same build tree, parser, precision, and dataset as the
   benchmark; it currently ignores `COMPILER` and only uses the default binary.
3. **Establish an M6 baseline.** Run double and float on random/canada/mesh, with
   fixed revisions, flags, data hashes, and recorded rounding-mode assumptions.
   Alternate baseline/candidate runs, warm up, report medians and variability.
   Record QoS and inspect actual core placement; QoS is not strict CPU pinning.
   Distinguish Super/Performance/Efficiency execution and thermal drift.
4. **Profile the parser itself.** Add a Darwin backend using Instruments CPU
   Profiler/CPU Counters and, when available, Processor Trace. Retain Linux perf
   output on Linux. Capture hot symbol, module, weight, cycles/instructions per
   value, branch behavior, and the inferred bottleneck. Avoid profiling only the
   full suite where unrelated parsers or dataset generation dominate. Existing
   Apple counter support in the harness uses private kperf APIs and needs M6
   validation; the presence of that header does not establish working counters.
5. **Run the ranked experiments below, one change at a time.** Change only
   `ffc/src/*.h`, regenerate with `make -C ffc ffc.h`, rebuild with
   `scripts/build-bench.sh`, run `make -C ffc test`, then benchmark and profile.
   Log each actual experiment in EXPERIMENTS.md and synchronize counts after
   decisions. Define the macOS equivalent of the mandatory perf report in the
   workflow before accepting results; do not silently skip profiling.

## Ranked M6 experiments

| Priority | Candidate | Evidence and decision criterion |
|---|---|---|
| 1 | `-mcpu=apple-m6` vs existing `-march=native` and `-mcpu=native` | Current flags select older CPU models. Compare whole-parser assembly and both precisions; accept only measured throughput gains. |
| 2 | Forced shift/add vs plain C multiply-add in `FFC_DIGIT_ACC10` | Current gate covers all Clang AArch64 despite Graviton-specific evidence. Test integer, fraction-tail, and exponent sites independently; inspect dependency chains and register pressure. |
| 3 | SWAR unroll shape: existing 2x versus compact loop | Existing 16-byte/8-byte structure was tuned for older Clang on Graviton. Measure instruction footprint, constant materialization, branches, and spills on M6. Test short and long inputs. |
| 4 | Clang PGO, then ThinLTO as separate build experiments | Existing Linux PGO evidence motivates a fresh test. Train on representative mixed inputs and evaluate held-out inputs; distinguish build-specific gains from portable source changes. |
| 5 | Bounded NEON ASCII digit validation/conversion for long inputs | Current NEON helpers operate on UTF-16; the ASCII hot path is SWAR. A new ASCII path could help longer runs but may lose on short values. Use strict length guards; verify page-boundary safety. |
| 6 | Cold-path layout / parsed-struct materialization | Pursue only if M6 profiles show spills or instruction-fetch costs. EXP-064 rejected a prior outline attempt; do not assume older wins still apply. |

Keep `FFC_ROUNDS_TO_NEAREST` explicit: the benchmark currently defines it, but
general library callers may change rounding modes. Compare equivalent contracts
and retain signed-zero, subnormal, halfway, overflow/underflow, long-digit, invalid
input, and returned-pointer correctness. Include short integers, exponent-heavy
strings, >19-digit inputs, and mixed valid/invalid strings alongside the standard
three datasets. Avoid `-ffast-math` as a shortcut for a correctly rounded parser.

Acceptance: improvement beyond run noise on at least one dataset, no credible
regression on others, correctness passing, and a profile explaining the gain.
Cross-check portable source edits on Linux x86 and Graviton before acceptance;
Apple-specific selection needs its own evidence and a preserved generic path.
No percentage improvement is predicted by this audit.

## References

- [Apple: Optimize CPU performance with Instruments](https://developer.apple.com/videos/play/wwdc2025/308/)
  describes CPU profiling, Processor Trace, and CPU Counters bottleneck analysis.
- [Apple Silicon CPU Optimization Guide](https://developer.apple.com/documentation/apple-silicon/cpu-optimization-guide)
  lists ISA, topology, instruction timing, and performance-monitoring coverage.
  The current guide download requires a developer login and additional agreement;
  no M6 instruction latency table was accessed or assumed in this audit.
- Local evidence: `ffc/src/parse.h:185` and `:202`, `scripts/build-bench.sh`,
  `scripts/run-bench.sh`, `scripts/run-profile.sh`, `experiments/SUMMARY.md`.
