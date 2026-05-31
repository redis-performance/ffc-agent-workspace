# Workspace Memory — ffc-agent-workspace

Persistent memory index. One entry per file. Committed to main so all agent
backends share the same context.

<!-- Add entries below as you learn things about the project, optimization
     patterns, what worked, what didn't, and user preferences. -->

- [race-setup](race-setup.md) — goal is now ffc vs fast_float race (EXP-049+), both mutable submodules
- [metal-fleet](metal-fleet.md) — ARM m8g (Graviton4 @ 3.92.205.222) + x86 m7i benchmark VMs
