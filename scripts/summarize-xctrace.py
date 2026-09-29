#!/usr/bin/env python3
"""Summarize xctrace's exported time-profile table (including XML references)."""
import collections
import sys
import xml.etree.ElementTree as ET


def main():
    process_prefix = sys.argv[3] if len(sys.argv) > 3 else "ffc-profile-"
    if len(sys.argv) > 2:
        toc = ET.parse(sys.argv[2]).getroot()
        target = toc.find(".//target/process")
        if target is None or target.attrib.get("return-exit-status") != "0":
            raise SystemExit("Profile target did not exit successfully; inspect the trace")
    root = ET.parse(sys.argv[1]).getroot()
    ids = {node.attrib["id"]: node for node in root.iter() if "id" in node.attrib}

    def resolve(node):
        while node is not None and "ref" in node.attrib:
            node = ids[node.attrib["ref"]]
        return node

    exclusive = collections.Counter()
    inclusive = collections.Counter()
    cores = collections.Counter()
    total = 0
    samples = 0
    for row in root.iter("row"):
        process = resolve(row.find("process"))
        if process is None or process_prefix not in process.attrib.get("fmt", ""):
            continue
        weight = resolve(row.find("weight"))
        stack = resolve(row.find("tagged-backtrace"))
        if weight is None or stack is None:
            continue
        frames = []
        for item in stack.findall("frame"):
            frame = resolve(item)
            binary = resolve(frame.find("binary"))
            frames.append((frame.attrib.get("name", "unknown"),
                           binary.attrib.get("name", "unknown") if binary is not None else "unknown"))
        if not frames:
            continue
        value = int(weight.text)
        total += value
        samples += 1
        exclusive[frames[0]] += value
        for frame in set(frames):
            inclusive[frame] += value
        core = resolve(row.find("core"))
        cores[core.attrib.get("fmt", "unknown") if core is not None else "unknown"] += value
    if not total:
        raise SystemExit(f"No weighted {process_prefix} profile samples found")
    print(f"Target samples: {samples}; total sample weight: {total / 1e9:.3f} s")
    print("Percentages are sampled time, not hardware stall percentages.")
    for title, counts in [("Self", exclusive), ("Inclusive (overlapping)", inclusive)]:
        print(f"\n{title}: percent | module | symbol")
        for (symbol, module), weight in counts.most_common(15):
            print(f"{100 * weight / total:7.2f}% | {module} | {symbol}")
    print("\nObserved cores: percent | core")
    for core, weight in cores.most_common():
        print(f"{100 * weight / total:7.2f}% | {core}")


if __name__ == "__main__":
    main()
