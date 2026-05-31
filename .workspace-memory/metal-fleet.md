---
name: metal-fleet
description: The two AWS metal VMs used for ffc/fast_float race benchmarking and their roles
metadata:
  type: project
---

Benchmark fleet (official 12-cell scoreboard runs on these, not the local laptop):

- **ARM**: `m8g.metal-24xl` — AWS Graviton4 / Neoverse V2. Reached as
  `ubuntu@3.92.205.222` (Elastic IP). Private IP seen as `10.0.7.254`. All
  EXP-001…048 ffc work ran here; recorded in result headers as `metal-arm-m8g`.
- **x86**: `m7i.metal-24xl` — Intel Sapphire Rapids (Xeon Platinum 8488C).
  Tag `metal-x86-m7i`. Under-explored; only paired baseline + a couple of runs.

Caveat: EIP is only valid while the instance is running/associated — verify before
relying on `3.92.205.222`. The local dev box `fco-tp` (Core Ultra 7 155U) is noisy
(±20%) and is NOT the official scoreboard — see [[race-setup]].
