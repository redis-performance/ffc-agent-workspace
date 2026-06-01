#!/usr/bin/env bash
set -euo pipefail

# Correctness gate for fast_float experiments — the fast_float counterpart of
# ffc's `make test / supplemental_tests / exhaustive` flow. MUST pass before any
# fast_float change is benchmarked or committed.
#
# Tiers:
#   default      : FASTFLOAT_TEST=ON  -> core unit tests + fastfloat supplemental
#                  corpus (basictest, fast_int, string_test, fortran, p2497, ...).
#                  Compiles under fast_float's strict -Werror -Wall -Wextra
#                  -Weffc++ -Wconversion set, which is itself a gate.
#   EXHAUSTIVE=1 : additionally -DFASTFLOAT_EXHAUSTIVE=ON (exhaustive32, random64,
#                  ...). Run this when an edit touches the mantissa / digit loop.
#
# Compiler: COMPILER=gcc|clang to gate under the toolchain being raced.
# Network is required on first configure (doctest + supplemental_test_files
# are fetched via CMake FetchContent).

WORKSPACE="$(cd "$(dirname "$0")/.." && pwd)"
FF_DIR="$WORKSPACE/fast_float"

COMPILER="${COMPILER:-}"
# Under build/ so it matches fast_float's ignored `build/*` (keeps the fork clean).
BUILD_DIR="$FF_DIR/build/tests${COMPILER:+-$COMPILER}"

CC_ARGS=()
case "$COMPILER" in
  gcc)   CC_ARGS=(-DCMAKE_C_COMPILER=gcc   -DCMAKE_CXX_COMPILER=g++) ;;
  clang) CC_ARGS=(-DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++) ;;
  "")    : ;;
  *)     echo "ERROR: COMPILER must be gcc|clang (got '$COMPILER')" >&2; exit 1 ;;
esac

# Always set FASTFLOAT_EXHAUSTIVE explicitly so a reused build dir can't keep a
# stale =ON in its cache (that silently turns the fast gate into a ~50-min sweep).
EXH_ARGS=(-DFASTFLOAT_EXHAUSTIVE=OFF)
TIER="core + supplemental"
if [[ "${EXHAUSTIVE:-0}" == "1" ]]; then
  EXH_ARGS=(-DFASTFLOAT_EXHAUSTIVE=ON)
  TIER="core + supplemental + EXHAUSTIVE"
fi

echo "==> fast_float correctness gate (COMPILER=${COMPILER:-default}, tier: $TIER)"
cmake -B "$BUILD_DIR" -S "$FF_DIR" \
  -DCMAKE_BUILD_TYPE=Release \
  -DFASTFLOAT_TEST=ON \
  "${EXH_ARGS[@]}" \
  "${CC_ARGS[@]}" \
  -Wno-dev \
  2>&1 | tail -4

echo "==> Building tests..."
cmake --build "$BUILD_DIR" -j"$(nproc)" 2>&1 | tail -4

echo "==> Running ctest..."
ctest --test-dir "$BUILD_DIR" --output-on-failure -j"$(nproc)"
echo "==> fast_float gate PASSED ($TIER)"
