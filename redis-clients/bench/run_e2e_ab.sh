#!/usr/bin/env bash
# End-to-end A/B: redis-py <-> real redis-server on a sorted set, ffc vs strtod.
# Starts a local redis-server on a unix socket, builds hiredis-py's extension two
# ways from the vendored source, runs bench_redis_py_e2e.py against each.
#
# Usage: redis-clients/bench/run_e2e_ab.sh [M members] [K iters]
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
WS="$(cd "$HERE/../.." && pwd)"
HPY="$WS/redis-clients/hiredis-py"
RPY="$WS/redis-clients/redis-py"
M="${1:-5000}"; K="${2:-3000}"; PIN="${PIN:-3}"
SOCK="/tmp/rc-e2e-redis.sock"

[ -f "$HPY/vendor/hiredis/ffc.h" ] || { echo "ERR: vendored hiredis not initialized" >&2; exit 2; }
command -v redis-server >/dev/null || { echo "ERR: redis-server not found" >&2; exit 2; }
command -v taskset >/dev/null && TS="taskset -c $PIN" || TS=""

# start a throwaway server (unix socket, no persistence) pinned off the bench core
rm -f "$SOCK"
taskset -c 5 redis-server --port 0 --unixsocket "$SOCK" --save '' --appendonly no \
  --daemonize no --loglevel warning &
SRV=$!
trap 'kill $SRV 2>/dev/null || true; rm -f "$SOCK"' EXIT
for _ in $(seq 1 50); do [ -S "$SOCK" ] && break; sleep 0.1; done
redis-cli -s "$SOCK" ping >/dev/null

cd "$HPY"
build() { rm -rf build hiredis/*.so; CFLAGS="${2:-}" python3 setup.py build_ext --inplace --force >"/tmp/hpy_e2e_$1.log" 2>&1 || { echo "BUILD FAIL ($1)"; tail -15 "/tmp/hpy_e2e_$1.log"; exit 1; }; }
run() { REDIS_UNIX="$SOCK" PYTHONPATH="$HPY:$RPY" $TS python3 "$HERE/bench_redis_py_e2e.py" "$M" "$K"; }

echo "############ A: ffc build (default, redis/hiredis#1328) ############"
build ffc ""
FORCE_PARSER=hiredis run
echo
echo "############ B: strtod build (-DHIREDIS_FLOAT_STRTOD) ############"
build strtod "-DHIREDIS_FLOAT_STRTOD"
FORCE_PARSER=hiredis run
echo
echo "############ C: pure-Python parser (_RESP3Parser, no hiredis) ############"
FORCE_PARSER=python run   # build-independent — context for how much the C parser matters at all
echo
echo "Three-way: pure-Python (C) vs hiredis-strtod (B) vs hiredis-ffc (A) on ZRANGE WITHSCORES."
rm -rf build hiredis/*.so
