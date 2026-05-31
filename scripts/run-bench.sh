#!/usr/bin/env bash
set -euo pipefail

# Runs the head-to-head race benchmark (ffc vs fast_float) on the three datasets
# and writes a provenance-stamped result file under experiments/$EXP/bench-results/.
#
# Because fast_float live-tracks upstream main, every result records the exact
# fast_float base + our patch commit, the ffc commit, the compiler, and the arch,
# so a number is only ever compared against same-provenance runs.
#
# Env:
#   EXP=EXP-NNN      destination experiment folder (default EXP-000)
#   COMPILER=gcc|clang   pick the matching build tree (build-gcc / build-clang)
#
# Scoreboard note: each dataset prints TWO `fastfloat` rows. The CANONICAL one
# (apples-to-apples vs ffc) is the FIRST — findmax_fastfloat<char>, from_chars
# into double, printed immediately above the `ffc` row. The second `fastfloat`
# row sits under "UTF-16 volume" (2x volume => ~2x MB/s) and is NOT scored.

WORKSPACE="$(cd "$(dirname "$0")/.." && pwd)"
COMPILER="${COMPILER:-}"
BENCH="$WORKSPACE/simple_fastfloat_benchmark/build${COMPILER:+/$COMPILER}/benchmarks/benchmark"
DATA="$WORKSPACE/simple_fastfloat_benchmark/data"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
EXP="${EXP:-EXP-000}"
OUT_DIR="$WORKSPACE/experiments/$EXP/bench-results"

mkdir -p "$OUT_DIR"

if [[ ! -x "$BENCH" ]]; then
  echo "ERROR: benchmark binary not found ($BENCH)." >&2
  echo "       Run: COMPILER=${COMPILER:-} scripts/build-bench.sh first." >&2
  exit 1
fi

# --- provenance ---
ARCH="$(uname -m)"
HOSTN="$(uname -n)"
CPU="$(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2 | xargs || true)"
[[ -z "$CPU" ]] && CPU="$(grep -m1 -iE 'cpu( part|model)' /proc/cpuinfo | cut -d: -f2 | xargs || echo unknown)"
FFC_SHA="$(git -C "$WORKSPACE/ffc" rev-parse --short HEAD 2>/dev/null || echo '?')"
FF_SHA="$(git -C "$WORKSPACE/fast_float" rev-parse --short HEAD 2>/dev/null || echo '?')"
FF_BASE="$(git -C "$WORKSPACE/fast_float" rev-parse --short upstream/main 2>/dev/null \
           || git -C "$WORKSPACE/fast_float" merge-base HEAD upstream/main 2>/dev/null \
           | cut -c1-7 || echo '?')"
if command -v "${COMPILER:-cc}" &>/dev/null; then
  CC_VER="$(${COMPILER:-cc} --version 2>/dev/null | head -1)"
else
  CC_VER="default"
fi

RUN_CMD=""
if command -v sudo &>/dev/null && sudo -n true 2>/dev/null; then
  RUN_CMD="sudo"
fi

run() {
  local label="$1"; shift
  echo ""
  echo "===== $label ====="
  $RUN_CMD "$BENCH" "$@" | grep -E "^(#|model:|volume|ASCII|ffc|fastfloat|strtod|abseil)" || true
}

OUTPUT_FILE="$OUT_DIR/$TIMESTAMP${COMPILER:+-$COMPILER}-$ARCH.txt"
{
  echo "# ffc-agent-workspace RACE benchmark — $TIMESTAMP"
  echo "# host: $HOSTN  arch: $ARCH  cpu: $CPU"
  echo "# compiler: ${COMPILER:-default} ($CC_VER)"
  echo "# ffc-commit: $FFC_SHA"
  echo "# fast_float-commit: $FF_SHA   fast_float-base(upstream/main): $FF_BASE"
  echo "# canonical row = FIRST 'fastfloat' per section (char from_chars->double), paired with 'ffc'"
  echo ""
  run "random [0,1]"
  run "canada.txt" -f "$DATA/canada.txt"
  run "mesh.txt"   -f "$DATA/mesh.txt"
} | tee "$OUTPUT_FILE"

echo ""
echo "==> Saved to $OUTPUT_FILE"
