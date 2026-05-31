# ffc vs fast_float — Race Leaderboard

Both parsers are mutable competitors, each pushed forward by experiments. This file
is the single source of truth for **who leads which cell** and therefore which
parser to attack next.

## Race rules

- **Surface = 12 cells**: {ARM `m8g.metal-24xl` (Graviton4, EIP 3.92.205.222),
  x86 `m7i.metal-24xl`} × {GCC, Clang} × {random, canada, mesh}.
- **Competitors**:
  - `ffc` — submodule `redis-performance/ffc.h`, C99 single-header.
  - `fast_float` — submodule `redis-performance/fast_float` @ branch `redis-perf/optim`,
    **live-tracking** `upstream/main` (fastfloat/fast_float). We carry our edits on
    top and open PRs upstream.
- **Canonical metric**: MB/s of the FIRST `fastfloat` row per dataset section
  (`findmax_fastfloat<char>`, from_chars→double) vs the `ffc` row. The 2nd
  `fastfloat` row (UTF-16, 2× volume) is **never** scored.
- **Symmetric editing**: an experiment targets exactly one parser; the other is the
  control. Accept → commit in that submodule; reject → `git checkout -- .`.
- **Re-baseline rule**: whenever `upstream/main` advances under the fork, re-capture
  BASELINE on all 12 cells before crediting/penalizing experiments. Every result
  file stamps `ffc-commit`, `fast_float-commit`, and `fast_float-base(upstream/main)`.

## Start line

| | |
|---|---|
| ffc commit | `43e22b3` (v26.04.01-12) |
| fast_float base | `7790aa6` = upstream/main, **v8.x** (2026-05-27) |
| Datasets | random [0,1], canada.txt, mesh.txt |

---

## Official scoreboard — metal VMs (pending deployment)

Numbers are canonical MB/s. Leader = higher MB/s. Gap = (leader−loser)/loser.
**TODO**: capture on `m8g.metal-24xl` (3.92.205.222) and `m7i.metal-24xl`, both
GCC + Clang, with the redirected build. Until then cells are empty.

### ARM — m8g.metal-24xl (Graviton4 / Neoverse V2)

| Compiler | Dataset | ffc | fast_float | Leader | Gap |
|----------|---------|----:|-----------:|--------|----:|
| GCC   | random |  —  |  —  | — | — |
| GCC   | canada |  —  |  —  | — | — |
| GCC   | mesh   |  —  |  —  | — | — |
| Clang | random |  —  |  —  | — | — |
| Clang | canada |  —  |  —  | — | — |
| Clang | mesh   |  —  |  —  | — | — |

### x86 — m7i.metal-24xl (Intel Sapphire Rapids)

| Compiler | Dataset | ffc | fast_float | Leader | Gap |
|----------|---------|----:|-----------:|--------|----:|
| GCC   | random |  —  |  —  | — | — |
| GCC   | canada |  —  |  —  | — | — |
| GCC   | mesh   |  —  |  —  | — | — |
| Clang | random |  —  |  —  | — | — |
| Clang | canada |  —  |  —  | — | — |
| Clang | mesh   |  —  |  —  | — | — |

---

## Provisional reference — local laptop (NOT scored)

Host `fco-tp`, Intel Core Ultra 7 155U. High variance (±5–26%, thermal/turbo),
single-machine — for pipeline validation only, **not** the official scoreboard.
Captured 2026-05-31, ffc `43e22b3` vs fast_float `7790aa6` (v8).

| Compiler | Dataset | ffc | fast_float | Leader | Gap |
|----------|---------|----:|-----------:|--------|----:|
| GCC(13.3)  | random | 947.7 | 883.9 | **ffc** | +7.2% |
| GCC(13.3)  | canada | 586.5 | 633.3 | **fast_float** | +8.0% |
| GCC(13.3)  | mesh   | 734.6 | 493.4 | **ffc** | +48.9% |
| Clang(18)  | random | 700.7 | 654.0 | **ffc** | +7.1% |
| Clang(18)  | canada | 666.4 | 500.9 | **ffc** | +33.0% |
| Clang(18)  | mesh   | 635.8 | 349.4 | **ffc** | +82.0% |

Early read (laptop, noisy): ffc already leads most cells vs fast_float v8; canada
under GCC is fast_float's clearest win and an obvious first attack target. Confirm
on metal before acting.

---

## Update protocol

On every **accepted** experiment, update the relevant cell(s) here and note the
direction of the head-to-head gap (`Race Δ`) in the EXPERIMENTS.md entry.
