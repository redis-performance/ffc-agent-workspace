# Approach Summary — ffc.h

Single source of truth for all optimization attempt status.
Keep README.md counts in sync whenever this table changes.

| # | Title | Target | Δ MB/s (best dataset) | Status | Date |
|---|-------|--------|-----------------------|--------|------|
| EXP-035 | `ffc_acc10` inline asm: Clang/AArch64 smaddl→add+lsl | clang-arm | +2.3% Clang canada; −5.3% GCC canada; smaddl not primary bottleneck; wrapping forces sub onto accumulator critical path for GCC | **Rejected** | 2026-05-27 |
| EXP-034 | Compiler sweep: GCC 13 vs Clang 18 vs GCC `-mcpu=native` on ARM | all | GCC wins: Clang −28% (21% more instructions, lower IPC); `-mcpu=native` ≈ same as `-march=native`; corrected ARM baseline to 1927/1737/1727 MB/s | **Rejected** | 2026-05-27 |
| EXP-033 | Early exit for `exponent == 0` in `ffc_from_chars_advanced` | mesh | +12.9% mesh (83.92 i/f from 93.86), +1.1% canada, +0.4% random; EXP-030 FCMP elimination made adding pre-Clinger checks safe | **Accepted** | 2026-05-27 |
| EXP-032 | `sxtw` elimination via `__builtin_unreachable`/`ffc_digit_val` and Pattern C unsigned cast | mesh | i/f unchanged at 93.86 (sxtw persists in always_inline context; GCC RTL inserts sign-extend before VRP applies; Pattern C works in isolation but not inlined) | **Rejected** | 2026-05-27 |
| EXP-031 | `(uint32_t)` casts in digit scan to eliminate `and`/`sxtw` extension instructions | mesh | −0.3% mesh, +0.2% canada, +0.5% random (GCC substitutes `sxtw` for `and x0,x0,#0xff`; same i/f; ARM64 VRP cannot prove non-negativity through `ffc_is_integer` check) | **Rejected** | 2026-05-27 |
| EXP-030 | `FFC_ROUNDS_TO_NEAREST` compile-time macro eliminates 7-instruction FCMP chain | mesh, canada, random | +2.4% mesh, +1.8% canada, +0.8% random (i/f −7 on all datasets) | **Accepted** | 2026-05-27 |
| EXP-029 | Early mantissa guard in `ffc_rounds_to_nearest` to skip FCMP for large mantissa | canada | No change — GCC reordered integer check to after FCMP chain; assembly byte-for-byte identical to EXP-028 | **Rejected** | 2026-05-27 |
| EXP-028 | Extend integer nested-ifs to 5 levels (mesh 5-digit integer parts) | mesh | +7.9% mesh, +0.7% canada, +0.4% random (eliminates while-loop back-branch for 5-digit integer parts common in mesh 3D coordinates) | **Accepted** | 2026-05-27 |
| EXP-027 | Bit-shift mantissa check `!(mantissa >> 53)` vs `movz+cmp` | mesh | +2.8% mesh, −0.8% canada (cmp xzr, x1, lsr #53 removes movz pre-execution freedom; canada IPC 6.75→6.67) | **Rejected** | 2026-05-27 |
| EXP-026 | Straight-line integer scan: 4-level nested-ifs replace while loop for 1–4 digits | random, canada, mesh | +4.2% random, +7.4% canada, +2.0% mesh (all positive; no SWAR call overhead unlike EXP-018) | **Accepted** | 2026-05-27 |
| EXP-025 | Outer `pns.mantissa <= MAX_MANTISSA_FAST_PATH` guard before Clinger call in `ffc_from_chars_advanced` | random | +2.3% random, +0.9% canada, **−17.4% mesh** (3 new instructions before volatile load delay 16-cycle FCMP chain by ~3 cycles → +3.18 c/f; same root cause as EXP-021) | **Rejected** | 2026-05-27 |
| EXP-024 | Branchless sign detection `int neg = (*p == '-'); p += neg` | canada | −9.9% random, −8.9% canada, −14.2% mesh (cinc creates data dep on first digit ptr, kills speculative load) | **Rejected** | 2026-05-27 |
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
