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

### ARM — m8g.metal-24xl (Graviton4 / Neoverse V2) — CURRENT standings (`ip-172-31-55-171`)

Canonical MB/s, stable (±0.1–1.8%). ffc `6ccc765`. fast_float advancing on
`redis-perf/optim`. ffc leads every cell; fast_float is the primary attack target.

| Compiler | Dataset | ffc | fast_float | Leader | Gap | fast_float set by |
|----------|---------|----:|-----------:|--------|----:|----|
| GCC   | random | 1920.7 | 1088.5 | **ffc** | +76.5%  | EXP-050 |
| GCC   | canada | 1737.2 |  948.1 | **ffc** | +83.2%  | EXP-053 |
| GCC   | mesh   | 1736.9 |  496.1 | **ffc** | +250.1% | EXP-053 |
| Clang | random | 1510.7 | 1365.7 | **ffc** | +10.6%  | EXP-052 |
| Clang | canada | 1387.3 | 1056.3 | **ffc** | +31.3%  | EXP-052 |
| Clang | mesh   | 1423.3 |  899.4 | **ffc** | +58.2%  | EXP-052 |

Start-line baseline (EXP-049, fast_float `7790aa6` v8): GCC 1088/889/369,
Clang 1267/1023/842. Files: `experiments/EXP-049/bench-results/`.

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

## Session log — 2026-06-01 (overnight, ARM metal)

Accepted (committed + pushed to `redis-perf/optim`): **EXP-050, EXP-052, EXP-053** —
all fast_float digit-scanning ports from ffc. Net fast_float improvement vs the v8
start line:

| Cell | start → now | Δ |
|------|-------------|---|
| GCC mesh   | 369.0 → 496.1 | **+34.4%** |
| GCC canada | 888.7 → 948.1 | **+6.7%** |
| Clang random | 1267.0 → 1365.7 | **+7.8%** |
| Clang mesh   | 841.6 → 899.4 | **+6.9%** |
| Clang canada | 1023.2 → 1056.3 | +3.2% |
| GCC random | 1087.9 → 1088.5 | flat |

Rejected (reverted): EXP-051, 054, 055, 056. Meta-finding: ffc's **digit-scan** ports
transfer to fast_float; its **compute/Clinger-path** ports all regress it (see
program.md Known Non-Starters). ffc itself is at its tuned ceiling on this surface.

## Update protocol

On every **accepted** experiment, update the relevant cell(s) here and note the
direction of the head-to-head gap (`Race Δ`) in the EXPERIMENTS.md entry.
