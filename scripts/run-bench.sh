#!/usr/bin/env bash
set -euo pipefail

# PRECISION=double|float|both, BUILD_DIR, EXP, RUN_LABEL, RANDOM_VOLUME,
# DATASET=all|random|canada|mesh. The upstream harness remains unchanged.
# Score only the FIRST fastfloat row (ASCII), paired with ffc, per dataset.
WORKSPACE="$(cd "$(dirname "$0")/.." && pwd)"
COMPILER="${COMPILER:-}"
BUILD_DIR="${BUILD_DIR:-$WORKSPACE/simple_fastfloat_benchmark/build${COMPILER:+/$COMPILER}}"
DATA="$WORKSPACE/simple_fastfloat_benchmark/data"
PRECISION="${PRECISION:-double}"
DATASET="${DATASET:-all}"
case "$PRECISION" in double|float|both) ;; *) echo "Invalid PRECISION" >&2; exit 2;; esac
case "$DATASET" in all|random|canada|mesh) ;; *) echo "Invalid DATASET" >&2; exit 2;; esac
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
OUT_DIR="$WORKSPACE/experiments/${EXP:-EXP-000}/bench-results"
mkdir -p "$OUT_DIR"
OUTPUT_FILE="$OUT_DIR/$TIMESTAMP-${RUN_LABEL:-run}-$PRECISION-$$.txt"

RUN_CMD=(env)
if [[ "$(uname -s)" == Linux ]]; then
  CPU="$(awk -F: '/model name|CPU part/ {gsub(/^ +/, "", $2); print $2; exit}' /proc/cpuinfo)"
  # Empty PIN_CPU disables pinning; root is opt-in, never required for timing.
  if [[ -n "${PIN_CPU-3}" ]] && command -v taskset >/dev/null; then
    RUN_CMD=(taskset -c "${PIN_CPU-3}")
  fi
else
  CPU="$(sysctl -n machdep.cpu.brand_string)"
fi
if [[ "${BENCH_SUDO:-0}" == 1 ]]; then RUN_CMD=(sudo "${RUN_CMD[@]}"); fi

run() {
  local label="$1"; shift
  echo "===== $precision / $label ====="
  "${RUN_CMD[@]}" "$bench" "$@"
}

{
  echo "# RACE benchmark $TIMESTAMP; host: $(uname -n); arch: $(uname -m); cpu: $CPU"
  echo "# build-dir: $BUILD_DIR"
  echo "# pin-cpu: ${PIN_CPU-3} (Linux taskset; empty disables pinning)"
  echo "# runtime compiler (build provenance below): $(${COMPILER:-cc} --version | head -1)"
  echo "# canonical row: first fastfloat per dataset (ASCII), paired with ffc"
  echo "# units: harness MB/s uses MiB (bytes / 1024^2); preserve its labels"
  if [[ -f "$BUILD_DIR/provenance.txt" ]]; then cat "$BUILD_DIR/provenance.txt"; fi
  for precision in double float; do
    [[ "$PRECISION" == both || "$PRECISION" == "$precision" ]] || continue
    bench="$BUILD_DIR/benchmarks/benchmark"
    [[ "$precision" == float ]] && bench="${bench}32"
    if [[ ! -x "$bench" ]]; then echo "Missing benchmark: $bench" >&2; exit 1; fi
    echo "# binary-sha256: $(shasum -a 256 "$bench")"
    if [[ "$DATASET" == all || "$DATASET" == random ]]; then
      run "random [0,1]" -v "${RANDOM_VOLUME:-100000}"
    fi
    for dataset in canada mesh; do
      [[ "$DATASET" == all || "$DATASET" == "$dataset" ]] || continue
      echo "# dataset-sha256: $(shasum -a 256 "$DATA/$dataset.txt")"
      run "$dataset.txt" -f "$DATA/$dataset.txt"
    done
  done
} 2>&1 | tee "$OUTPUT_FILE"
echo "==> Saved to $OUTPUT_FILE"
