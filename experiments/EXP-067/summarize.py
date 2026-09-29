#!/usr/bin/env python3
"""Summarize one experiment's raw logs; score only the first ASCII parser row."""
import collections
import json
import re
import statistics
import sys
from pathlib import Path

experiment = Path(sys.argv[1])
display_parser = sys.argv[2] if len(sys.argv) > 2 else 'ffc'
assert display_parser in ('ffc', 'fastfloat')
baseline_target = sys.argv[3] if len(sys.argv) > 3 else 'apple-m6'
groups = collections.defaultdict(list)
for path in sorted((experiment / 'bench-results').glob('*.txt')):
    contents = path.read_text()
    target = Path(re.search(r'^# build-dir: (.+)$', contents, re.M)[1]).name
    dataset = None
    seen = set()
    for line in contents.splitlines():
        if line.startswith('===== '):
            dataset = line.strip('= ')
            seen = set()
        match = re.match(r'(ffc|fastfloat)\s+:\s+([\d.]+) MB/s.*?([\d.]+) Mfloat/s', line)
        if match and match[1] not in seen:
            assert dataset is not None
            seen.add(match[1])
            groups[dataset, target, match[1]].append((float(match[2]), float(match[3])))
rows = []
for (dataset, target, parser), values in sorted(groups.items()):
    median = statistics.median(v[0] for v in values)
    baseline = statistics.median(v[0] for v in groups[dataset, baseline_target, parser])
    rows.append(dict(dataset=dataset, target=target, parser=parser, runs=len(values),
                     mb_s=median, mfloat_s=statistics.median(v[1] for v in values),
                     delta_pct=100 * (median / baseline - 1),
                     min_mb_s=min(v[0] for v in values), max_mb_s=max(v[0] for v in values)))
(experiment / 'summary.json').write_text(json.dumps(rows, indent=2) + '\n')
for row in rows:
    if row['parser'] == display_parser:
        print(f"{row['target']:22} {row['dataset']:25} {row['mb_s']:8.2f} MB/s {row['mfloat_s']:7.2f} Mfloat/s {row['delta_pct']:+6.2f}% ({row['runs']} runs)")
