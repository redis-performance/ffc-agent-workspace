#!/usr/bin/env bash
set -euo pipefail

WORKSPACE="$(cd "$(dirname "$0")/.." && pwd)"
BENCH="$WORKSPACE/simple_fastfloat_benchmark/build/benchmarks/benchmark"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
OUT_DIR="$WORKSPACE/experiments/profile-results"
PERF_DATA="$OUT_DIR/$TIMESTAMP-perf.data"

mkdir -p "$OUT_DIR"

if [[ ! -x "$BENCH" ]]; then
  echo "ERROR: benchmark binary not found. Run scripts/build-bench.sh first." >&2
  exit 1
fi

if ! command -v perf &>/dev/null; then
  echo "ERROR: perf not found. Install with: sudo apt install linux-tools-generic" >&2
  exit 1
fi

echo "==> Step 2a: perf stat (IPC, branch misses, cache misses)..."
sudo perf stat \
  -e instructions,cycles,branches,branch-misses,cache-references,cache-misses \
  -- "$BENCH" 2>&1 | tail -20

echo ""
echo "==> Step 2b: perf record (flame graph data)..."
sudo perf record -g -F 999 -o "$PERF_DATA" -- "$BENCH" > /dev/null 2>&1
echo "    Recorded to $PERF_DATA"

echo ""
echo "==> Step 2c: perf report — top symbols..."
sudo perf report --stdio -i "$PERF_DATA" --no-children 2>/dev/null \
  | grep -E "^\s+[0-9]+\.[0-9]+%|^#" \
  | head -40

echo ""
echo "==> Step 2d: ffc-only symbols..."
sudo perf report --stdio -i "$PERF_DATA" --no-children 2>/dev/null \
  | grep -E "ffc" \
  | head -20

echo ""
echo "==> Saved perf data to $PERF_DATA"
echo "    For interactive report: sudo perf report -i $PERF_DATA"
