# ffc-agent-workspace — Agent Instructions

You run a **race between two mutable float/integer parsers**: `ffc` (C99
single-header) and `fast_float` (the upstream C++ reference). Your job: find and
implement changes that push **either** competitor forward, validated by benchmark +
profile data, and track the head-to-head in `experiments/RACE.md`. Each experiment
targets exactly one parser; the other is the control. fast_float wins that are
portable become upstream PRs.

The benchmark harness is the **immutable** referee. Both parsers are mutable
submodules whose tips reflect their best accepted state.

---

## Codebase Map

| Path | Purpose |
|------|---------|
| `ffc/src/parse.h` | ffc main parsing hot path — primary ffc target |
| `ffc/src/ffc.h` | ffc core algorithm (Eisel-Lemire fast path + fallback dispatch) |
| `ffc/src/common.h` | ffc SIMD detection, byteswap, inline helpers |
| `ffc/src/bigint.h` | ffc arbitrary-precision fallback (slow path) |
| `ffc/src/api.h` | ffc public API types — rarely needs editing |
| `ffc/ffc.h` | **ffc generated amalgam — do not edit directly** |
| `fast_float/include/fast_float/*.h` | **fast_float competitor source — edit these** (parse_number.h, ascii_number.h, digit_comparison.h, float_common.h, …) |
| `fast_float/` | submodule `redis-performance/fast_float` @ `redis-perf/optim`, live-tracks `upstream/main`; `upstream` remote = fastfloat/fast_float |
| `simple_fastfloat_benchmark/benchmarks/benchmark.cpp` | Double benchmark (both wired in) — **immutable** |
| `simple_fastfloat_benchmark/benchmarks/benchmark32.cpp` | Float benchmark (both wired in) — **immutable** |
| `experiments/RACE.md` | **12-cell head-to-head leaderboard** — read before picking a target |
| `.claude/program.md` | **Tiered optimization playbook** — read before each experiment |

---

## Optimization Workflow

This loop is directly inspired by AutoKernel (arXiv:2603.21331): immutable
benchmark harness + mutable code + git as the experiment ledger.

0. **Pick a target** — read `experiments/RACE.md`; attack whichever parser
   (`ffc` or `fast_float`) trails in the most cells, or cross-pollinate a win
   from one into the other. Record `Target: ffc | fast_float` in the experiment.
1. **Profile** — run `scripts/run-profile.sh`; identify the hottest symbol in the target
2. **Classify** — use `.claude/program.md` Bottleneck Classification table to pick a tier
3. **Consult playbook** — pick the highest-expected-gain technique from that tier not yet tried
4. **Hypothesize** — one falsifiable sentence before touching code
5. **Implement** — one technique, minimal diff, in the **target's** source only:
   - ffc → edit `ffc/src/*.h`
   - fast_float → edit `fast_float/include/fast_float/*.h`
6. **Multi-stage correctness** (all must pass before benchmarking):
   - **ffc target**:
     - Stage 1: `make -C ffc ffc.h && make -C ffc test` — unit tests
     - Stage 2: `make -C ffc supplemental_tests` — fastfloat reference corpus
     - Stage 3: `make -C ffc exhaustive` — when touching the mantissa loop
   - **fast_float target**:
     - Stage 1+2: `scripts/test-fast_float.sh` — core unit tests + supplemental
       corpus, compiled under fast_float's strict `-Werror` warning set
     - Stage 3: `EXHAUSTIVE=1 scripts/test-fast_float.sh` — when touching the
       mantissa / digit loop
7. **Step 1: Benchmark** — `scripts/build-bench.sh && scripts/run-bench.sh`
   (set `COMPILER=gcc|clang` to race a specific toolchain). Both `ffc` and
   `fastfloat` rows are emitted every run.
8. **Step 2: Profile** — `scripts/run-profile.sh`; classify new bottleneck
9. **Commit or revert** (in the target submodule):
   - Accept → `git -C <ffc|fast_float> add -A && git -C <…> commit -m "EXP-NNN: ..."`
   - Reject → `git -C <ffc|fast_float> checkout -- .`
10. **Log** — append to `experiments/EXPERIMENTS.md` (incl. `Target` + `Race Δ`);
    update `experiments/SUMMARY.md` and the relevant cell(s) in `experiments/RACE.md`

Never benchmark broken code. Never skip the profile step. Each submodule's tip
always reflects that parser's best accepted state.

---

## Rules

- ffc: edit `ffc/src/*.h` — never `ffc/ffc.h` (generated); then `make -C ffc ffc.h`
- fast_float: edit `fast_float/include/fast_float/*.h` — the benchmark consumes these
  headers directly (no amalgamation step needed)
- One experiment targets exactly ONE parser; the other parser is the untouched control
- All correctness stages for the target must pass before benchmarking — no exceptions
- Log every experiment, including rejections — the reason a thing didn't work is valuable
- Keep `experiments/SUMMARY.md`, `experiments/RACE.md`, and `README.md` counts in sync
- The benchmark harness is immutable — never modify it to make either parser look better
- Commit on accept / `git checkout -- .` on reject, **in the target submodule** — each
  submodule tip = that parser's best known state
- A portable fast_float win should be proposed upstream: push `redis-perf/optim` and
  open a PR from `redis-performance/fast_float` to `fastfloat/fast_float`
- Before a race round, rebase `fast_float` `redis-perf/optim` on `upstream/main`; if
  upstream moved, re-capture baselines (see baseline rule below)
- After a permanent dead end: add to "Known Non-Starters" in `.claude/program.md`
- Never force-push
- Workspace memory lives in `.workspace-memory/` — commit updates alongside results
- **Always capture a BASELINE benchmark on every target machine before applying any patch.**
  Before deploying an experiment to a metal VM (or any non-local environment), run the
  benchmark on that machine with the pre-patch binaries (BOTH ffc and fast_float) and save it as
  `experiments/<EXP-NNN>/bench-results/<date>-<machine>-BASELINE.txt`. Post-experiment results
  are only meaningful when paired with a same-machine, same-conditions, same-provenance baseline.
  Re-baseline all 12 cells whenever `fast_float` `upstream/main` advances.
- Each experiment's results live under `experiments/<EXP-NNN>/bench-results/` — run the
  benchmark as `EXP=EXP-NNN scripts/run-bench.sh` so files land in the right folder.

---

## Two-Step Validation Criteria

**Benchmark (Step 1) — accept signal:**
- ≥ +2% improvement on at least one dataset
- No regression > 1% on other datasets (within noise)
- Numbers stable across 3 consecutive runs

**Profile (Step 2) — accept signal:**
- Target symbol's CPU % decreased, OR
- IPC increased, OR
- Branch mispredict rate decreased
- No surprising new bottleneck that voids the benchmark win

**Race Δ (record on every experiment):**
- State whether the head-to-head gap vs the other parser closed, opened, or flipped
  the leader in each affected cell. An accepted win that doesn't change the leader is
  still progress (absolute MB/s up); a change that flips a cell is a headline result.

**Reject if:**
- Benchmark shows no improvement (< 1% delta, within noise)
- Correctness test fails
- Profile reveals the "win" was measurement noise

**Park if:**
- Approach is promising but needs a different prerequisite first
- Improvement is real but < 2% (not worth the code complexity)
- Requires architectural change beyond current scope

---

## Benchmark Datasets

| Dataset | Characteristics | Why It Matters |
|---------|-----------------|----------------|
| random [0,1] | Short, uniform mantissas | Fast-path coverage |
| canada.txt | Real geographic coordinates, varied precision | Realistic mixed input |
| mesh.txt | Short floats (< 8 chars each) | Simulates tight inner-loop parsing |

Always report all three. A change that wins on random but regresses canada is a regression.

---

## Profile Interpretation

Key symbols to watch in `perf report`:

| Symbol | What it means |
|--------|--------------|
| `ffc_from_chars_double` | Top-level dispatch |
| `ffc_parse_number` / `ffc_parse_mantissa` | Digit scanning |
| `ffc_compute_float64` | Eisel-Lemire fast path |
| `ffc_digit_comp` | Slow path (big integer comparison) |
| `__memcpy_*` | Unexpected copy overhead |

If `ffc_digit_comp` is > 5% on random inputs, the fast path is failing too often.

---

## Experiment Log Format

Append to `experiments/EXPERIMENTS.md`:

```markdown
## EXP-NNN — YYYY-MM-DD — [short title]

**Hypothesis**: [one sentence]
**Files changed**: `ffc/src/X.h` lines N–M

### Step 1: Benchmark
| Dataset          | Before (MB/s) | After (MB/s) | Δ%   |
| random [0,1]     |               |              |      |
| canada.txt       |               |              |      |
| mesh.txt         |               |              |      |

### Step 2: Profile (top symbols, after)
```
perf report excerpt
```

**Decision**: accept / reject / park
**Reason**: [one or two sentences]
```

---

## Workspace Memory

Write memories to `.workspace-memory/` (not `~/.claude/projects/`).
Use the same frontmatter format as the redis-agent-workspace.
Commit `.workspace-memory/` changes alongside experiment results.
