#!/usr/bin/env python3
"""Check exported float APIs across C/C++ implementation and caller TUs."""
import subprocess
import sys
from pathlib import Path

root = Path(__file__).resolve().parents[2]
build = root / 'simple_fastfloat_benchmark/build/profile-data/float-linkage'
build.mkdir(parents=True, exist_ok=True)
enabled = sys.argv[1] if len(sys.argv) > 1 else 'on'
assert enabled in ('on', 'off')
flags = ['-DFFC_ENABLE_FLOAT_INLINING'] if enabled == 'on' else []
(build / 'implementation.c').write_text('#define FFC_IMPL\n#include "ffc.h"\n')
(build / 'caller.c').write_text(r'''#include "ffc.h"
int main(void) {
  const char input[] = "1.25";
  float value = 0;
  ffc_result (*parse)(const char *, const char *, float *) = ffc_from_chars_float;
  ffc_result result = parse(input, input + 4, &value);
  if (result.outcome != FFC_OUTCOME_OK || result.ptr != input + 4 || value != 1.25f) return 1;
  ffc_result (*options)(const char *, const char *, float *, ffc_parse_options) = ffc_from_chars_float_options;
  result = options(input, input + 4, &value, ffc_parse_options_default());
  return result.outcome != FFC_OUTCOME_OK || result.ptr != input + 4 || value != 1.25f;
}
''')
languages = [('c', 'c99'), ('c++', 'c++17')]
for impl, impl_std in languages:
    impl_obj = build / ('implementation-' + impl.replace('+', 'p') + '.o')
    subprocess.run(['clang', '-x', impl, '-std=' + impl_std, '-O3', *flags,
                    '-I' + str(root / 'ffc'), '-c', str(build / 'implementation.c'),
                    '-o', str(impl_obj)], check=True)
    for caller, caller_std in languages:
        caller_obj = build / 'caller.o'
        subprocess.run(['clang', '-x', caller, '-std=' + caller_std, '-O3', *flags,
                        '-I' + str(root / 'ffc'), '-c', str(build / 'caller.c'),
                        '-o', str(caller_obj)], check=True)
        executable = build / 'linked'
        subprocess.run(['clang++', str(impl_obj), str(caller_obj), '-o', str(executable)], check=True)
        subprocess.run([str(executable)], check=True)
        print(f'inline={enabled}: {impl} implementation / {caller} caller PASS', flush=True)
