#!/usr/bin/env bash
# Build ff_tma against the currently-synced fast_float headers and capture Intel
# TMA (top-down) for base vs patch.  Usage: tma.sh <sudo-pw> <tag base|patch>
set -u
PW="$1"; TAG="${2:-x}"
cd "$HOME/ffc-race"
SU(){ printf '%s' "$PW" | sudo -S -p '' "$@"; }
c++ -O3 -march=native -std=c++17 -Ifast_float/include \
    "$HOME/ffc-race/ff_tma.cpp" -o /tmp/ff_tma 2>/tmp/ffbuild.log \
    || { echo "BUILD_FAIL($TAG):"; tail -5 /tmp/ffbuild.log; exit 1; }
PIN="${PIN:-3}"
for ds in mesh canada; do
  F="simple_fastfloat_benchmark/data/$ds.txt"
  echo "===== $TAG $ds — TopdownL1 ====="
  SU perf stat -M TopdownL1 -- taskset -c "$PIN" /tmp/ff_tma "$F" 3000 2>&1 \
     | grep -iE "tma_|% +(retir|front|bad|back)|insn per|seconds time"
  echo "===== $TAG $ds — TopdownL2 ====="
  SU perf stat -M TopdownL2 -- taskset -c "$PIN" /tmp/ff_tma "$F" 3000 2>&1 \
     | grep -iE "tma_|%|insn per" | grep -ivE "parsed|sink"
done
