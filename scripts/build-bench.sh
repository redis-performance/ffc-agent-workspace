#!/usr/bin/env bash
set -euo pipefail

# Builds the simple_fastfloat benchmark with BOTH competitors mutable:
#   - ffc      : amalgam regenerated from ffc/src/*.h; FetchContent redirected
#   - fastfloat: redirected to our mutable submodule (fast_float/) via
#                FETCHCONTENT_SOURCE_DIR_FAST_FLOAT, instead of CMake cloning
#                fastfloat/fast_float@origin/main. The benchmark harness
#                (benchmark.cpp / its CMakeLists) is NOT modified.
#
# Compiler matrix: set COMPILER=gcc|clang to build a per-compiler tree
# (build/gcc or build/clang). BUILD_DIR overrides; ARCH_FLAGS controls CPU tuning.

WORKSPACE="$(cd "$(dirname "$0")/.." && pwd)"
FFC_DIR="$WORKSPACE/ffc"
FF_DIR="$WORKSPACE/fast_float"
BENCH_DIR="$WORKSPACE/simple_fastfloat_benchmark"

COMPILER="${COMPILER:-}"
# Nest per-compiler trees under build/ so they fall under the benchmark
# submodule's ignored `build` path (keeps the submodule working tree clean).
BUILD_DIR="${BUILD_DIR:-$BENCH_DIR/build${COMPILER:+/$COMPILER}}"
ARCH_FLAGS="${ARCH_FLAGS:--march=native}"
JOBS="${JOBS:-2}"

CC_ARGS=(-DCMAKE_EXPORT_COMPILE_COMMANDS=ON)
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
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_C_FLAGS_RELWITHDEBINFO="-O3 -g -DNDEBUG" \
  -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-O3 -g -DNDEBUG" \
  -DFFC_DIR="$FFC_DIR" \
  -DFETCHCONTENT_SOURCE_DIR_FFC="$FFC_DIR" \
  -DFETCHCONTENT_SOURCE_DIR_FAST_FLOAT="$FF_DIR" \
  "${CC_ARGS[@]}" \
  -DCMAKE_C_FLAGS="$ARCH_FLAGS -DFFC_ROUNDS_TO_NEAREST" \
  -DCMAKE_CXX_FLAGS="$ARCH_FLAGS -DFFC_ROUNDS_TO_NEAREST" \
  --no-warn-unused-cli \
  -Wno-dev

echo "==> Building..."
cmake --build "$BUILD_DIR" --target benchmark benchmark32 -j"$JOBS"

if [[ "$(uname -s)" == Darwin ]]; then
  dsymutil "$BUILD_DIR/benchmarks/benchmark"
  dsymutil "$BUILD_DIR/benchmarks/benchmark32"
fi

{
  echo "# compiler: ${COMPILER:-default}"
  echo "# arch-flags: $ARCH_FLAGS"
  echo "# rounding: FFC_ROUNDS_TO_NEAREST"
  for repo in ffc fast_float simple_fastfloat_benchmark; do
    echo "# $repo: $(git -C "$WORKSPACE/$repo" rev-parse HEAD)"
    echo "# $repo-worktree-diff: $(git -C "$WORKSPACE/$repo" diff HEAD | shasum -a 256 | cut -d' ' -f1)"
  done
} > "$BUILD_DIR/provenance.txt"

echo "==> Done. Binaries:"
echo "    $BUILD_DIR/benchmarks/benchmark"
echo "    $BUILD_DIR/benchmarks/benchmark32"
