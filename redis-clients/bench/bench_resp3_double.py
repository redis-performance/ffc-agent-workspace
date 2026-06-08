#!/usr/bin/env python3
"""Confirm the ffc RESP3-double speedup reaches the Python stack (hiredis-py /
redis-py).

This benchmarks the *exact* hot path redis-py uses for RESP3 `,`-type double
replies when the `hiredis` C extension is installed: `hiredis.Reader.gets()`.
The Reader runs hiredis' `read.c`, which (since redis/hiredis#1328) parses
doubles with ffc instead of strtod. Build hiredis-py two ways
(default = ffc, `-DHIREDIS_FLOAT_STRTOD` = old path) and compare — see run_ab.sh.

Output: best-of-N MB/s and millions-of-doubles/sec per dataset.
"""
import sys, time, random

N = int(sys.argv[1]) if len(sys.argv) > 1 else 300_000
TRIALS = int(sys.argv[2]) if len(sys.argv) > 2 else 9
random.seed(12345)


def datasets():
    # random [0,1] — full-precision mantissas
    rnd = [repr(random.random()) for _ in range(N)]
    # mesh-like — short floats (<8 chars), the tightest inner-loop case
    mesh = [f"{random.uniform(0, 1000):.2f}" for _ in range(N)]
    # canada-like — geo coordinates, varied precision
    canada = [f"{random.uniform(-141, -52):.{random.randint(4, 12)}f}" for _ in range(N)]
    return {"random": rnd, "mesh": mesh, "canada": canada}


def resp3_singles(vals):
    # one reply per double: ",<value>\r\n" (worst case — Python call overhead per
    # double dominates; realistic only for single-value replies like GEODIST)
    return b"".join(b"," + v.encode() + b"\r\n" for v in vals)


def resp3_array(vals):
    # one RESP3 array holding all the doubles: "*N\r\n,<v>\r\n..." — a single
    # gets() returns the whole list, amortizing per-reply Python overhead. This
    # is the double-heavy shape redis-py actually sees: TS.RANGE/TS.MRANGE,
    # FT.SEARCH ... WITHSCORES, ZRANGE ... WITHSCORES, vector-search distances.
    head = b"*%d\r\n" % len(vals)
    return head + b"".join(b"," + v.encode() + b"\r\n" for v in vals)


def which_parser_redis_py():
    try:
        from redis.utils import HIREDIS_AVAILABLE
        from redis._parsers import _HiredisParser, _RESP3Parser
        return ("_HiredisParser (ffc-backed C path)" if HIREDIS_AVAILABLE
                else "_RESP3Parser (pure Python) — hiredis NOT installed")
    except Exception as e:  # redis-py not installed in this env
        return f"redis-py not importable here ({e.__class__.__name__})"


def main():
    import hiredis
    print(f"# hiredis module: {hiredis.__file__}")
    print(f"# redis-py would use: {which_parser_redis_py()}")
    print(f"# N={N} doubles/dataset, best-of-{TRIALS}\n")
    data = datasets()

    def bench(buf, expect, array_mode):
        best = float("inf")
        for _ in range(TRIALS):
            r = hiredis.Reader()
            r.feed(buf)
            t0 = time.perf_counter()
            if array_mode:
                out = r.gets()           # one call returns the whole list
                cnt = len(out)
            else:
                cnt = 0
                while r.gets() is not False:
                    cnt += 1
            dt = time.perf_counter() - t0
            best = min(best, dt)
        assert cnt == expect, f"parsed {cnt} != {expect}"
        return len(buf) / best / 1e6, expect / best / 1e6

    for mode, fn, am in (("ARRAY reply (TS.MRANGE / WITHSCORES shape)", resp3_array, True),
                         ("per-double replies (GEODIST shape)", resp3_singles, False)):
        print(f"## {mode}")
        print(f"{'dataset':8} {'MB/s':>10} {'M doubles/s':>12}")
        print("-" * 34)
        for name, vals in data.items():
            mbps, mds = bench(fn(vals), len(vals), am)
            print(f"{name:8} {mbps:10.1f} {mds:12.2f}")
        print()


if __name__ == "__main__":
    main()
