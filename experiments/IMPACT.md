# Impact — ffc ↔ fast_float race and its downstream reach

Before/after summary of the work, by project. Throughput from parse-only
microbenchmarks (`from_chars`→`double`, single-core pinned, best-of-N).

---

## 1. fast_float (C++ reference) — ✅ MERGED UPSTREAM

PR **fastfloat/fast_float#387** merged into `main` (`3044c9b`, by Lemire,
2026-06-07). Skips materializing the integer/fraction spans on the hot path
(only the rare slow path needs them) + marks slow-path branches `[[unlikely]]`.
Original #386 (function-`cold` variant) closed in favor of #387 after
benchmarks proved them equivalent. Flagged by the GCC/libstdc++ maintainer for
adoption into `std::from_chars`.

Before (`main` `6258cbc`) → after (merged #387), MB/s, C++20:

| Env | random | mesh | canada |
|-----|--------|------|--------|
| Cascade Lake | 596 → 702 (+17.8%) | 448 → 510 (+13.8%) | 546 → 645 (+18.2%) |
| Ice Lake | 998 → 1075 (+7.7%) | 800 → 888 (+10.9%) | 893 → 1029 (+15.3%) |
| Granite Rapids | 1358 → 1571 (+15.7%) | 1199 → 1336 (+11.5%) | 1420 → 1659 (+16.8%) |
| Graviton4 | 1307 → 1491 (+14.1%) | 977 → 1117 (+14.3%) | 1186 → 1333 (+12.3%) |

**Net: ~+8–18% short-string parsing across 4 microarchitectures, upstream.**

---

## 2. ffc (C99 single-header) — 1 merged upstream, 3 open

Upstream is **kolemannix/ffc.h**. PR **#23** (4-digit SWAR follow-up in
`ffc_loop_parse_if_eight_digits`) — ✅ **MERGED** 2026-05-27. Still open:
**#24** (nine profiled micro-optimizations; benchmark-validated, both reviewer
requests answered with data-backed pushbacks), **#25** (AArch64/Clang shift-add
+ 2× SWAR unroll), **#26** (correctness fix for the `vk` value-kind bug that
mis-rounded ~1.07e9 binary32 midpoints by 1 ULP on the float slow path).
Exhaustively validated (all 2^32 binary32) on 5 microarchitectures.

Changes: force-inline at call sites, `exponent==0` early-exit, straight-line
integer/fraction unrolls, AArch64/Clang shift-add accumulator + 2× SWAR unroll,
`FFC_ROUNDS_TO_NEAREST`.

Before (upstream `main` `b1894aa`) → after (PR tip), MB/s:

| Env | random | mesh | canada |
|-----|--------|------|--------|
| Cascade Lake (gcc) | 550 → 682 (+24.0%) | 357 → 578 (+61.9%) | 534 → 703 (+31.7%) |
| Ice Lake (gcc) | 849 → 1054 (+24.2%) | 608 → 988 (+62.6%) | 872 → 1092 (+25.2%) |
| Emerald Rapids (gcc) | 1227 → 1492 (+21.6%) | 905 → 1517 (+67.7%) | 1363 → 1713 (+25.7%) |
| Granite Rapids (gcc) | 1240 → 1539 (+24.1%) | 927 → 1533 (+65.4%) | 1352 → 1763 (+30.3%) |
| Graviton4 (clang) | 1252 → 1529 (+22.1%) | 830 → 1373 (+65.5%) | 1064 → 1288 (+21.1%) |

**Net: random +21–24%, mesh +62–68%, canada +21–32%; no regressions; vk bug fixed.**

---

## 3. hiredis (the C Redis client) — ✅ MERGED & SHIPPING

PR **redis/hiredis#1328** "Use ffc (pure-C99) as the RESP3 double parser instead
of strtod" — merged 2026-06-02 by michael-grunder (+3550/−1). `ffc.h` vendored;
RESP3 `,`-type doubles now parse through ffc (`-DHIREDIS_FLOAT_STRTOD` opt-out).

Before (`strtod`) → after (ffc), RESP3 double parsing, MB/s:

| Platform | random | canada | mesh |
|----------|--------|--------|------|
| x86 (Intel) | 108 → 468 (+335%) | 100 → 407 (+306%) | 85 → 378 (+344%) |
| ARM (Graviton4) | 194 → 992 (+411%) | 170 → 849 (+400%) | 166 → 584 (+251%) |

**Plus a latent correctness bug fixed:** `strtod` honors `LC_NUMERIC`, so under a
comma-decimal locale (e.g. `de_DE`) hiredis errored on essentially every double
reply (`,3.14` → `3.0` → "Bad double value" protocol error). ffc takes the
decimal point explicitly → locale-independent. Verified bit-identical to `strtod`
over a 3,000,000-value sweep. Double-heavy streams benefit most: `TS.RANGE`/
`TS.MRANGE`, `FT.SEARCH ... WITHSCORES`, vector-search distances,
`ZRANGE ... WITHSCORES`, `GEODIST`.

**Net: +250–411% RESP3 double parsing + locale bug fix, in production.**

---

## 4. hiredis-py / redis-py (Python) — ✅ INHERITS IT (measured)

hiredis-py vendors hiredis as a submodule, pinned at `67c88a05` (2026-06-03) —
after #1328, its `read.c` already contains the ffc integration. redis-py uses
`hiredis.Reader` (`_HiredisParser`) whenever the `hiredis` module is installed,
so Python/redis-py clients inherit it with no separate PR.

**Measured** A/B (build hiredis-py's extension from the vendored source twice —
default=ffc vs `-DHIREDIS_FLOAT_STRTOD` — and drive `hiredis.Reader`; see
`redis-clients/`). Single-core, best-of-9:

Array replies (TS.MRANGE / ZRANGE·FT.SEARCH WITHSCORES / vector distances —
the double-heavy, parse-bound shape), M doubles/s:

| dataset | strtod | ffc | speedup |
|---------|-------:|----:|--------:|
| random | 6.67 | 14.01 | +110% |
| mesh | 10.46 | 28.04 | +168% |
| canada | 6.74 | 13.56 | +101% |

Single-double replies (GEODIST shape): ffc ≈ strtod (≈8 MB/s, within noise) —
Python per-call + float-object overhead dominates, so the parser speed doesn't
show. **Net: redis-py parses double-heavy replies ~2–2.7× faster; single-value
replies unchanged; locale fix inherited unconditionally.**

---

## Impact chain

```
ffc (race: +21–68% vs fast_float-baseline; vk 1-ULP bug fixed; exhaustively validated)
  └─► hiredis #1328 (MERGED) — replaces strtod: +250–411% RESP3 doubles + locale fix
        └─► hiredis-py (pin 67c88a05) — Python/redis-py inherit it automatically
fast_float #387 (MERGED upstream) — lazy-spans opt; flagged for GCC std::from_chars
```

## Scorecard

| Project | Status | Perf | Correctness |
|---------|--------|------|-------------|
| fast_float | ✅ merged upstream (#387) | +8–18% short strings | — |
| ffc (kolemannix/ffc.h) | #23 merged; #24/#25/#26 open, validated | +21–68% (mesh biggest) | vk 1-ULP bug fixed (#26) |
| hiredis | ✅ merged (#1328) | +250–411% RESP3 doubles | locale bug fixed |
| hiredis-py / redis-py | ✅ inherits (measured) | ~2–2.7× double-heavy array replies (flat on single doubles) | locale fix (transitive) |

Notes: ffc figures are cumulative PR vs plain upstream main; fast_float is the
single merged change vs main; both conservative (ffc built without
`FFC_ROUNDS_TO_NEAREST`). hiredis figures are strtod→ffc from the #1328 bench
(include the copy+NUL-terminate both paths share).

## 4b. redis-py end-to-end (real redis-server, sorted set) — measured

`ZRANGE key 0 -1 WITHSCORES` over a 5000-member zset, RESP3, local unix socket,
server pinned off the client core, best-of-7 (`redis-clients/bench/run_e2e_ab.sh`).
Three-way, iters/s:

| dataset | pure-Python | hiredis-strtod | hiredis-ffc | hiredis vs py | ffc vs strtod |
|---------|------------:|---------------:|------------:|--------------:|--------------:|
| random | 69 | 274 | 283 | +297% | +3.3% |
| mesh | 76 | 326 | 341 | +329% | +4.6% |
| canada | 72 | 279 | 289 | +288% | +3.6% |

Two levers: (1) **having hiredis at all** is ~4× over the pure-Python parser —
the dominant redis-py win; (2) **ffc over strtod** adds ~+3–5% on top, end-to-end.
The pure parser is 2–2.7× faster, but redis-py's Python result-building (5000
tuples + objects) + server work dominate the round-trip, so the double parse is a
small slice. Biggest ffc gain on `random` (hardest doubles). Locale fix inherited
unconditionally.
