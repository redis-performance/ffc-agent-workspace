#!/usr/bin/env bash
# Profile the ffc-only microbench (ffc_tma) on this Intel node: TopdownL1 + hot
# instructions of the inlined parse loop (main). Usage: ffc_prof.sh <sudo-pw> [cc]
set -u
PW="$1"; CC="${2:-cc}"; PIN="${PIN:-3}"
cd "$HOME/ffc-tma"
SU(){ printf '%s' "$PW" | sudo -S -p '' "$@"; }
$CC -O3 -march=native -std=c99 -DFFC_IMPL ffc_tma.cpp -o /tmp/ffc_tma -lm 2>/tmp/b.log \
  || { echo "BUILD_FAIL($CC)"; tail -5 /tmp/b.log; exit 1; }
echo "==== node=$(uname -n) cc=$CC $($CC --version|head -1) ===="
for ds in mesh canada; do
  F="$HOME/ffc-tma/data/$ds.txt"
  echo "---- $ds TopdownL1 ----"
  SU perf stat -M TopdownL1 -- taskset -c "$PIN" /tmp/ffc_tma "$F" 2500 2>&1 | grep -E '%|insn per|seconds time'
  echo "---- $ds top hot instrs (main) ----"
  SU perf record -g -F 2999 -o /tmp/ffcp.data -- taskset -c "$PIN" /tmp/ffc_tma "$F" 2500 >/dev/null 2>&1
  SU perf annotate --stdio -i /tmp/ffcp.data main 2>/dev/null | grep -E '^\s+[0-9]+\.[0-9]+ :' | sort -rn -k1 | head -10
done
