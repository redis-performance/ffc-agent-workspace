#!/usr/bin/env bash
set -euo pipefail

# Drives one full race iteration on the ARM metal box (Graviton4, 3.92.205.222)
# from the local workspace:
#   sync source -> build gcc+clang -> correctness gate for TARGET -> bench both
#   -> pull results back into experiments/$EXP/bench-results/
#
# Usage: scripts/metal-cycle.sh EXP-NNN [ffc|fast_float|none] [EXH]
#   TARGET selects the correctness gate (none = baseline, skip gate).
#   3rd arg "EXH" runs the exhaustive correctness tier (mantissa-loop changes).
#
# The metal box is the official ARM scoreboard surface; numbers are stable to
# ~±1%, unlike the local laptop.

EXP="${1:?usage: metal-cycle.sh EXP-NNN [ffc|fast_float|none] [EXH]}"
TARGET="${2:-none}"
EXH="${3:-}"

WS="$(cd "$(dirname "$0")/.." && pwd)"
KEY="$HOME/.ssh/benchmarksredislabsus-east-1.pem"
HOST="ubuntu@3.92.205.222"
REMOTE="ffc-race"
SSH="ssh -o BatchMode=yes -o ConnectTimeout=15 -i $KEY $HOST"
RSH="ssh -o BatchMode=yes -o ConnectTimeout=15 -i $KEY"

say() { printf '\n\033[1m==> %s\033[0m\n' "$*"; }

say "[$EXP] sync source -> metal (target=$TARGET)"
rsync -az --exclude '/build' --exclude 'build/' --exclude '_deps' --exclude '/out' \
  -e "$RSH" "$WS/ffc/" "$HOST:$REMOTE/ffc/"
rsync -az --exclude '/build' --exclude 'build/' --exclude '_deps' \
  -e "$RSH" "$WS/fast_float/" "$HOST:$REMOTE/fast_float/"
rsync -az -e "$RSH" "$WS/scripts/" "$HOST:$REMOTE/scripts/"

say "[$EXP] build gcc + clang"
$SSH "cd $REMOTE && COMPILER=gcc   bash scripts/build-bench.sh >/tmp/b-gcc.log 2>&1   && echo 'gcc build OK'   || { tail -20 /tmp/b-gcc.log; exit 1; }"
$SSH "cd $REMOTE && COMPILER=clang bash scripts/build-bench.sh >/tmp/b-clang.log 2>&1 && echo 'clang build OK' || { tail -20 /tmp/b-clang.log; exit 1; }"

case "$TARGET" in
  ffc)
    say "[$EXP] ffc correctness gate"
    $SSH "cd $REMOTE && make -C ffc ffc.h >/dev/null && make -C ffc test && make -C ffc supplemental_tests" \
      || { echo 'FFC CORRECTNESS FAILED'; exit 2; }
    [[ "$EXH" == "EXH" ]] && $SSH "cd $REMOTE && make -C ffc exhaustive" || true
    ;;
  fast_float)
    say "[$EXP] fast_float correctness gate"
    $SSH "cd $REMOTE && ${EXH:+EXHAUSTIVE=1 }bash scripts/test-fast_float.sh" \
      || { echo 'FAST_FLOAT CORRECTNESS FAILED'; exit 2; }
    ;;
  none) say "[$EXP] baseline — skipping correctness gate" ;;
  *) echo "unknown TARGET '$TARGET'"; exit 1 ;;
esac

say "[$EXP] benchmark gcc + clang"
$SSH "cd $REMOTE && COMPILER=gcc   EXP=$EXP bash scripts/run-bench.sh >/dev/null 2>&1"
$SSH "cd $REMOTE && COMPILER=clang EXP=$EXP bash scripts/run-bench.sh >/dev/null 2>&1"

say "[$EXP] pull results"
mkdir -p "$WS/experiments/$EXP/bench-results"
rsync -az -e "$RSH" "$HOST:$REMOTE/experiments/$EXP/bench-results/" "$WS/experiments/$EXP/bench-results/"

say "[$EXP] canonical rows (gcc then clang)"
for f in $(ls -t "$WS/experiments/$EXP/bench-results/"*aarch64.txt | head -2); do
  echo "--- $(basename "$f") ---"
  grep -E '^(=====|fastfloat|ffc)' "$f" | awk '/=====/{sec=$0} /fastfloat|ffc/{print sec"  "$0; sec=""}' | head -12
done
