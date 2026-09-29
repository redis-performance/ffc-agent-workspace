#!/usr/bin/env python3
"""Build opt-in float API inlining, disabled and enabled; restore source on exit."""
import os
import sys
from pathlib import Path
import subprocess

root = Path(__file__).resolve().parents[2]
experiment = Path(__file__).resolve().parent
sources = [root / 'ffc/src/api.h', root / 'ffc/src/ffc.h']
assert subprocess.check_output(['git', '-C', str(root / 'ffc'), 'rev-parse', 'HEAD'], text=True).strip() == '965d4db45d03365b4c852ab34f4d5b08b53bc7b3'
assert not subprocess.check_output(['git', '-C', str(root / 'ffc'), 'status', '--porcelain'], text=True).strip()
originals = [p.read_text() for p in sources]

def run(args, log, env=None):
    subprocess.run(args, cwd=root, env=env, stdout=log, stderr=subprocess.STDOUT, check=True)

api = originals[0]
marker = '\nFFC_IMPL_INLINE ffc_result ffc_from_chars_double('
assert api.count(marker) == 1
api = api.replace(marker, """
/* Opt in to forced inlining of float APIs in implementation translation units.
 * Clang can specialize calls without changing C/C++ external linkage.
 * This can improve throughput at the cost of a larger caller. */
#if defined(FFC_IMPL) && defined(FFC_ENABLE_FLOAT_INLINING) && defined(__clang__)
#  define FFC_FLOAT_IMPL_INLINE __attribute__((always_inline))
#else
#  define FFC_FLOAT_IMPL_INLINE
#endif
""" + marker)
api = api.replace('ffc_result ffc_from_chars_float(', 'FFC_FLOAT_IMPL_INLINE ffc_result ffc_from_chars_float(').replace('ffc_result ffc_from_chars_float_options(', 'FFC_FLOAT_IMPL_INLINE ffc_result ffc_from_chars_float_options(')
implementation = originals[1].replace('ffc_result ffc_from_chars_float(', 'extern FFC_FLOAT_IMPL_INLINE ffc_result ffc_from_chars_float(').replace('ffc_result ffc_from_chars_float_options(', 'extern FFC_FLOAT_IMPL_INLINE ffc_result ffc_from_chars_float_options(')
candidates = {name: [api, implementation] for name in ['float-inline-clang-off', 'float-inline-clang-on']}
try:
    for name, candidate in candidates.items():
        if len(sys.argv) > 1 and name not in sys.argv[1:]:
            continue
        for source, contents in zip(sources, candidate):
            source.write_text(contents)
        patch = subprocess.check_output(['git', '-C', 'ffc', 'diff', '--', 'src/api.h', 'src/ffc.h'], cwd=root)
        (experiment / 'variants' / (name + '.patch')).write_bytes(patch)
        build = root / 'simple_fastfloat_benchmark/build' / ('m6-' + name)
        with (experiment / (name + '-build.log')).open('w') as log:
            run(['make', '-B', '-C', 'ffc', 'ffc.h'], log)
            extra = '-DFFC_ENABLE_FLOAT_INLINING' if name.endswith('-on') else ''
            run(['make', '-B', '-C', 'ffc', 'test', 'EXTRA_CFLAGS=' + extra], log)
            run(['cmake', '-B', str(build), '-S', str(root / 'simple_fastfloat_benchmark'),
                 '-DCMAKE_C_COMPILER=clang', '-DCMAKE_CXX_COMPILER=clang++',
                 '-DFETCHCONTENT_SOURCE_DIR_FFC=' + str(root / 'ffc'),
                 '-DFETCHCONTENT_SOURCE_DIR_FAST_FLOAT=' + str(root / 'fast_float'),
                 '-DFETCHCONTENT_SOURCE_DIR_ABSEIL=' + str(root / 'simple_fastfloat_benchmark/build/march-native/_deps/abseil-src'),
                 '-DFETCHCONTENT_SOURCE_DIR_SUPPLEMENTAL_TEST_FILES=' + str(root / 'simple_fastfloat_benchmark/build/march-native/_deps/supplemental_test_files-src'),
                 '-Wno-dev'], log)
            env = dict(os.environ, COMPILER='clang', BUILD_DIR=str(build), ARCH_FLAGS=('-mcpu=apple-m6 ' + extra).strip(), JOBS='2')
            run(['scripts/build-bench.sh'], log, env)
        print(name + ': correctness and build PASS', flush=True)
finally:
    for source, original in zip(sources, originals):
        source.write_text(original)
    subprocess.run(['make', '-B', '-C', 'ffc', 'ffc.h'], cwd=root, check=True)
