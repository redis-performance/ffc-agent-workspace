#!/usr/bin/env python3
"""Build compact SWAR and NEON ASCII scan variants; restore source on exit."""
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
start = original.index('ffc_loop_parse_if_eight_digits(char const **p')
guard = '#if defined(__aarch64__) && defined(__clang__)'
a = original.index(guard, start)
candidates['scan-compact'] = original[:a] + original[a:].replace(guard, guard + ' && !defined(__APPLE__)', 1)
helper = """
#if defined(__APPLE__) && defined(__aarch64__) && defined(__clang__)
/* Caller guarantees at least 16 readable bytes. Advance only after validation. */
ffc_internal ffc_inline bool
ffc_parse_sixteen_ascii_neon(char const *p, uint64_t *i) {
  uint8x16_t digits = vsubq_u8(vld1q_u8((const uint8_t *)p), vdupq_n_u8('0'));
  if (vmaxvq_u8(digits) > 9) {
    return false;
  }
  const uint8x8_t tens = {10, 1, 10, 1, 10, 1, 10, 1};
  const uint16x8_t hundreds = {100, 1, 100, 1, 100, 1, 100, 1};
  const uint32x4_t ten_thousands = {10000, 1, 10000, 1};
  uint16x8_t low = vmull_u8(vget_low_u8(digits), tens);
  uint16x8_t high = vmull_u8(vget_high_u8(digits), tens);
  uint16x8_t pairs = vpaddq_u16(low, high);
  uint32x4_t quads = vpaddlq_u16(vmulq_u16(pairs, hundreds));
  uint64x2_t octets = vpaddlq_u32(vmulq_u32(quads, ten_thousands));
  uint64_t first = vgetq_lane_u64(octets, 0);
  uint64_t second = vgetq_lane_u64(octets, 1);
  *i = *i * 10000000000000000ULL + first * 100000000ULL + second;
  return true;
}
#endif

"""
needle = 'ffc_internal ffc_inline void\nffc_loop_parse_if_eight_digits('
assert original.count(needle) == 1
neon = original.replace(needle, helper + needle)
needle = '  while (pend - *p >= 16) {\n'
assert neon.count(needle) == 1
neon = neon.replace(needle, needle + """#if defined(__APPLE__) && defined(__aarch64__) && defined(__clang__)
    if (ffc_parse_sixteen_ascii_neon(*p, i)) {
      *p += 16;
      continue;
    }
#endif
""")
candidates['scan-neon16'] = neon
# If any of 16 bytes is invalid, the existing 8/4-digit remainder path
# consumes exactly the same valid prefix as the old two-block loop.
begin = original.index('  while (pend - *p >= 16) {', start)
end = original.index('  if (pend - *p >= 8) {', begin)
old_loop = original[begin:end]
replacement = """#if defined(__APPLE__)
  while (pend - *p >= 16 && ffc_parse_sixteen_ascii_neon(*p, i)) {
    *p += 16;
  }
#else
""" + old_loop + '#endif\n'
compact_neon = original.replace(old_loop, replacement, 1)
compact_neon = compact_neon.replace('ffc_internal ffc_inline void\nffc_loop_parse_if_eight_digits(', helper + 'ffc_internal ffc_inline void\nffc_loop_parse_if_eight_digits(', 1)
candidates['scan-neon16-compact'] = compact_neon
outlined = compact_neon.replace('ffc_internal ffc_inline bool\nffc_parse_sixteen_ascii_neon(char const *p, uint64_t *i)', 'ffc_internal __attribute__((noinline)) uint64_t\nffc_parse_sixteen_ascii_neon(char const *p)')
outlined = outlined.replace('if (vmaxvq_u8(digits) > 9) {\n    return false;', 'if (vmaxvq_u8(digits) > 9) {\n    return UINT64_MAX;')
outlined = outlined.replace('  *i = *i * 10000000000000000ULL + first * 100000000ULL + second;\n  return true;', '  return first * 100000000ULL + second;')
outlined = outlined.replace('  while (pend - *p >= 16 && ffc_parse_sixteen_ascii_neon(*p, i)) {\n    *p += 16;\n  }', """  while (pend - *p >= 16) {
    uint64_t chunk = ffc_parse_sixteen_ascii_neon(*p);
    if (chunk == UINT64_MAX) { break; }
    *i = *i * 10000000000000000ULL + chunk;
    *p += 16;
  }""")
candidates['scan-neon16-outlined'] = outlined
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
