# EXP-069 — Peel validated exponent digits

**Decision: Parked as a direction; neither patch accepted.** Scientific input
improves in both precisions, but the mesh regressions repeat. Restore upstream
parser sources and keep the patches for future layout experiments.

Same Apple M6, Apple Clang 21, upstream pins and `-mcpu=apple-m6` flags as
[EXP-067](../EXP-067/README.md). The first exponent digit is already validated
before entering the accumulation loop. Assign it directly to avoid multiplying
zero; optionally consume a second digit using native arithmetic. Keep the
original clamped loop for further digits and preserve signed exponent handling.
Both patches use Apple/Clang/AArch64 guards.

## Correctness

Both variants pass `make -C ffc test` before measurement, including 274,944
format checks. Each also matches the baseline across the 268,800 targeted
differential checks described in [EXP-068](../EXP-068/README.md), covering
float/double, four rounding modes, malformed exponents and long mantissas.
No full exhaustive sweep was run because neither change is accepted.

## Benchmark

Discovery: five interleaved serial runs per build, both precisions, all three
datasets, unchanged 100-repetition harness. Confirmation: seven new interleaved
runs per build, kept separately rather than pooling away the original result.
Same timing/units limitations as EXP-067.

| Cohort / variant | Double random / canada / mesh | Float random / canada / mesh |
|---|---:|---:|
| discovery / peel1 | +5.55% / -0.04% / -1.52% | +4.19% / -0.16% / +0.25% |
| discovery / peel2 | +6.23% / -0.12% / +0.36% | +4.40% / -0.07% / -1.49% |
| confirmation / peel1 | +6.76% / -0.04% / -2.15% | +4.04% / -0.21% / -1.01% |
| confirmation / peel2 | +6.71% / -0.13% / +1.62% | +3.38% / +0.27% / -3.82% |

Full MB/s and Mfloat/s: [discovery](benchmark-table.md) and
[confirmation](confirmation/benchmark-table.md). Raw logs and JSON summaries
retain the unchanged ASCII fast_float control and observed spread. Mesh has
substantial variance, but repeated decreases prevent a no-regression claim.

## Profile and next finding

Five-second Time Profiler runs, module `ffc-profile-double`, fixed scientific
corpus generated as in EXP-067:

| Self symbol | Baseline | Peel1 | Peel2 |
|---|---:|---:|---:|
| ffc_parse_number_string | 40.92% | 39.48% | 36.51% |
| ffc_compute_float | 17.30% | 20.81% | 22.16% |
| ffc_loop_parse_if_eight_digits | 11.08% | 10.20% | 14.50% |

The scanner share falls while conversion/helper shares grow, consistent with
the intended direction. This does not establish absolute cycles or a particular
hardware stall. All three profiles observed >99.5% S-core samples.

Float mesh, module `ffc-profile-float`: scanner 45.35% → 42.95%,
`ffc_compute_float` 10.69% → 10.65%, and `ffc_from_chars_float_options`
10.33% → 10.17% (baseline → peel2). Both >99.6% S-core samples. No new dominant
symbol explains the mesh regression. Mesh contains no explicit exponents;
code layout and register allocation remain hypotheses, not diagnosed causes.

Disassembly exposes a separate, actionable asymmetry: double `findmax_ffc`
contains the parser (800 instructions at baseline), while float `findmax_ffc`
is a 53-instruction wrapper calling `ffc_from_chars_float_options`. The float
API lacks the forced-inline declarations/definitions used by double. This is
tested separately in EXP-070, without stacking exponent peeling.

## Reproduce

`python3 experiments/EXP-069/build-variants.py` builds `m6-peel1` and `m6-peel2`
and restores source. Follow EXP-067's benchmark/profile procedure using
`EXP=EXP-069`, or `EXP=EXP-069/confirmation` for a separate cohort. Regenerate
the JSON with `experiments/EXP-067/summarize.py` and the corresponding experiment
directory. Raw assembly and instruction counts are in this directory.
