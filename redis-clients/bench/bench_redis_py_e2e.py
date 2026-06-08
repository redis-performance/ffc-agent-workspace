#!/usr/bin/env python3
"""End-to-end: redis-py <-> real redis-server, RESP3, on a core data structure
(sorted set). Measures `ZRANGE key 0 -1 WITHSCORES` — a double-heavy array read,
where the server formats M doubles and redis-py parses them back (via
hiredis.Reader, i.e. ffc since redis/hiredis#1328).

This is the realistic number: it includes actual server work + transport, so the
ffc parse win is diluted to whatever fraction of the round-trip parsing is. Run
the ffc build and the strtod build (see run_e2e_ab.sh) and compare.

Env: REDIS_UNIX (socket path) or REDIS_PORT. Args: [M members] [K iters].
"""
import os, sys, time, random, statistics

M = int(sys.argv[1]) if len(sys.argv) > 1 else 5000
K = int(sys.argv[2]) if len(sys.argv) > 2 else 3000
random.seed(12345)

import redis
from redis.utils import HIREDIS_AVAILABLE
from redis._parsers import _RESP3Parser, _HiredisParser

# FORCE_PARSER=hiredis -> ffc/strtod C parser; =python -> pure-Python _RESP3Parser.
FORCE = os.environ.get("FORCE_PARSER", "hiredis")


def connect():
    sock = os.environ.get("REDIS_UNIX")
    kw = dict(protocol=3, decode_responses=False)
    if sock:
        r = redis.Redis(unix_socket_path=sock, **kw)
    else:
        r = redis.Redis(host="127.0.0.1", port=int(os.environ.get("REDIS_PORT", 6379)), **kw)
    # force the parser explicitly so the three-way comparison is unambiguous
    pc = _HiredisParser if FORCE == "hiredis" else _RESP3Parser
    r.connection_pool.connection_kwargs["parser_class"] = pc
    r.ping()
    return r


def parser_in_use(r):
    try:
        conn = r.connection_pool.get_connection("_")
        name = type(conn._parser).__name__
        r.connection_pool.release(conn)
        return name
    except Exception as e:
        return f"?({e.__class__.__name__})"


def main():
    import hiredis
    r = connect()
    print(f"# hiredis: {hiredis.__file__}  (__version__={getattr(hiredis,'__version__','?')})")
    print(f"# HIREDIS_AVAILABLE={HIREDIS_AVAILABLE}  parser={parser_in_use(r)}")
    print(f"# M={M} members/zset, K={K} iters, RESP3\n")
    print(f"{'dataset':8} {'iters/s':>9} {'M doubles/s':>12} {'us/call':>9}")
    print("-" * 50)

    flavors = {
        "random": lambda: random.random(),
        "mesh":   lambda: round(random.uniform(0, 1000), 2),
        "canada": lambda: round(random.uniform(-141, -52), random.randint(4, 12)),
    }
    for name, gen in flavors.items():
        key = f"z:{name}"
        r.delete(key)
        # populate the sorted set with M float-scored members
        mapping = {f"m{i}".encode(): gen() for i in range(M)}
        r.zadd(key, mapping)
        # sanity: confirm scores come back as python floats (RESP3 double path)
        sample = r.zrange(key, 0, 1, withscores=True)
        assert sample and isinstance(sample[0][1], float), f"{name}: scores not float: {sample[:1]}"
        # warm up
        for _ in range(100):
            r.zrange(key, 0, -1, withscores=True)
        # best-of-R timing loops to denoise
        R = int(os.environ.get("BENCH_REPEAT", "7"))
        best_dt = float("inf")
        for _ in range(R):
            t0 = time.perf_counter()
            for _ in range(K):
                out = r.zrange(key, 0, -1, withscores=True)
            dt = time.perf_counter() - t0
            best_dt = min(best_dt, dt)
        assert len(out) == M
        p50_us = best_dt / K * 1e6
        print(f"{name:8} {K/best_dt:9.0f} {M*K/best_dt/1e6:12.2f} {p50_us:8.1f}")
    r.delete(*[f"z:{n}" for n in flavors])


if __name__ == "__main__":
    main()
