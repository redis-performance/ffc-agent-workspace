# Approach Summary — ffc.h

Single source of truth for all optimization attempt status.
Keep README.md counts in sync whenever this table changes.

| # | Title | Target | Δ MB/s (best dataset) | Status | Date |
|---|-------|--------|-----------------------|--------|------|
| EXP-009 | FFC_IMPL_INLINE force inline on declarations | all | +22.1% ARM mesh, +9.7% x86 random | **Accepted** | 2026-05-26 |
| EXP-008 | Cache `ffc_rounds_to_nearest()` in local var | x86 random | −1.2% x86 random (regression) | **Rejected** | 2026-05-26 |
| EXP-007 | Guard 4-digit SWAR with first-byte digit check | x86 random | −3.9% ARM mesh (regression) | **Rejected** | 2026-05-26 |
| EXP-006 | Local vars in `too_many_digits` path for GCC DSE | x86 canada | +2.2% x86 canada | **Accepted** | 2026-05-26 |
| EXP-005 | Static const options for compile-time format specialization | all | −11% x86 mesh (regression) | **Rejected** | 2026-05-26 |
| EXP-004 | `__builtin_expect` branch hints on 4 hot branches | all | −7.2% ARM canada (regression) | **Rejected** | 2026-05-26 |
| EXP-003 | Constant-format specialization via `ffc_from_chars_double` restructure | all | −5.7% mesh (regression) | **Rejected** | 2026-05-26 |
| EXP-002 | 2-digit SWAR + integer SWAR | all | −18% random (regression) | **Rejected** | 2026-05-26 |
| EXP-001 | 4-digit SWAR follow-up | canada, mesh | +29% canada, +18% mesh | **Accepted** | 2026-05-26 |

## Status Key

| Status | Meaning |
|--------|---------|
| **Accepted** | Benchmark + profile validated; change kept in `ffc/src/` |
| **Rejected** | No improvement or regression; change reverted |
| **Parked** | Real signal but blocked by prerequisite or < 2% threshold |
| **In Progress** | Active experiment |
