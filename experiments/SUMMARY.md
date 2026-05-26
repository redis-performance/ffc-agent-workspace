# Approach Summary — ffc.h

Single source of truth for all optimization attempt status.
Keep README.md counts in sync whenever this table changes.

| # | Title | Target | Δ MB/s (best dataset) | Status | Date |
|---|-------|--------|-----------------------|--------|------|
| EXP-001 | 4-digit SWAR follow-up | canada, mesh | +29% canada, +18% mesh | **Accepted** | 2026-05-26 |

## Status Key

| Status | Meaning |
|--------|---------|
| **Accepted** | Benchmark + profile validated; change kept in `ffc/src/` |
| **Rejected** | No improvement or regression; change reverted |
| **Parked** | Real signal but blocked by prerequisite or < 2% threshold |
| **In Progress** | Active experiment |
