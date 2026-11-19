# Agent Notes — ffc-agent-workspace

Conventions for agent loops running in this workspace.
Mirrors the style of `redis-agent-workspace/AGENTS.md`.

---

## Optimization Goal

Push ffc.h parsing throughput beyond the current Linux x86 baseline.
Primary target: `ffc_from_chars_double` / `ffc_from_chars_float` hot path in `ffc/src/parse.h`.

---

## Mandatory performance MCP use — every session

Every investigation or optimization work session, whether run by Codex or Claude,
must use the `cpu-perf` performance MCP from
[usamahz/cpu-performance-engineering](https://github.com/usamahz/cpu-performance-engineering).
This is a required part of the investigation, not an optional reference.

At session start, discover the server/tools and check `library_status`; before
proposing changes or interpreting performance, call `ask` with the actual question
and relevant measured counters, assembly or compiler output. Use its source lookup
and evidence-checking tools as needed. Record the calls, source/version information,
findings, limitations and resulting decisions in the experiment record.
Follow [docs/PERFORMANCE-MCP.md](docs/PERFORMANCE-MCP.md) for the shared workflow.
If unavailable, record the attempted connection and concrete blocker, use the linked
primary sources as a disclosed fallback, and restore MCP use when possible. Never
claim a consultation happened when it did not. Keep indexing and retrieval off the
benchmark runner; the immutable referee and existing acceptance gates remain.

---

## Required TMA classification — every experiment

Codex and Claude must use [topdown-profiler](https://github.com/redis-performance/topdown-profiler)
to assess further experiments. Every experiment's Markdown report must contain a
**TMA classification**: Frontend_Bound, Bad_Speculation, Backend_Bound and Retiring,
with their measured shares of total pipeline slots, plus measured child categories.
The four L1 categories sum to 100% within reported rounding/measurement error.
Show baseline and candidate separately; link raw captures, tool revision, binary,
CPU/collector scope, workload, run IDs and collection quality. Follow
[docs/TMA-REPORTING.md](docs/TMA-REPORTING.md). Never substitute hotspot sample
shares, IPC, instruction counts, another machine, or illustrative numbers for TMA.
If unsupported or uncollected, show all four as unavailable and state the blocker.
Reports written before this rule are not rewritten.

---

## Two-Step Validation (mandatory)

Every code change must pass both steps before being accepted:

1. **Benchmark** — run `scripts/run-bench.sh`, compare MB/s and Mfloat/s
   - Must improve at least one dataset without regressing others
   - Results go in the experiment log entry in `experiments/EXPERIMENTS.md`

2. **Profile** — run `scripts/run-profile.sh`, compare hot symbols
   - Confirm the expected bottleneck shifted
   - Capture key `perf report` lines (symbol, %, module)

An approach that improves benchmark numbers but reveals a new surprising bottleneck
is a **partial win** — document the new bottleneck and continue.

---

## Agent-Agnostic Shim — `scripts/agent-run.sh`

Single env var `AGENT` selects the backend:
- `AGENT=claude` (default) — uses `claude` CLI in non-interactive mode
- `AGENT=codex` (planned)
- `AGENT=aider` (planned)

Skills under `.claude/skills/*.md` are plain markdown prompts.

---

## Persistent Memory — `.workspace-memory/`

All memory files live in `.workspace-memory/` so every agent backend shares context.
`MEMORY.md` is the index; one file per memory entry.

When running autonomously: commit any `.workspace-memory/` updates back to `main`
in the same commit as the experiment results. Git log is the audit trail.

**Claude-specific note:** Claude Code's built-in auto-memory writes to
`~/.claude/projects/…/memory/` locally. Copy relevant entries into
`.workspace-memory/` before committing so other backends see them.

---

## Workflow Rules

- **Always edit `ffc/src/*.h`**, never `ffc/ffc.h` directly — the amalgam is generated
- After editing sources: `make -C ffc ffc.h` regenerates the amalgam
- After regenerating: `scripts/build-bench.sh` rebuilds the benchmark binary
- **Always run `make -C ffc test` before logging a benchmark result** — correctness first
- Log every experiment in `experiments/EXPERIMENTS.md` — failures are valuable
- Keep `experiments/SUMMARY.md` and `README.md` counts in sync after each decision
- Never force-push to `main`

---

## Runner Requirements

This workspace runs entirely locally — no remote runners required.

- `clang` / `gcc`, `make`, `cmake` ≥ 3.15
- `python3` ≥ 3.10 (for `ffc/amalgamate.py`)
- `perf` (Linux kernel tools) — `sudo apt install linux-tools-generic`
- `claude` CLI — `npm i -g @anthropic-ai/claude-code`

For perf counter access (branch mispredicts, cache misses):
```bash
echo -1 | sudo tee /proc/sys/kernel/perf_event_paranoid
```

---

## Required Secrets

None — this workspace is fully OSS and runs locally.
Set `ANTHROPIC_API_KEY` or use `CLAUDE_CODE_OAUTH_TOKEN` for the claude CLI.

---

## Key Operational Notes

- `ffc/ffc.h` is the amalgamated header; always regenerate it after editing `src/`
- The benchmark's `ENABLE_FFC` cmake flag wires ffc into `simple_fastfloat_benchmark`
- `sudo` is needed for `perf` hardware counter access (branch misses, IPC)
- `benchmark32` tests float (32-bit) parsing; `benchmark` tests double (64-bit)
- The benchmark runs 100 repetitions per dataset by default — sufficient for stable numbers
