# Workspace Memory — ffc-agent-workspace

Persistent memory index. One entry per file. Committed to main so all agent
backends share the same context.

<!-- Add entries below as you learn things about the project, optimization
     patterns, what worked, what didn't, and user preferences. -->

- [race-setup](race-setup.md) — goal is now ffc vs fast_float race (EXP-049+), both mutable submodules
- [metal-fleet](metal-fleet.md) — ARM m8g (Graviton4 @ 3.92.205.222) + x86 m7i benchmark VMs
- [upstream-prs](upstream-prs.md) — fast_float PRs from the race (#381) + how to open them
- [hiredis-ffc](hiredis-ffc.md) — effort to propose ffc as hiredis's RESP3 double parser (read.c:311 strtod → ffc); plan in experiments/HIREDIS-FFC.md
