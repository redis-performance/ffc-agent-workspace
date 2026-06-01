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

### ARM — Round 2 (2026-06-01): ffc vs MERGED upstream fast_float (`ed86132`)

After PRs #381 + #382 merged upstream, fast_float = `upstream/main` (`ed86132`) now
includes the integer-scan unroll + clang 4-digit follow-up. ffc `6ccc765`, same-session.

| Compiler | Dataset | ffc | fast_float | Leader | Gap | (was, EXP-049) |
|----------|---------|----:|-----------:|--------|----:|----:|
| GCC   | random | 1930.1 | 1098.7 | **ffc** | +76%  | +76% |
| GCC   | canada | 1737.1 |  925.6 | **ffc** | +88%  | +96% |
| GCC   | mesh   | 1749.7 |  503.5 | **ffc** | +247% | +371% |
| Clang | random | 1509.7 | 1304.0 | **ffc** | +16%  | +19% |
| Clang | canada | 1386.7 | 1174.8 | **ffc** | +18%  | +36% |
| Clang | mesh   | 1423.8 |  940.9 | **ffc** | +51%  | +69% |

ffc still leads every cell, but our own merged wins closed the gap notably (clang
canada +36%→+18%). fast_float's weakest cell remains **GCC mesh (+247%)** — the
Clinger/compute path on short numbers, the documented non-starter zone for safe ports.

---

### ARM — m8g.metal-24xl (Graviton4 / Neoverse V2) — Round 1 standings (`ip-172-31-55-171`)

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

> **CORRECTION (post-review):** the per-experiment Δ% above were measured against
> prior-session baselines and are inflated by ~2-3% cross-session drift (mesh-gcc
> worst). The EXP-049 gcc-mesh start line (369) was a low outlier; same-session
> re-measurement puts base ~472-484. Verified same-session gains for the EXP-050
> integer-scan unroll: **canada ~+3%, mesh ~+5% on both gcc and clang** (not +34%).
> The absolute MB/s in the table are approximately right; the *deltas vs the start
> line overstate the improvement*. Always measure base+patch back-to-back
> (program.md). EXP-052/053 deltas carry the same caveat.


## x86 — local fco-tp, CORE-PINNED (2026-06-02, reliable ±0.3%)

taskset -c 3 fixes the cross-run swing (±25%→±0.3%); local x86 is now usable for
rigorous racing. ffc `6ccc765` vs merged-upstream fast_float `ed86132`.

| Compiler | Dataset | ffc | fast_float | Leader | Gap |
|----------|---------|----:|-----------:|--------|----:|
| GCC   | random | 954.2 | 943.3 | **ffc** | +1.2% |
| GCC   | canada | 747.5 | 674.1 | **ffc** | +10.9% |
| GCC   | mesh   | 727.4 | 550.3 | **ffc** | +32.2% |
| Clang | random | 699.1 | 673.5 | **ffc** | +3.8% |
| Clang | canada | 670.7 | 576.6 | **ffc** | +16.3% |
| Clang | mesh   | 632.6 | 394.2 | **ffc** | +60.5% |

ffc leads all x86 cells too, but gaps are FAR smaller than ARM (gcc mesh +32% vs ARM
+247%) — ffc's ARM-only inline-asm (FFC_DIGIT_ACC10 etc.) doesn't apply on x86, so its
edge is mostly the algorithm. **gcc random is nearly tied (+1.2%)** — the cell where
fast_float is closest to its first win. Remaining gaps are compute-path (the merged
digit-scan wins are already present on x86 via upstream).

## Update protocol

On every **accepted** experiment, update the relevant cell(s) here and note the
direction of the head-to-head gap (`Race Δ`) in the EXPERIMENTS.md entry.

## x86 exploration (2026-06-02, local fco-tp — NOT scored)

Local x86 (Core Ultra 7) is too noisy for rigorous racing: ffc gcc canada swung
587→737 MB/s (±25%) across 3 runs. Median picture: ffc still leads all 6 cells on
x86 too (gcc canada ffc ~735 vs ff ~665 = +10%; the one run showing ff ahead was an
ffc low-outlier). No reliable small-win validation possible here.

**Rigorous x86 racing needs the m7i metal VM** (stable ±0.2% like the ARM box). Its
address isn't on record (only ARM EIP 3.92.205.222). Until then the x86 half of the
12-cell board stays unscored. ARM surface is exhausted for safe wins on both parsers.
