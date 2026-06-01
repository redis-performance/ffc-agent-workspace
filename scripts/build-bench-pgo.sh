#!/usr/bin/env bash
set -euo pipefail
# Clang PGO build of the race benchmark — profile-guided optimization that
# substantially speeds up BOTH parsers (x86 pinned: ffc +7..37%, fast_float
# +30..39% across random/canada/mesh vs plain -O3 clang). Instrument -> train on
# all 3 datasets -> merge -> rebuild with the profile.
#
# Requires clang++ + llvm-profdata. Output binary: build/cpgo-use/benchmarks/benchmark

WORKSPACE="$(cd "$(dirname "$0")/.." && pwd)"
FFC_DIR="$WORKSPACE/ffc"; FF_DIR="$WORKSPACE/fast_float"
B="$WORKSPACE/simple_fastfloat_benchmark"; D="$B/data"
PROF="$(command -v llvm-profdata || command -v llvm-profdata-18)"
FLAGS="-march=native -DFFC_ROUNDS_TO_NEAREST"

make -C "$FFC_DIR" ffc.h >/dev/null
rm -rf /tmp/racepgo && mkdir -p /tmp/racepgo

echo "==> instrument build"
cmake -B "$B/build/cpgo-gen" -S "$B" -DCMAKE_BUILD_TYPE=Release -DFFC_DIR="$FFC_DIR" \
  -DFETCHCONTENT_SOURCE_DIR_FAST_FLOAT="$FF_DIR" -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_C_FLAGS="$FLAGS -fprofile-instr-generate" -DCMAKE_CXX_FLAGS="$FLAGS -fprofile-instr-generate" \
  -DCMAKE_EXE_LINKER_FLAGS="-fprofile-instr-generate" --no-warn-unused-cli -Wno-dev >/dev/null 2>&1
cmake --build "$B/build/cpgo-gen" --target benchmark -j"$(nproc)" >/dev/null 2>&1

echo "==> train (random/canada/mesh)"
G="$B/build/cpgo-gen/benchmarks/benchmark"
LLVM_PROFILE_FILE=/tmp/racepgo/r-%p.profraw taskset -c "${PIN_CPU:-3}" "$G" >/dev/null 2>&1
LLVM_PROFILE_FILE=/tmp/racepgo/c-%p.profraw taskset -c "${PIN_CPU:-3}" "$G" -f "$D/canada.txt" >/dev/null 2>&1
LLVM_PROFILE_FILE=/tmp/racepgo/m-%p.profraw taskset -c "${PIN_CPU:-3}" "$G" -f "$D/mesh.txt" >/dev/null 2>&1
"$PROF" merge -output=/tmp/racepgo/merged.profdata /tmp/racepgo/*.profraw

echo "==> profile-use build"
cmake -B "$B/build/cpgo-use" -S "$B" -DCMAKE_BUILD_TYPE=Release -DFFC_DIR="$FFC_DIR" \
  -DFETCHCONTENT_SOURCE_DIR_FAST_FLOAT="$FF_DIR" -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_C_FLAGS="$FLAGS -fprofile-instr-use=/tmp/racepgo/merged.profdata" \
  -DCMAKE_CXX_FLAGS="$FLAGS -fprofile-instr-use=/tmp/racepgo/merged.profdata" \
  --no-warn-unused-cli -Wno-dev >/dev/null 2>&1
cmake --build "$B/build/cpgo-use" --target benchmark -j"$(nproc)" >/dev/null 2>&1
echo "==> done: $B/build/cpgo-use/benchmarks/benchmark"
