# TMA in every experiment report

Required for Codex and Claude in every experiment, including follow-ups and
parked/rejected work. Use [topdown-profiler](https://github.com/redis-performance/topdown-profiler);
the [CPU-perf methodology consultation](PERFORMANCE-MCP.md) remains a separate requirement.

Include this classification **inside each new experiment report**. Reports written
before this rule are not rewritten; add an adjacent `TMA.md` supplement if one is revisited.

```text
Pipeline Slots (100%) — <architecture / workload / baseline or candidate>
├── Frontend_Bound      <measured %>  Instruction supply
├── Bad_Speculation     <measured %>  Wrong-path/discarded work
├── Backend_Bound       <measured %>  Data supply / execution
│   ├── Memory_Bound    <measured %>  Include measured L1/L2/L3/DRAM children
│   └── Core_Bound      <measured %>  Execution resources / dependencies
└── Retiring            <measured %>  Retired work
```

The four L1 shares describe the same denominator and sum to approximately 100%.
Children are shares of **total slots**, not a second independent 100%; show only
supported/measured children. Preserve residuals and rounding rather than silently
rescaling. Retiring includes overhead: a higher fraction alone is not a speedup.

Beside the tree, include:

- Exact machine architecture, source and binary hashes, compiler/flags, workload,
  fixture, seed, CPU/PID/core scope and SMT sibling state.
- Tool/collector version, capture commands and run IDs, raw output/checksums,
  window count/duration, multiplexing/unsupported events and variability.
- Baseline and candidate trees from matched captures. State the next falsifiable
  question and what observation would rule it out. TMA does not replace timing gates.

If no valid capture exists, retain the four category names with `unavailable`,
explain why, and name the required collection. Never invent numbers to fill the tree.
Linux ARM/AMD collector coverage differs from Intel; label approximations and
unsupported levels. Apple PMU data is not interchangeable with Neoverse TMA.

Before collecting, verify the collector's actual command and scope: which CPUs or
PIDs it measures, and the workload's effective CPU affinity inside the launched
process. Label a CPU-wide capture as CPU-wide. Preserve the raw collector output,
and keep failed launch evidence separate from collected profiles.
