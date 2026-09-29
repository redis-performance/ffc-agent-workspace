#!/usr/bin/env python3
"""Build exponent digit-peeling variants serially; restore source on exit."""
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

candidates = {}
marker = """    } else {
      while ((p != pend) && ffc_is_integer(*p)) {
        uint8_t digit = (uint8_t)(*p - '0');"""
assert original.count(marker) == 1
for count in (1, 2):
    peel = """#if defined(__APPLE__) && defined(__aarch64__) && defined(__clang__)
      // The first exponent character has already passed the digit check.
      exp_number = (uint8_t)(*p++ - '0');
"""
    if count == 2:
        peel += """      if (p != pend && ffc_is_integer(*p)) {
        exp_number = 10 * exp_number + (uint8_t)(*p++ - '0');
      }
"""
    peel += '#endif\n'
    candidates['peel' + str(count)] = original.replace(marker, '    } else {\n' + peel + marker.split('    } else {\n')[1])
try:
    for name, candidate in candidates.items():
        if len(sys.argv) > 1 and name not in sys.argv[1:]:
            continue
        source.write_text(candidate)
        patch = subprocess.check_output(['git', '-C', 'ffc', 'diff', '--', 'src/parse.h'], cwd=root)
        (experiment / 'variants' / (name + '.patch')).write_bytes(patch)
        build = root / 'simple_fastfloat_benchmark/build' / ('m6-' + name)
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
