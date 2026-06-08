#!/usr/bin/env bash
# A/B the RESP3-double parse path through the Python stack: build hiredis-py's C
# extension from the vendored submodule two ways and run the same microbench on
# each.
#   default build           -> ffc   (redis/hiredis#1328)
#   -DHIREDIS_FLOAT_STRTOD  -> the old strtod path
# Proves what redis-py inherits, since redis-py uses hiredis.Reader when present.
#
# No venv/pip required — builds the extension in place with setup.py build_ext
# (needs only setuptools + a C compiler + python3 dev headers).
#
# Usage: redis-clients/bench/run_ab.sh [N] [TRIALS]
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
WS="$(cd "$HERE/../.." && pwd)"
HPY="$WS/redis-clients/hiredis-py"
RPY="$WS/redis-clients/redis-py"
N="${1:-300000}"; TRIALS="${2:-9}"; PIN="${PIN:-3}"

[ -f "$HPY/vendor/hiredis/ffc.h" ] || { echo "ERR: vendored hiredis (with ffc) not initialized: git submodule update --init --recursive redis-clients/hiredis-py" >&2; exit 2; }
command -v taskset >/dev/null && TS="taskset -c $PIN" || TS=""

cd "$HPY"
build() { # $1 label, $2 extra CFLAGS
  rm -rf build hiredis/*.so
  CFLAGS="${2:-}" python3 setup.py build_ext --inplace --force >"/tmp/hpy_build_$1.log" 2>&1 \
    || { echo "BUILD FAIL ($1):"; tail -15 "/tmp/hpy_build_$1.log"; exit 1; }
}
run() { PYTHONPATH="$HPY:$RPY" $TS python3 "$HERE/bench_resp3_double.py" "$N" "$TRIALS"; }

echo "############ A: ffc build (default, redis/hiredis#1328) ############"
build ffc ""
run
echo
echo "############ B: strtod build (-DHIREDIS_FLOAT_STRTOD, the old path) ############"
build strtod "-DHIREDIS_FLOAT_STRTOD"
run
echo
echo "Compare A (ffc) vs B (strtod): the MB/s delta is what redis-py inherits."
# leave the tree clean
rm -rf build hiredis/*.so
