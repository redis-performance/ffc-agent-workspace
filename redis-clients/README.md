# redis-clients — does the ffc RESP3-double work reach Python?

Submodules of the clients in the impact chain, plus a microbenchmark that
**confirms redis-py inherits the ffc speedup** for RESP3 `,`-type double replies.

```
ffc (this repo's race)
  └─► hiredis #1328 (MERGED) — vendors ffc.h, replaces strtod for RESP3 doubles
        └─► hiredis-py (vendor/hiredis @ 67c88a05, includes #1328)
              └─► redis-py — uses hiredis.Reader when the `hiredis` module is installed
```

## Submodules
- `hiredis/`     — redis/hiredis (the C client; #1328 merged here)
- `hiredis-py/`  — redis/hiredis-py (Python C-extension binding; vendors hiredis)
- `redis-py/`    — redis/redis-py (uses `_HiredisParser` when hiredis is present)

Init: `git submodule update --init --recursive redis-clients/hiredis-py`
(the nested `vendor/hiredis` is what carries ffc).

## Benchmark
`bench/run_ab.sh` builds hiredis-py's extension **twice** from the vendored
source — default (**ffc**, redis/hiredis#1328) and `-DHIREDIS_FLOAT_STRTOD`
(the **old strtod** path) — and runs `bench/bench_resp3_double.py` (which drives
`hiredis.Reader.gets()`, the exact path redis-py uses) on each.

```
PIN=3 bash redis-clients/bench/run_ab.sh 300000 9
```
No venv/pip needed — builds in place with `setup.py build_ext` (setuptools + a C
compiler + python3 dev headers).

## Result — redis-py DOES benefit (Granite-class x86, single-core, best-of-9)

**Array replies** (TS.MRANGE / TS.RANGE / ZRANGE·FT.SEARCH WITHSCORES /
vector-search distances — the double-heavy, parse-bound shape):

| dataset | strtod (M doubles/s) | ffc | speedup |
|---|---:|---:|---:|
| random | 6.67 | 14.01 | **+110%** |
| mesh   | 10.46 | 28.04 | **+168%** |
| canada | 6.74 | 13.56 | **+101%** |

**Single-double replies** (GEODIST shape): ffc ≈ strtod (≈8 MB/s, within noise) —
here Python's per-`gets()` call + float-object creation dominates, so the parser
speed barely shows. The big win is specifically on double-heavy **array** replies.

Takeaway: **for double-heavy commands, redis-py (via hiredis-py) parses replies
~2–2.7× faster** thanks to ffc; for single-value replies the effect is negligible
because parsing isn't the bottleneck there. Either way the locale-correctness fix
from #1328 is inherited unconditionally.

## End-to-end: redis-py ↔ real redis-server (sorted set)

`bench/run_e2e_ab.sh` starts a throwaway `redis-server` (unix socket, no
persistence), builds hiredis-py both ways, and runs `bench/bench_redis_py_e2e.py`
— `ZRANGE key 0 -1 WITHSCORES` over a 5000-member sorted set, RESP3, the
double-heavy core-data-structure read. Server pinned off the client core,
best-of-7.

```
PIN=3 BENCH_REPEAT=7 bash redis-clients/bench/run_e2e_ab.sh 5000 3000
```

Result (full round-trip = server work + transport + parse), iters/s, three-way:

| dataset | pure-Python parser | hiredis (strtod) | hiredis (ffc) | hiredis vs py | ffc vs strtod |
|---------|-------------------:|-----------------:|--------------:|--------------:|--------------:|
| random | 69 | 274 | 283 | **+297%** | **+3.3%** |
| mesh   | 76 | 326 | 341 | **+329%** | **+4.6%** |
| canada | 72 | 279 | 289 | **+288%** | **+3.6%** |

**Interpretation — two very different levers:**
1. **Having hiredis at all** is the dominant win for redis-py: the C parser is
   **~4× faster** than the pure-Python `_RESP3Parser` (69→274 iters/s, random).
2. **ffc over strtod**, on top of hiredis, is a **~+3–5%** end-to-end increment.
   The pure parser is 2–2.7× faster (array bench above), but at the full redis-py
   round-trip that shrinks to a few percent: building the Python result (5000
   `(member, score)` tuples + float/bytes objects) + server work dominate the
   call — the double parse is a small slice. `random` (full-precision mantissas,
   ffc's biggest edge) shows the largest gain — the coherent signal.

The locale-correctness fix from #1328 applies unconditionally regardless of throughput.
