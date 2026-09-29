# Apple M6 setup — 2026-09-29

The workspace is ready to build, benchmark, and profile on this M6 Mac mini.
All seven top-level submodules now match their canonical upstream default
branches as fetched on this date. hiredis-py's nested hiredis follows its parent
pin (`616f228`), not master. Exact revisions are in
[EXP-065/dependency-versions.json](EXP-065/dependency-versions.json).

## Installed tools

- Python 3.13.15, managed by uv 0.12.20.
- CMake 4.4.3, installed with `uv tool install --python 3.13 cmake==4.4.3`.
- Ninja 1.13.2, installed with Homebrew.
- Existing Xcode 27 / Apple Clang 21, make, git, Instruments, and Claude CLI.

Executables are available through the existing `~/.local/bin` PATH entry.
Homebrew's nonstandard prefix failed to relocate CMake/Python dependencies;
uv supplied the working Python/CMake installation without modifying Homebrew's
layout. No Linux perf package or GNU coreutils is needed: the scripts use
Instruments and sysctl on macOS. GNU GCC was not installed; the local `gcc`
command is Apple's Clang compatibility driver.

Abseil, doctest, and supplemental test data were fetched by CMake at the revisions
recorded in the manifest. Optional Ryu and Redis server/runtime test environments
are not required for this parser campaign and were not installed.

## Recovery / repository changes

Work is isolated on `setup/apple-m6-20260929`. Original top-level submodule
checkouts have `backup/pre-m6-20260929` branches. Original fork URLs are retained
as local `workspace-fork` remotes; `.gitmodules` now points to canonical upstreams
so the new pins can be fetched by a fresh clone.

The old benchmark pin `228c224` could not be fetched from either upstream.
Replaced it with canonical `a856c09`. The pre-existing staged deletions are saved
in the benchmark stash named `Preserve pre-M6 staged deletions 2026-09-29`, with
an additional binary patch and before-state manifest in
`.git/m6-recovery-20260929/`. Inspect those backups before restoring the old
working state; the current benchmark checkout is clean.

The benchmark source itself is unchanged. Build scripts redirect both ffc and
fast_float to the workspace, accept `ARCH_FLAGS`/`BUILD_DIR`, preserve errors,
and limit builds/tests to two jobs by default. Benchmark logs contain build
provenance, binary hashes, and file dataset hashes. The profiler rejects stale
ffc source relative to the selected build and produces symbol/module/time-share
reports, with observed core placement on macOS.

Committed text logs have trailing whitespace removed; measurement values are
unchanged. Original text bytes are backed up under
`.git/m6-recovery-20260929/raw-results/`.

## Commands

From the workspace root:

```sh
make -C ffc test
COMPILER=clang JOBS=2 scripts/test-fast_float.sh

COMPILER=clang BUILD_DIR="$PWD/simple_fastfloat_benchmark/build/march-native" \
  ARCH_FLAGS=-march=native JOBS=2 scripts/build-bench.sh

COMPILER=clang BUILD_DIR="$PWD/simple_fastfloat_benchmark/build/march-native" \
  EXP=EXP-000 PRECISION=both scripts/run-bench.sh

COMPILER=clang BUILD_DIR="$PWD/simple_fastfloat_benchmark/build/march-native" \
  EXP=EXP-000 PRECISION=double DATASET=canada PROFILE_SECONDS=5 scripts/run-profile.sh
```

For a separate compiler-target experiment, replace the build directory with
`build/apple-m6` and set `ARCH_FLAGS=-mcpu=apple-m6` at build time. Do not compare
different source revisions as if they were a compiler-only change. The build
default remains `-march=native`; explicit M6 targeting is still experimental.

`DATASET=mesh PRECISION=float` selects the float mesh case in either measurement
script. `PROFILE_TEMPLATE='CPU Counters'` selects that Instruments template,
but the successful exports in this session contain time samples; hardware
stall/cycle metrics were not established. Raw `.trace` bundles and XML stay local
and ignored, while text reports/provenance are tracked. Ordinary timing needs
no sudo; `BENCH_SUDO=1` is an explicit option for the harness counter reader.

## Validation and decisions

- ffc unit, integer, format (274,944 checks), and supplemental tests pass.
- fast_float core/supplemental suite passes all 15 tests.
- Float and double benchmarks run on random, canada, and mesh.
- Instruments captures symbolized profiles and observed core types without sudo.
- [EXP-065](EXP-065/README.md): compiler targets, five interleaved runs each;
  parked because the gains are mixed and float mesh varies substantially.
- [EXP-066](EXP-066/README.md): native digit accumulation, three interleaved runs
  each; +10.10% double canada and +3.34% random, with an unresolved -0.95% mesh
  result. Patch saved and source restored. No parsing optimization accepted.

Follow-up experiments EXP-067–071 are now recorded. The strongest candidate is
[EXP-070 float inlining](EXP-070/README.md), with a C/C++ linkage-safe opt-in
patch and a portable Clang lab runner. Its remaining double mesh regression
prevents acceptance. Profiling now accepts `PARSER=ffc|fast_float` and validates
the selected parser's source against build provenance. Both precisions and all
datasets remain in the gate.
