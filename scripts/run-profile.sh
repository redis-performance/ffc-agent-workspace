#!/usr/bin/env bash
set -euo pipefail

# Profile the same build flags/precision as run-bench.sh. Darwin uses Instruments;
# Linux keeps perf. PROFILE_DATA may name a prepared file; DATASET defaults canada.
WORKSPACE="$(cd "$(dirname "$0")/.." && pwd)"
COMPILER="${COMPILER:-}"
BUILD_DIR="${BUILD_DIR:-$WORKSPACE/simple_fastfloat_benchmark/build${COMPILER:+/$COMPILER}}"
PRECISION="${PRECISION:-double}"
case "$PRECISION" in double|float) ;; *) echo "PRECISION must be double or float" >&2; exit 2;; esac
CACHE="$BUILD_DIR/CMakeCache.txt"
[[ -f "$CACHE" ]] || { echo "Build benchmark first: $BUILD_DIR" >&2; exit 1; }
# The driver is compiled now; refuse to label a changed parser as an old build.
PROVENANCE="$BUILD_DIR/provenance.txt"
[[ -f "$PROVENANCE" ]] || { echo "Missing build provenance: $PROVENANCE" >&2; exit 1; }
FFC_HEAD="$(git -C "$WORKSPACE/ffc" rev-parse HEAD)"
FFC_DIFF="$(git -C "$WORKSPACE/ffc" diff HEAD | shasum -a 256 | cut -d' ' -f1)"
if [[ "$FFC_HEAD" != "$(sed -n 's/^# ffc: //p' "$PROVENANCE")" ||
      "$FFC_DIFF" != "$(sed -n 's/^# ffc-worktree-diff: //p' "$PROVENANCE")" ]]; then
  echo "ffc source differs from this build; restore its source or rebuild first." >&2
  exit 1
fi
DATA="${PROFILE_DATA:-$WORKSPACE/simple_fastfloat_benchmark/data/${DATASET:-canada}.txt}"
[[ -f "$DATA" ]] || { echo "Missing dataset: $DATA" >&2; exit 1; }
OUT_DIR="$WORKSPACE/experiments/${EXP:-EXP-000}/profile-results"
mkdir -p "$OUT_DIR"
STAMP="$(date +%Y%m%d-%H%M%S)-${RUN_LABEL:-profile}-$PRECISION-$$"
PREFIX="$OUT_DIR/$STAMP"
CXX="$(sed -n 's/^CMAKE_CXX_COMPILER:[^=]*=//p' "$CACHE")"
[[ -n "$CXX" ]] || { echo "Compiler missing from $CACHE" >&2; exit 1; }
read -r -a FLAGS <<< "$(sed -n 's/^CMAKE_CXX_FLAGS:STRING=//p' "$CACHE")"
DRIVER="$BUILD_DIR/benchmarks/ffc-profile-$PRECISION"
DEFINES=(-DPROFILE_DOUBLE)
[[ "$PRECISION" == float ]] && DEFINES=(-DPROFILE_FLOAT)
"$CXX" -O3 -g -std=c++17 "${FLAGS[@]}" "${DEFINES[@]}" -I"$WORKSPACE/ffc" \
  -c "$WORKSPACE/scripts/ffc_profile_driver.cpp" -o "$DRIVER.o"
"$CXX" -g "${FLAGS[@]}" "$DRIVER.o" -o "$DRIVER"
{
  cat "$BUILD_DIR/provenance.txt"
  echo "# profile-driver-sha256: $(shasum -a 256 "$DRIVER")"
  echo "# profile-source-sha256: $(shasum -a 256 "$WORKSPACE/scripts/ffc_profile_driver.cpp")"
  echo "# data-sha256: $(shasum -a 256 "$DATA")"
  echo "# precision: $PRECISION; duration: ${PROFILE_SECONDS:-5}s"
} > "$PREFIX-provenance.txt"
if [[ "$(uname -s)" == Darwin ]]; then
  dsymutil "$DRIVER"
  xcrun xctrace record --no-prompt --template "${PROFILE_TEMPLATE:-Time Profiler}" \
    --output "$PREFIX.trace" --time-limit 15s \
    --launch -- "$DRIVER" "$DATA" "${PROFILE_SECONDS:-5}" 2>&1 | tee "$PREFIX-record.txt"
  xcrun xctrace export --input "$PREFIX.trace" --toc --output "$PREFIX-toc.xml"
  xcrun xctrace export --input "$PREFIX.trace" \
    --xpath '/trace-toc/run[@number="1"]/data/table[@schema="time-profile"]' \
    --output "$PREFIX-samples.xml"
  python3 "$WORKSPACE/scripts/summarize-xctrace.py" "$PREFIX-samples.xml" "$PREFIX-toc.xml" | tee "$PREFIX-report.txt"
  echo "==> Saved Instruments trace: $PREFIX.trace"
else
  command -v perf >/dev/null || { echo "Install Linux perf" >&2; exit 1; }
  sudo perf stat -e instructions,cycles,branches,branch-misses,cache-references,cache-misses \
    -- "$DRIVER" "$DATA" "${PROFILE_SECONDS:-5}" 2>&1 | tee "$PREFIX-stat.txt"
  sudo perf record -g -F 999 -o "$PREFIX.data" -- "$DRIVER" "$DATA" "${PROFILE_SECONDS:-5}"
  sudo perf report --stdio -i "$PREFIX.data" --no-children > "$PREFIX-report.txt"
  head -60 "$PREFIX-report.txt"
fi
