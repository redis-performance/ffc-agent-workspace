#!/usr/bin/env python3
"""Build accumulator-site ablations serially; restore source on exit."""
import os
import sys
from pathlib import Path
import subprocess

root = Path(__file__).resolve().parents[2]
experiment = Path(__file__).resolve().parent
source = root / 'ffc/src/parse.h'
assert subprocess.check_output(['git', '-C', str(root / 'ffc'), 'rev-parse', 'HEAD'], text=True).strip() == '965d4db45d03365b4c852ab34f4d5b08b53bc7b3', 'Use the recorded upstream baseline'
assert not subprocess.check_output(['git', '-C', str(root / 'ffc'), 'status', '--porcelain', '--', 'src/parse.h', 'ffc.h'], text=True).strip(), 'Refusing to overwrite parser changes'
original = source.read_text()
assert 'FFC_NATIVE_SITE_ACC10' not in original

def run(args, log, env=None):
    subprocess.run(args, cwd=root, env=env, stdout=log, stderr=subprocess.STDOUT, check=True)

helper = """
// Experimental site ablation; not a proposed all-Apple default.
#if defined(__APPLE__) && defined(__aarch64__) && defined(__clang__)
#define FFC_NATIVE_SITE_ACC10(acc, d_expr) ((acc) * 10 + (uint64_t)(d_expr))
#else
#define FFC_NATIVE_SITE_ACC10(acc, d_expr) FFC_DIGIT_ACC10(acc, d_expr)
#endif

"""
bounds = {
    'integer': ('  // Integer scan:', '  char const *const end_of_integer_part'),
    'fraction': ('    // manual unroll for the 1-3 digit case', '    // pre: i = 123'),
    'exponent': ('  /* explicit exponential part */', '  answer.lastmatch = p;'),
}
try:
    for name, (start, end) in bounds.items():
        if len(sys.argv) > 1 and name not in sys.argv[1:]:
            continue
        a = original.index(start)
        b = original.index(end, a)
        assert b > a
        candidate = original[:a] + original[a:b].replace('FFC_DIGIT_ACC10(', 'FFC_NATIVE_SITE_ACC10(') + original[b:]
        marker = 'ffc_internal ffc_inline void\nffc_loop_parse_if_eight_digits'
        candidate = candidate.replace(marker, helper + marker, 1)
        source.write_text(candidate)
        patch = subprocess.check_output(['git', '-C', 'ffc', 'diff', '--', 'src/parse.h'], cwd=root)
        (experiment / 'variants' / (name + '.patch')).write_bytes(patch)
        build = root / 'simple_fastfloat_benchmark/build' / ('m6-site-' + name)
        with (experiment / (name + '-build.log')).open('w') as log:
            run(['make', '-B', '-C', 'ffc', 'ffc.h'], log)
            run(['make', '-C', 'ffc', 'test'], log)
            run(['cmake', '-B', str(build), '-S', str(root / 'simple_fastfloat_benchmark'),
                 '-DCMAKE_C_COMPILER=clang', '-DCMAKE_CXX_COMPILER=clang++',
                 '-DFETCHCONTENT_SOURCE_DIR_FFC=' + str(root / 'ffc'),
                 '-DFETCHCONTENT_SOURCE_DIR_FAST_FLOAT=' + str(root / 'fast_float'),
                 '-DFETCHCONTENT_SOURCE_DIR_ABSEIL=' + str(root / 'simple_fastfloat_benchmark/build/march-native/_deps/abseil-src'),
                 '-DFETCHCONTENT_SOURCE_DIR_SUPPLEMENTAL_TEST_FILES=' + str(root / 'simple_fastfloat_benchmark/build/march-native/_deps/supplemental_test_files-src'),
                 '-Wno-dev'], log)
            env = dict(os.environ, COMPILER='clang', BUILD_DIR=str(build), ARCH_FLAGS='-mcpu=apple-m6', JOBS='2')
            run(['scripts/build-bench.sh'], log, env)
        print(name + ': correctness and build PASS', flush=True)
finally:
    source.write_text(original)
    subprocess.run(['make', '-B', '-C', 'ffc', 'ffc.h'], cwd=root, check=True)
