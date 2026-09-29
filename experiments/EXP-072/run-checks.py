#!/usr/bin/env python3
"""Reproduce scanner oracle, guard-page, sanitizer and supplemental checks."""
import subprocess
import sys
from pathlib import Path

root = Path(__file__).resolve().parents[2]
experiment = Path(__file__).resolve().parent
source = root / 'ffc/src/parse.h'
assert subprocess.check_output(['git', '-C', str(root / 'ffc'), 'rev-parse', 'HEAD'], text=True).strip() == '965d4db45d03365b4c852ab34f4d5b08b53bc7b3'
assert not subprocess.check_output(['git', '-C', str(root / 'ffc'), 'status', '--porcelain'], text=True).strip()
original = source.read_text()
names = sys.argv[1:] or ['scan-compact', 'scan-neon16', 'scan-neon16-compact', 'scan-neon16-outlined']
assert all((experiment / 'variants' / (name + '.patch')).is_file() for name in names)
baseline = None
try:
    for name in ['baseline'] + names:
        source.write_text(original)
        if name != 'baseline':
            subprocess.run(['git', '-C', str(root / 'ffc'), 'apply',
                            str(experiment / 'variants' / (name + '.patch'))], check=True)
        subprocess.run(['make', '-B', '-C', str(root / 'ffc'), 'ffc.h'],
                       stdout=subprocess.DEVNULL, check=True)
        executable = root / 'simple_fastfloat_benchmark/build/profile-data' / ('scan-check-' + name)
        executable.parent.mkdir(parents=True, exist_ok=True)
        with (experiment / (name + '-validation.log')).open('w') as log:
            configurations = [(['-O3'], '')]
            if 'neon' in name:
                configurations.append((['-O1', '-g', '-fsanitize=address,undefined',
                                        '-fno-omit-frame-pointer'], '-sanitized'))
            for flags, suffix in configurations:
                subprocess.run(['clang', *flags, '-std=c99', '-I' + str(root / 'ffc'),
                                str(experiment / 'check-scan.c'), '-o', str(executable) + suffix],
                               stdout=log, stderr=subprocess.STDOUT, check=True)
                result = subprocess.check_output([str(executable) + suffix],
                                                 stderr=subprocess.STDOUT, text=True)
                log.write(result)
                log.flush()
                if baseline is None:
                    baseline = result
                assert result == baseline, (name, suffix, result, baseline)
            data = root / 'simple_fastfloat_benchmark/build/march-native/_deps/supplemental_test_files-src/data'
            subprocess.run(['make', '-C', str(root / 'ffc'), 'supplemental_tests',
                            'SUPPLEMENTAL_TEST_DATA_DIR=' + str(data)],
                           stdout=log, stderr=subprocess.STDOUT, check=True)
        print(name + ': ' + baseline.strip() + '; supplemental PASS', flush=True)
finally:
    source.write_text(original)
    subprocess.run(['make', '-B', '-C', str(root / 'ffc'), 'ffc.h'],
                   stdout=subprocess.DEVNULL, check=True)
