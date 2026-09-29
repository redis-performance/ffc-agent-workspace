---
name: exp070-linux-validation
description: EXP-070 Linux correctness, linkage and benchmark/profile results; remains parked before upstream PR.
metadata:
  type: project
---

See [Linux validation](../experiments/EXP-070/lab/LINUX-VALIDATION.md).
2026-09-29: Intel/AMD/ARM Clang18 tests and profiles pass; GCC13 compatibility
and 72 C/C++ linkage cases pass. All 4,838,400 differential checks match baseline.
Float improves 6.58–33.62%; AMD double random repeats ~-0.45%, Intel double mesh
-0.46..-0.82%. The M6 -1.61% double-mesh result remains unresolved. Keep EXP-070
parked under the no-regression gate. No upstream PR opened.
The exact patch is unchanged, all parser sources restored, selected lab runners
released and Redis workspace shared fleet updated. Inspect that private fleet
inventory before any new runner use. Detailed raw perf/binary archives are kept
locally under /home/fco/redislabs/ffc-validation-artifacts/20260929/.
