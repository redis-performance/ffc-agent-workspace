# Parser evolution — before/after our PRs, by version

Single-machine controlled sweep on **gnr1** (Granite Rapids, Xeon 6972P, 3.9 GHz),
`taskset -c 3`, `-march=native -DFFC_ROUNDS_TO_NEAREST`. Method: vary one parser,
**pin the other byte-identical**; benchmark all builds back-to-back (double sweep)
so they share machine state. Canonical MB/s = first `fastfloat` (char
from_chars→double) and the `ffc` row. Raw: `raw-sweeps-gnr1.txt`.

> **Methodology note.** The benchmark co-compiles both parsers into one binary, so
> changing one parser's source can shift the *other's* hot-loop alignment. Under
> **clang this is negligible** — the `ffc` control row is identical (1541.7) across
> all three fast_float builds, and the `fast_float` control matches between the two
> ffc builds (1577↔1577) — so clang cross-build deltas are **rigorous**. Under
> **gcc the layout is sensitive**: the `cur_pin` build came out ~18% high on *both*
> rows (lucky alignment, not algorithm), so only gcc pairs whose **control row
> matches** are quoted, and the gcc fast_float→v8.2.7 step is omitted as
> unreliable. **Clang is the trustworthy column; gcc is directional.**

## Versions

| Parser | "before" | "after our PRs" | "current" |
|--------|----------|-----------------|-----------|
| **ffc** | `v26.04.01` (ba6031a) | — | `ff899f5` = upstream/main, PRs **#23,#24,#25,#26** |
| **fast_float** | `7790aa6` **v8.2.5** (pre) | `ed86132` v8.2.5 + PR **#381** (integer-scan unroll) + **#382** (4-digit follow-up) | `e0b53ea` **v8.2.7** (upstream moved on) |

---

## ffc — v26.04.01 → current (our PRs #23–#26)

fast_float pinned at `e0b53ea` for both points.

| CC | dataset | v26.04.01 | current | Δ (our ffc PRs) |
|----|---------|----------:|--------:|----:|
| **Clang** | random | 1338 | 1542 | **+15.2%** |
| **Clang** | canada | 1100 | 1480 | **+34.6%** |
| **Clang** | mesh   |  893 | 1406 | **+57.4%** |
| GCC | random | 1708 | 2148 | +25.8% |
| GCC | canada | 1277 | 1859 | +45.6% |
| GCC | mesh   |  920 | 1525 | +65.8%· |

(· gcc mesh control matched only to ~7%; delta is large so direction is solid.)

**ffc's #23–#26 are a big, broad x86 win** — every dataset up double digits, mesh
nearly doubling on gcc. (The PR titles advertised ARM gains; x86 benefits just as
much from the integer/fraction straight-line scan + the nine micro-opts.)

---

## fast_float — v8.2.5 → +our PRs → v8.2.7

ffc pinned at `ff899f5` for all points. Clang column is rigorous (ffc control
identical across all three builds).

| CC | dataset | v8.2.5 (pre) | + our PRs #381/#382 | v8.2.7 (now) | our-PR Δ | total Δ (pre→now) |
|----|---------|------------:|--------------------:|------------:|----:|----:|
| **Clang** | random | 1445 | 1471 | 1577 | **+1.8%** | +9.1% |
| **Clang** | canada | 1162 | 1261 | 1463 | **+8.5%** | +25.9% |
| **Clang** | mesh   |  842 |  895 | 1111 | **+6.4%** | +32.1% |
| GCC | random | 2022 | 2026 | — | +0.2% | — |
| GCC | canada | 1352 | 1470 | — | +8.7% | — |
| GCC | mesh   | 1074 | 1101 | — | +2.5% | — |

(gcc v8.2.7 step omitted — `cur_pin` alignment-inflated; see note.)

**Our fast_float PRs (#381/#382) delivered canada +8.5% and mesh +6.4%** (clang),
with random flat — exactly the digit-scan datasets they targeted, matching the
"digit-scan ports transfer, compute-path ports don't" meta-finding. Upstream's
subsequent **v8.2.5→v8.2.7** then added another large chunk (canada +16%, mesh
+24%), so fast_float's total clang gain over the window is **+9–32%**.

---

## One-line takeaway

Over this window ffc gained more from **our** work (#23–#26: +15–57% clang) than
fast_float did from ours (#381/#382: +2–9% clang) — but **upstream fast_float's
own v8.2.5→v8.2.7 work (+7–24%)** is what actually closed the gap and flipped
GCC/random to fast_float on the live scoreboard (see `../../RACE.md`).
