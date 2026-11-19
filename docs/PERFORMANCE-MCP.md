# Required performance MCP workflow

The maintainer requires the performance MCP from
[CPU Performance Engineering](https://github.com/usamahz/cpu-performance-engineering)
in **every investigation or optimization work session**, for **both Codex and Claude**.
This applies to controller and worker sessions, including resumed sessions and
worktrees. Read this alongside AGENTS.md at startup. A worker may consume a shared
consultation, but must identify it as shared evidence and record its own availability
check; it must not claim another agent's calls as its own.

## Required session steps

1. Discover and connect to the `cpu-perf` MCP server. Check `library_status`
   to identify the served repository/library version, coverage and unavailable sources.
2. Call `ask` before choosing an optimization hypothesis or interpreting performance.
   Include the actual architecture, workload, source/build identity and available
   measurements or assembly in `context`. Ask a concrete question tied to the current
   investigation; a generic lookup alone does not satisfy this step.
3. Follow relevant evidence with `lookup`, `get_section`, `get_entry` or `read_source`.
   Use `check_evidence` when assessing a performance claim. Cite a source only when
   the retrieved passage actually supports the statement; unread sources are leads.
4. Record a consultation in the experiment record under `experiments/`: UTC time, actual
   agent/backend, server/version or revision when available, tool names and inputs,
   concise findings, supporting source URLs, coverage limits, and what changed, or
   why the advice did not change the plan. Unknown metadata stays unknown.
5. Reconsult when a materially new hotspot, surprising result or proposed mechanism
   appears. Use the MCP's evidence to challenge the explanation before implementation.

## Availability and measurement discipline

If the server is unavailable, attempt discovery/connection and record the exact
failure and any remediation. Consult the linked primary sources as an explicitly
labelled fallback while continuing independent authorized work. Retry when the tool
becomes available; never silently skip the requirement or fabricate a tool response.
A compatible local stdio MCP client is acceptable when the host does not expose the
server directly; record that transport. Do not change agent permission settings.

Run retrieval, package setup and background indexing on the controller, outside the
benchmark runner. Do not add MCP activity to a timing or profile run.
New advice never changes the immutable benchmark referee or an experiment already
in flight; document a separate future experiment when a change is needed.

The MCP supplies source retrieval, interpretation aids and evidence checks. It does
not replace actual profiles, correctness checks, this workspace's validation gates
or adversarial review. Its bundled benchmark numbers are measurements on their
stated machine and must never qualify results measured here.
Preserve disagreements and unsupported explanations; rejecting a hypothesis remains valid.

## Shared entry points and reference

Codex reads the rule in [AGENTS.md](../AGENTS.md). Claude reads the same rule in
[.claude/CLAUDE.md](../.claude/CLAUDE.md). Keep this workflow backend-neutral and in
Git so new checkouts and worktrees receive it.

The authoritative tool catalog and connection instructions are in the project's
[MCP README](https://github.com/usamahz/cpu-performance-engineering/blob/main/misc/mcp/README.md).
Tool names above were checked on 19 November 2026 against `cpu-perf` 0.1.1. Discover
the actual exposed schema rather than guessing arguments. Keep connection credentials,
downloaded libraries and copyrighted source bodies out of this public repository;
commit requests, concise findings, links and appropriate hashes instead.
