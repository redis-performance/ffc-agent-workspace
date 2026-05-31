#!/usr/bin/env bash
set -euo pipefail

# Builds the simple_fastfloat benchmark with BOTH competitors mutable:
#   - ffc      : amalgam regenerated from ffc/src/*.h, included via FFC_DIR
#   - fastfloat: redirected to our mutable submodule (fast_float/) via
#                FETCHCONTENT_SOURCE_DIR_FAST_FLOAT, instead of CMake cloning
#                fastfloat/fast_float@origin/main. The benchmark harness
#                (benchmark.cpp / its CMakeLists) is NOT modified.
#
# Compiler matrix: set COMPILER=gcc|clang to build a per-compiler tree
# (build-gcc / build-clang). Unset => default toolchain in ./build.

WORKSPACE="$(cd "$(dirname "$0")/.." && pwd)"
FFC_DIR="$WORKSPACE/ffc"
FF_DIR="$WORKSPACE/fast_float"
BENCH_DIR="$WORKSPACE/simple_fastfloat_benchmark"

COMPILER="${COMPILER:-}"
# Nest per-compiler trees under build/ so they fall under the benchmark
# submodule's ignored `build` path (keeps the submodule working tree clean).
BUILD_DIR="$BENCH_DIR/build${COMPILER:+/$COMPILER}"

CC_ARGS=()
case "$COMPILER" in
  gcc)   CC_ARGS=(-DCMAKE_C_COMPILER=gcc   -DCMAKE_CXX_COMPILER=g++) ;;
  clang) CC_ARGS=(-DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++) ;;
  "")    : ;;  # default toolchain
  *)     echo "ERROR: COMPILER must be gcc|clang (got '$COMPILER')" >&2; exit 1 ;;
esac

if [[ ! -e "$FF_DIR/include/fast_float/fast_float.h" ]]; then
  echo "ERROR: fast_float submodule missing at $FF_DIR." >&2
  echo "       Run: git submodule update --init fast_float" >&2
  exit 1
fi

echo "==> Regenerating ffc.h amalgam..."
make -C "$FFC_DIR" ffc.h

echo "==> Configuring benchmark (COMPILER=${COMPILER:-default})"
echo "    FFC_DIR=$FFC_DIR"
echo "    fast_float (mutable) <- $FF_DIR"
cmake -B "$BUILD_DIR" -S "$BENCH_DIR" \
  -DCMAKE_BUILD_TYPE=Release \
  -DFFC_DIR="$FFC_DIR" \
  -DFETCHCONTENT_SOURCE_DIR_FAST_FLOAT="$FF_DIR" \
  "${CC_ARGS[@]}" \
  -DCMAKE_C_FLAGS="-march=native -DFFC_ROUNDS_TO_NEAREST" \
  -DCMAKE_CXX_FLAGS="-march=native -DFFC_ROUNDS_TO_NEAREST" \
  --no-warn-unused-cli \
  -Wno-dev \
  2>&1 | grep -iE 'fast_float|ffc|source dir|Build files' | tail -8 || true

echo "==> Building..."
cmake --build "$BUILD_DIR" --target benchmark benchmark32 -j"$(nproc)"

echo "==> Done. Binaries:"
echo "    $BUILD_DIR/benchmarks/benchmark"
echo "    $BUILD_DIR/benchmarks/benchmark32"
