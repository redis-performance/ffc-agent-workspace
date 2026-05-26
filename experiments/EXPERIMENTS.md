# Experiments Log — ffc.h Parsing Optimization

Append-only. Every experiment gets an entry — wins, rejections, and parks alike.
Knowing what didn't work is as valuable as knowing what did.

Use `approaches/TEMPLATE.md` to copy-paste the structure.

---

<!-- Append new experiments below in reverse-chronological order (newest first) -->

## EXP-001 — 4-digit SWAR follow-up in ffc_loop_parse_if_eight_digits

**Date**: 2026-05-26  
**Status**: ACCEPTED  
**ffc commit**: cf971fe

### Hypothesis

Numbers with 5–7 significant fractional digits (canada.txt, mesh.txt format) never trigger
the 8-digit SWAR loop in `ffc_loop_parse_if_eight_digits` because `pend - p < 8`. All
digits fall through to byte-by-byte iteration. The existing `ffc_parse_four_digits_unrolled`
and `ffc_is_made_of_four_digits_fast` functions in parse.h were dead code on the hot path.

A 4-digit SWAR follow-up after the 8-digit loop converts 7 byte-by-byte iterations into
1×SWAR-4 + 3 byte-by-byte for 7-digit fractions — roughly 43% fewer digit-scanning operations.
Also fixed a double-read of `ffc_read8_to_u64(*p)` in the 8-digit loop (read-once, use twice).

### Files changed

- `ffc/src/parse.h`: `ffc_loop_parse_if_eight_digits`

### Benchmark results

#### Laptop (developer machine — discovery runs only)

**Baseline** (20260526-161003):

| Dataset | ffc MB/s | fastfloat MB/s | gap |
|---------|----------|----------------|-----|
| random  | 2106     | 2452           | -14% |
| canada  | 1049     | 1480           | -29% |
| mesh    | 836      | 933            | -10% |

**EXP-001, run 1** (20260526-161706):

| Dataset | ffc MB/s | fastfloat MB/s | gap |
|---------|----------|----------------|-----|
| random  | 2081     | 2525           | -18% (noise) |
| canada  | 1354     | 1381           | -2% |
| mesh    | 988      | 1054           | -6% |

**EXP-001, run 2** (20260526-161732):

| Dataset | ffc MB/s | fastfloat MB/s | gap |
|---------|----------|----------------|-----|
| random  | 1977     | 2234           | -12% (noise) |
| canada  | 1676     | 1773           | -5% |
| mesh    | **1095** | **1036**       | **+5% (ffc wins!)** |

#### x86 metal — Intel Xeon Platinum 8488C (m7i.metal-24xl)

**Baseline** (20260526-154529, commit 531a6f2):

| Dataset | ffc MB/s | fastfloat MB/s | gap |
|---------|----------|----------------|-----|
| random  | 1772     | 2057           | -14% |
| canada  | 1299     | 1439           | -10% |
| mesh    | 1048     | 1218           | -14% |

**Post-EXP-001** (20260526-153854, commit cf971fe):

| Dataset | ffc MB/s | fastfloat MB/s | gap | Δ vs baseline |
|---------|----------|----------------|-----|---------------|
| random  | 1728     | 2020           | -14% | ±0% (noise) |
| canada  | 1412     | 1453           | -3%  | **+8.7%** |
| mesh    | 1073     | 1131           | -5%  | **+2.4%** |

#### ARM metal — Graviton4 (m8g.metal-24xl)

**Baseline** (20260526-154529, commit 531a6f2):

| Dataset | ffc MB/s | fastfloat MB/s | gap |
|---------|----------|----------------|-----|
| random  | 1616     | 1098           | **+47% (ffc leads)** |
| canada  | 1216     | 919            | **+32% (ffc leads)** |
| mesh    | 956      | 486            | **+97% (ffc leads)** |

**Post-EXP-001** (20260526-153854, commit cf971fe):

| Dataset | ffc MB/s | fastfloat MB/s | gap | Δ vs baseline |
|---------|----------|----------------|-----|---------------|
| random  | 1558     | 1088           | +43% | -4% (noise) |
| canada  | 1331     | 895            | +49% | **+9.5%** |
| mesh    | 1019     | 501            | +103% | **+6.5%** |

### Analysis

**x86**: EXP-001 closes the gap with fastfloat on canada (−14% → −3%) and mesh (−14% → −5%).
Random unaffected — those numbers have 14-17 fractional digits, 8-digit SWAR already fires.

**ARM**: ffc already led fastfloat across all datasets at baseline (likely due to Graviton4's
efficient barrel-shift and bitfield instructions that SWAR benefits from). EXP-001 extended the
lead further on canada (+9.5%) and mesh (+6.5%). Random shows slight noise-level regression
(−4%) from the extra 4-digit check on a path where it never triggers.

**Overall**: The 4-digit follow-up is a clear win on both architectures for structured float
inputs (canada, mesh). No meaningful regression on random.

### Token cost

N/A — experiment run inline (no ANTHROPIC_API_KEY; OAuth token not valid for API endpoint).
Analysis performed directly in Claude Code session. Benchmark results tracked in bench-results/.
