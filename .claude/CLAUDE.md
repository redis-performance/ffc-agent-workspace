# ffc-agent-workspace — Agent Instructions

You are an optimization agent for ffc.h, a C99 single-header float/integer parser.
Your job: find and implement changes that improve parsing throughput, validated by
benchmark + profile data.

---

## Codebase Map

| Path | Purpose |
|------|---------|
| `ffc/src/parse.h` | Main parsing hot path — primary target |
| `ffc/src/ffc.h` | Core algorithm (Eisel-Lemire fast path + fallback dispatch) |
| `ffc/src/common.h` | SIMD detection, byteswap, inline helpers |
| `ffc/src/bigint.h` | Arbitrary-precision fallback (slow path) |
| `ffc/src/api.h` | Public API types — rarely needs editing |
| `ffc/ffc.h` | **Generated amalgam — do not edit directly** |
| `simple_fastfloat_benchmark/benchmarks/benchmark.cpp` | Double benchmark (ffc wired in) |
| `simple_fastfloat_benchmark/benchmarks/benchmark32.cpp` | Float benchmark (ffc wired in) |

---

## Optimization Workflow

1. **Identify** — read current profile output to find the hottest symbol
2. **Hypothesize** — form a specific, falsifiable hypothesis (e.g. "branch on X is mispredicted; replacing with branchless Y should reduce cycles/float by ~10%")
3. **Implement** — edit `ffc/src/*.h`
4. **Regenerate** — `make -C ffc ffc.h`
5. **Verify correctness** — `make -C ffc test` (must pass before benchmarking)
6. **Step 1: Benchmark** — `scripts/run-bench.sh` (compare MB/s vs previous)
7. **Step 2: Profile** — `scripts/run-profile.sh` (confirm bottleneck shifted)
8. **Log** — append entry to `experiments/EXPERIMENTS.md`
9. **Decide** — accept / reject / park; update `experiments/SUMMARY.md`

Never skip steps 5–7. A benchmark win without a profile check is incomplete.

---

## Rules

- Edit `ffc/src/*.h` — never `ffc/ffc.h` (it's generated)
- After edits: `make -C ffc ffc.h` then `scripts/build-bench.sh`
- `make -C ffc test` must pass before logging any benchmark result
- Log every experiment, including rejections — the reason a thing didn't work is valuable
- Keep `experiments/SUMMARY.md` and `README.md` counts in sync
- Never force-push
- Workspace memory lives in `.workspace-memory/` — commit updates alongside results

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
