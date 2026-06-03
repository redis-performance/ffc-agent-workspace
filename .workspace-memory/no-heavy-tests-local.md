---
name: no-heavy-tests-local
description: Never run heavy all-core workloads (exhaustive test, benchmarks) on the user's local machine
metadata:
  type: feedback
---

Do NOT run heavy, all-core workloads on the user's local machine. Specifically:
`make exhaustive` (FFC_EXH_THREADS pins every core for tens of seconds) and any
benchmark/profile run. The user killed a local `make exhaustive` and said "you
should not run that on my local machine!"

**Why:** the local box is the user's interactive workstation; saturating all
cores disrupts their work.

**How to apply:**
- Light correctness only on local: `make test`, `make supplemental_tests` (these
  are fine — quick, low load).
- Run `make exhaustive` and all benchmarks/profiling on the Intel lab
  (clx1/icx2/spr/gnr1) or the ARM Graviton4 metal box — never local.
- The AArch64 Clang 2x-unroll digit path can only be exercised on ARM anyway, so
  Graviton4 is the meaningful target for exhaustive when the digit loop changes.
