#!/usr/bin/env python3
"""Compare the final EXP-070 patch on a lab runner; restore parser source on exit."""
import argparse
import datetime
import os
import platform
import re
import shutil
import subprocess
from pathlib import Path

root = Path(__file__).resolve().parents[2]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--runs', type=int, default=7)
parser.add_argument('--profile-seconds', type=int, default=5)
parser.add_argument('--label', default=platform.node().split('.')[0] + '-' +
                    datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%d-%H%M%S'))
parser.add_argument('--dry-run', action='store_true', help='Check prerequisites and print configuration only')
args = parser.parse_args()
if not 1 <= args.runs <= 100 or not 1 <= args.profile_seconds <= 10:
    parser.error('runs must be 1..100 and profile-seconds 1..10')
if not re.fullmatch(r'[A-Za-z0-9_.-]+', args.label) or args.label in ('.', '..'):
    parser.error('label must contain only letters, digits, dots, underscores or hyphens')
arch_flags = os.environ.get('ARCH_FLAGS', '-march=native')
jobs = os.environ.get('JOBS', '2')
if not jobs.isdigit() or int(jobs) < 1:
    parser.error('JOBS must be a positive integer')
for command in ['clang', 'clang++', 'gcc', 'cmake', 'make', 'git', 'python3', 'shasum']:
    if shutil.which(command) is None:
        parser.error('Missing required executable: ' + command)
if platform.system() == 'Linux':
    for command in ['perf', 'sudo']:
        if shutil.which(command) is None:
            parser.error('Linux profiling requires ' + command)
elif platform.system() != 'Darwin':
    parser.error('This runner supports Linux perf or macOS Instruments')

pins = {'ffc': '965d4db45d03365b4c852ab34f4d5b08b53bc7b3',
        'fast_float': '9498cc361e081f46c85c936a0677e271c1930a45',
        'simple_fastfloat_benchmark': 'a856c090a6284f2a52d081471d266767b3856e82'}
for repo, expected in pins.items():
    actual = subprocess.check_output(['git', '-C', str(root / repo), 'rev-parse', 'HEAD'], text=True).strip()
    if actual != expected:
        parser.error(repo + ' is not at the recorded baseline; update submodules first')
    dirty = subprocess.check_output(['git', '-C', str(root / repo), 'status', '--porcelain'], text=True).strip()
    if dirty:
        parser.error(repo + ' has local changes; refusing to overwrite or benchmark them')

experiment = 'EXP-070/lab/' + args.label
output = root / 'experiments' / experiment
build_root = root / 'simple_fastfloat_benchmark/build/exp070-lab' / args.label
patch = root / 'experiments/EXP-070/variants/float-inline-clang-on.patch'
subprocess.run(['git', '-C', str(root / 'ffc'), 'apply', '--check', str(patch)], check=True)
if output.exists() or build_root.exists():
    parser.error('This label already has results/builds; choose a new --label')
print(f'Clang; ARCH_FLAGS={arch_flags}; JOBS={jobs}; {args.runs} interleaved rounds', flush=True)
print('Baseline and enabled option; float + double; random + canada + mesh', flush=True)
print('Profiles: float mesh and double mesh, both builds. Linux perf uses sudo.', flush=True)
print('Results: ' + str(output), flush=True)
if args.dry_run:
    raise SystemExit(0)

output.mkdir(parents=True)
env = dict(os.environ, COMPILER='clang', JOBS=jobs, EXP=experiment, PARSER='ffc')
# Do not inherit selectors that would silently shrink or replace the campaign.
for key in ['PROFILE_DATA', 'DATASET', 'PRECISION', 'RUN_LABEL', 'EXHAUSTIVE']:
    env.pop(key, None)
sources = [root / 'ffc/src/api.h', root / 'ffc/src/ffc.h']
originals = [path.read_bytes() for path in sources]


def run(command, log_name, overrides=None):
    with (output / log_name).open('w') as log:
        subprocess.run(command, cwd=root, env=dict(env, **(overrides or {})),
                       stdout=log, stderr=subprocess.STDOUT, check=True)


def restore():
    for path, content in zip(sources, originals):
        path.write_bytes(content)
    subprocess.run(['make', '-B', '-C', str(root / 'ffc'), 'ffc.h'], check=True,
                   stdout=subprocess.DEVNULL)


try:
    run(['scripts/test-fast_float.sh'], 'fast-float-tests.log', {'EXHAUSTIVE': '0'})
    for target in ['baseline', 'float-inline-on']:
        if target == 'float-inline-on':
            subprocess.run(['git', '-C', str(root / 'ffc'), 'apply', str(patch)], check=True)
        extra = '-DFFC_ENABLE_FLOAT_INLINING' if target == 'float-inline-on' else ''
        # Keep Linux's feature-test macro when overriding Makefile EXTRA_CFLAGS.
        test_extra = ('-D_DEFAULT_SOURCE ' + extra).strip() if platform.system() == 'Linux' else extra
        run(['make', '-B', '-C', 'ffc', 'test', 'EXTRA_CFLAGS=' + test_extra], target + '-tests.log')
        run(['python3', 'experiments/EXP-070/check-linkage.py', 'on' if extra else 'off'],
            target + '-linkage.log')
        build = build_root / target
        run(['scripts/build-bench.sh'], target + '-build.log',
            {'BUILD_DIR': str(build), 'ARCH_FLAGS': (arch_flags + ' ' + extra).strip()})
        run(['make', '-C', 'ffc', 'supplemental_tests', 'EXTRA_CFLAGS=' + test_extra,
             'SUPPLEMENTAL_TEST_DATA_DIR=' + str(build / '_deps/supplemental_test_files-src/data')],
            target + '-supplemental.log')
        print(target + ': correctness, linkage, build and supplemental PASS', flush=True)
    for iteration in range(args.runs):
        order = ['baseline', 'float-inline-on']
        if iteration % 2:
            order.reverse()
        for target in order:
            label = target + '-r' + str(iteration + 1)
            run(['scripts/run-bench.sh'], label + '.log',
                {'BUILD_DIR': str(build_root / target), 'PRECISION': 'both',
                 'DATASET': 'all', 'RUN_LABEL': label})
        print(f'Benchmark round {iteration + 1}/{args.runs} PASS', flush=True)
    for target in ['float-inline-on', 'baseline']:
        if target == 'baseline':
            restore()
        for precision in ['float', 'double']:
            run(['scripts/run-profile.sh'], target + '-' + precision + '-profile.log',
                {'BUILD_DIR': str(build_root / target), 'PRECISION': precision,
                 'DATASET': 'mesh', 'RUN_LABEL': target, 'PROFILE_SECONDS': str(args.profile_seconds)})
        print(target + ': float/double mesh profiles PASS', flush=True)
    subprocess.run(['python3', str(root / 'experiments/EXP-067/summarize.py'),
                    str(output), 'ffc', 'baseline'], check=True)
finally:
    restore()
print('Complete. Parser source restored. Results: ' + str(output), flush=True)
