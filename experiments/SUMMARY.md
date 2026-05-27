# Approach Summary — ffc.h

Single source of truth for all optimization attempt status.
Keep README.md counts in sync whenever this table changes.

| # | Title | Target | Δ MB/s (best dataset) | Status | Date |
|---|-------|--------|-----------------------|--------|------|
| EXP-023 | Branchless sign detection in `ffc_from_chars_advanced_impl` | canada | −13.2% random, −11.9% canada, −15.7% mesh (bitwise-OR forces full eval for unsigned floats) | **Rejected** | 2026-05-27 |
| EXP-022 | Hoist `ffc_b10_to_b2` before UMULH in `ffc_compute_float` | all | +0.9% random, −0.1% mesh (OOO already hides latency; i/f unchanged) | **Rejected** | 2026-05-27 |
| EXP-021 | Mantissa check before `ffc_rounds_to_nearest()` in Clinger | mesh | +2.5% random, −7.3% mesh (FCMP timing regression) | **Rejected** | 2026-05-27 |
| EXP-020 | AArch64 FPCR read in `ffc_rounds_to_nearest` (re-trial) | all | +1.0% random, −1.1% mesh (sub-threshold) | **Rejected** | 2026-05-27 |
| EXP-019 | Precomputed lookup table for ffc_b10_to_b2 | all | −5.3% mesh (cache aliasing), +0.7% random | **Rejected** | 2026-05-27 |
| EXP-018 | SWAR + nested-ifs for integer-part digit scanning | all | −13.3% mesh, −7.3% canada, −6.1% random (regression) | **Rejected** | 2026-05-27 |
| EXP-017 | Outline non-nearest Clinger else block as noinline | mesh | −2.9% mesh (regression, ARM64 ABI overhead) | **Rejected** | 2026-05-27 |
| EXP-016 | Hoist `ffc_rounds_to_nearest()` before digit scanning | canada | −0.5% canada (regression) | **Rejected** | 2026-05-27 |
| EXP-015 | Unroll fraction byte-by-byte tail (3 nested ifs) | canada, mesh | +3.9% ARM mesh, +2.1% ARM canada | **Accepted** | 2026-05-27 |
| EXP-014 | 2-digit SWAR follow-up in `ffc_loop_parse_if_eight_digits` | canada | −5.9% mesh (regression, i/f bloat) | **Rejected** | 2026-05-27 |
| EXP-013 | AArch64 FPCR direct read in `ffc_rounds_to_nearest` | random | +1.6% ARM random (all positive, sub-2%) | **Parked** | 2026-05-26 |
| EXP-012 | Combined exponent range check in Clinger fast path | mesh | +4.6% ARM mesh, +1.5% ARM random | **Accepted** | 2026-05-26 |
| EXP-011 | Remove `fraction_part_start` from `ffc_parsed` struct | all | −10.7% ARM mesh (regression) | **Rejected** | 2026-05-26 |
| EXP-010 | `ffc_cold` attribute on infnan/digit_comp | all | −13.7% ARM mesh (regression) | **Rejected** | 2026-05-26 |
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
