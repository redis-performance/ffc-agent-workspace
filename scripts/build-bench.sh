#!/usr/bin/env bash
set -euo pipefail

WORKSPACE="$(cd "$(dirname "$0")/.." && pwd)"
FFC_DIR="$WORKSPACE/ffc"
BENCH_DIR="$WORKSPACE/simple_fastfloat_benchmark"
BUILD_DIR="$BENCH_DIR/build"

echo "==> Regenerating ffc.h amalgam..."
make -C "$FFC_DIR" ffc.h

echo "==> Configuring benchmark (FFC_DIR=$FFC_DIR)..."
cmake -B "$BUILD_DIR" -S "$BENCH_DIR" \
  -DCMAKE_BUILD_TYPE=Release \
  -DFFC_DIR="$FFC_DIR" \
  -DCMAKE_C_FLAGS="-march=native -DFFC_ROUNDS_TO_NEAREST" \
  -DCMAKE_CXX_FLAGS="-march=native -DFFC_ROUNDS_TO_NEAREST" \
  --no-warn-unused-cli \
  -Wno-dev \
  2>&1 | tail -5

echo "==> Building..."
cmake --build "$BUILD_DIR" --target benchmark benchmark32 -j"$(nproc)"

echo "==> Done. Binaries:"
echo "    $BUILD_DIR/benchmarks/benchmark"
echo "    $BUILD_DIR/benchmarks/benchmark32"
