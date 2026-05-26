#!/usr/bin/env bash
set -euo pipefail

WORKSPACE="$(cd "$(dirname "$0")/.." && pwd)"
BENCH="$WORKSPACE/simple_fastfloat_benchmark/build/benchmarks/benchmark"
DATA="$WORKSPACE/simple_fastfloat_benchmark/data"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
EXP="${EXP:-EXP-000}"
OUT_DIR="$WORKSPACE/experiments/$EXP/bench-results"

mkdir -p "$OUT_DIR"

if [[ ! -x "$BENCH" ]]; then
  echo "ERROR: benchmark binary not found. Run scripts/build-bench.sh first." >&2
  exit 1
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

OUTPUT_FILE="$OUT_DIR/$TIMESTAMP.txt"
{
  echo "# ffc-agent-workspace benchmark run — $TIMESTAMP"
  echo "# Host: $(uname -n)  CPU: $(grep 'model name' /proc/cpuinfo | head -1 | cut -d: -f2 | xargs)"
  echo ""
  run "random [0,1]"
  run "canada.txt" -f "$DATA/canada.txt"
  run "mesh.txt"   -f "$DATA/mesh.txt"
} | tee "$OUTPUT_FILE"

echo ""
echo "==> Saved to $OUTPUT_FILE"
