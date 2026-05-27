# EXP-034 — Chair Decision

## Context

Previous ARM bench results (EXP-033: 1820/1673/1656 MB/s) were measured without
`-DFFC_ROUNDS_TO_NEAREST`, meaning EXP-030's compile-time macro benefit was never
captured in the ARM baseline. This experiment establishes the true baseline and
determines the best compiler configuration for ARM Graviton4.

## Winning Hypothesis

GCC 13 + `-march=native` + `-DFFC_ROUNDS_TO_NEAREST` is already optimal for
ffc on ARM Graviton4. Clang 18 will generate significantly more instructions for
the C-style ffc code (estimated 15–25% regression) while `-mcpu=native` will
produce identical codegen to `-march=native` since GCC's Neoverse V2 scheduler
model is already activated by `-march=native` on this CPU.

## Test Matrix

1. GCC 13 + `-march=native` + `-DFFC_ROUNDS_TO_NEAREST` (corrected baseline)
2. Clang 18 + `-march=native` + `-DFFC_ROUNDS_TO_NEAREST`
3. GCC 13 + `-mcpu=native` + `-DFFC_ROUNDS_TO_NEAREST`

## Proposals Considered

This was a manual experiment (no parallel proposer agents). Architecture: ARM
Graviton4 selected over x86 because ARM shows 67–231% lead over fastfloat vs
0–54% on x86, making ARM the active optimization front.
