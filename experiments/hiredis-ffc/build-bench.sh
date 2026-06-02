#!/usr/bin/env bash
set -euo pipefail
# Build the RESP3 reader benchmark against libhiredis.a compiled BOTH ways
# (strtod baseline vs ffc), into ./out/bench-strtod and ./out/bench-ffc.
HERE="$(cd "$(dirname "$0")" && pwd)"
HIREDIS="$HERE/../../hiredis"
mkdir -p "$HERE/out"

build() {  # $1 = tag, $2... = extra CFLAGS
  local tag="$1"; shift
  ( cd "$HIREDIS" && make clean >/dev/null 2>&1 && make -j"$(nproc)" CFLAGS="$*" >/dev/null 2>&1 )
  cc -O3 -std=c99 -I"$HIREDIS" "$HERE/bench.c" "$HIREDIS/libhiredis.a" -o "$HERE/out/bench-$tag"
  echo "built out/bench-$tag"
}

build strtod ""
build ffc "-DHIREDIS_FLOAT_FFC"
echo "done."
