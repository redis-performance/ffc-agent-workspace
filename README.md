# ffc-agent-workspace

Performance optimization workspace for [ffc.h](https://github.com/redis-performance/ffc.h) —
a C99 single-header port of Daniel Lemire's fast_float library.

Goal: push parsing throughput beyond the current baseline through profiled,
evidence-based micro-optimizations. Every experiment is logged; failures are as
valuable as wins.

---

## Optimization Pipeline

Population-based selection AND implementation, inspired by AutoKernel (arXiv:2603.21331).

```
┌─────────────────────────────────────────────────────────────────────────┐
│  PROFILE  →  classify bottleneck  →  pick tier from program.md          │
└───────────────────────────┬─────────────────────────────────────────────┘
                            │
                ┌───────────▼───────────┐
                │   SELECTION PHASE     │
                │  3 proposer agents    │  ← opus / sonnet / haiku (parallel)
                │  each proposes next   │
                │  experiment           │
                └───────────┬───────────┘
                            │
                ┌───────────▼───────────┐
                │   CHAIR AGENT         │  ← opus reads all 3 proposals
                │  picks winning        │
                │  hypothesis           │
                └───────────┬───────────┘
                            │
          ┌─────────────────▼──────────────────┐
          │       IMPLEMENTATION PHASE          │
          │  3 implementer agents in parallel   │  ← opus / sonnet-a / sonnet-b
          │  each produces a unified diff       │
          │  applied to a fresh ffc/src/ copy   │
          └──┬──────────────┬──────────────┬───┘
             │              │              │
         variant-1      variant-2      variant-3
        correctness    correctness    correctness
        + benchmark    + benchmark    + benchmark
             │              │              │
          pass/fail      pass/fail      pass/fail
             └──────────────┴──────────────┘
                            │
                    best passing variant
                            │
                ┌───────────▼───────────┐
                │  MULTI-STAGE VERIFY   │
                │  Stage 1: unit tests  │
                │  Stage 2: supplemental│
                │  Stage 3: exhaustive  │
                └───────────┬───────────┘
                            │
                ┌───────────▼───────────┐
                │  STEP 1: BENCHMARK    │  all 3 datasets vs baseline
                └───────────┬───────────┘
                            │
                ┌───────────▼───────────┐
                │  STEP 2: PROFILE      │  classify new bottleneck
                └───────────┬───────────┘
                            │
               ┌────────────┴────────────┐
               │                         │
           ACCEPT                     REJECT
      git commit ffc/src/         git checkout ffc/src/
      log + update SUMMARY        log reason + update
                                  Known Non-Starters
               └────────────┬────────────┘
                            │
                   log token cost to
                   token-ledger.tsv
                   → next iteration
```

Two-step validation is mandatory before accepting any change:

| Step | Tool | Signal |
|------|------|--------|
| 1 — Benchmark | `simple_fastfloat_benchmark` | MB/s, Mfloat/s vs fastfloat baseline |
| 2 — Profile | `perf record -g` + `perf report` | Hot symbols, % CPU, IPC |

A result that wins in benchmark but reveals a new bottleneck in profile is a partial
win — document it and keep going.

---

## Current State (post EXP-015 / EXP-018 rejected, 2026-05-27)

### x86 — Intel Xeon Platinum 8488C (m7i.metal-24xl)

| Dataset | ffc MB/s | fastfloat MB/s | Δ% |
|---------|----------|----------------|----|
| random [0,1] | **1960** | 2018 | -2.9% |
| canada.txt | **1565** | 1407 | **+11.2% (ffc leads)** |
| mesh.txt | **1187** | 1124 | **+5.6% (ffc leads)** |

*x86 numbers from EXP-009; EXP-015 x86 inconclusive (high variance)*

### ARM — Graviton4 (m8g.metal-24xl)

| Dataset | ffc MB/s | fastfloat MB/s | Δ% |
|---------|----------|----------------|----|
| random [0,1] | **1823** | 1075 | **+70%** |
| canada.txt | **1562** | 894 | **+75%** |
| mesh.txt | **1366** | 484 | **+182%** |

Baselines: `experiments/EXP-001/bench-results/`

---

## Experiments

All experiments are logged in [`experiments/EXPERIMENTS.md`](experiments/EXPERIMENTS.md).
[`experiments/SUMMARY.md`](experiments/SUMMARY.md) is the single source of truth for status.

| Status | Count |
|--------|-------|
| Accepted | 5 |
| Rejected | 13 |
| Parked | 1 |
| In Progress | 0 |

---

## Workspace Layout

```
ffc/                            ffc.h source (submodule — redis-performance/ffc.h)
  src/                          Edit these files; run `make -C ffc ffc.h` to regenerate
    parse.h                     Main parsing logic — primary optimization target
    ffc.h                       Core algorithm
    common.h                    SIMD detection, inline helpers
    bigint.h                    Slow path (Eisel-Lemire fallback)
simple_fastfloat_benchmark/     Lemire's benchmark suite (submodule — filipecosta90/fork)
  benchmarks/benchmark.cpp      ffc wired in via ENABLE_FFC
  data/                         canada.txt, mesh.txt, random generators
experiments/
  EXPERIMENTS.md                Append-only experiments log
  SUMMARY.md                    Status table (keep in sync with README counts above)
  TEMPLATE.md                   Copy-paste template for new entries
  token-ledger.tsv              Machine-readable token cost per agent per phase
  EXP-NNN/                      One folder per experiment
    bench-results/              Timestamped benchmark output files (BASELINE + post)
    profile-results/            Timestamped perf.data files
    proposals/                  3 proposals + chair decision
    variants/                   3 implementation diffs + bench results
scripts/
  build-bench.sh                Regenerate ffc.h + rebuild benchmark
  run-bench.sh                  Run all benchmark datasets, save output
  run-profile.sh                perf record + report on benchmark binary
  select.sh                     Selection phase: 3 proposers + chair (parallel)
  implement.sh                  Implementation phase: 3 variants + best-wins (parallel)
  agent-run.sh                  Agent-agnostic shim (AGENT=claude|codex|aider)
.claude/
  CLAUDE.md                     Agent instructions (workflow, rules)
  program.md                    Tiered optimization playbook (Tiers 1–6, bottleneck table)
  skills/
    optimize.md                 Full loop orchestration skill
    select.md                   Proposer agent prompt (one of three)
    chair.md                    Chair agent prompt (picks winning proposal)
    implement.md                Implementer agent prompt (one of three variants)
    bench.md                    Benchmark runner skill
    profile.md                  Profiling skill
.workspace-memory/
  MEMORY.md                     Persistent memory index (committed, agent-backend-agnostic)
```

---

## Quick Start

```bash
git clone --recurse-submodules <this-repo>
cd ffc-agent-workspace

# Build benchmark with ffc wired in
./scripts/build-bench.sh

# Step 1: get baseline numbers
./scripts/run-bench.sh

# Step 2: profile
./scripts/run-profile.sh

# Edit ffc/src/parse.h (or other src files), then:
make -C ffc ffc.h
./scripts/build-bench.sh
./scripts/run-bench.sh      # compare
./scripts/run-profile.sh    # verify bottleneck shifted
```

---

## Inspiration

This workspace was directly inspired by **AutoKernel: Autonomous GPU Kernel Optimization via Iterative Agent-Driven Search** (Jaber & Jaber, RightNow AI, arXiv:2603.21331, 2026).

AutoKernel demonstrated that "the workflow of an expert kernel engineer is itself a simple loop: write a candidate, benchmark it, keep improvements, discard regressions, repeat" — and that mechanizing this pattern through autonomous agents transforms weeks of expert work into overnight automated processes. We apply the same loop to CPU float parsing instead of GPU kernels.

Key design choices borrowed from AutoKernel:
- **Immutable benchmark harness** — the benchmark is never modified by the agent, preventing gaming
- **Multi-stage correctness before any performance measurement** — broken code is never benchmarked
- **Git as experiment ledger** — accept = commit advances, reject = `git reset --hard HEAD~1`
- **Tiered optimization playbook** (`.claude/program.md`) — structured catalogue of techniques by expected gain
- **Bottleneck classification** — profile output classified into actionable categories to steer next tier
- **Move-on criteria** — prevents over-investment in diminishing returns

---

## References

- Jaber & Jaber, [AutoKernel: Autonomous GPU Kernel Optimization via Iterative Agent-Driven Search](https://arxiv.org/abs/2603.21331), arXiv, 2026 ← **direct inspiration for this workspace**
- Daniel Lemire, [Number Parsing at a Gigabyte per Second](https://arxiv.org/abs/2101.11408), SPE 51(8), 2021
- Noble Mushtak, Daniel Lemire, [Fast Number Parsing Without Fallback](https://arxiv.org/abs/2212.06644), SPE 53(7), 2023
- [fast_float C++ reference implementation](https://github.com/fastfloat/fast_float)
- [Benchmark suite](https://github.com/lemire/simple_fastfloat_benchmark)
