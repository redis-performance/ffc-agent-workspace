# EXP-068 — Exponent expression width

**Decision: Rejected.** A 32-bit unsigned magnitude regresses mesh, and a simpler
signed expression produces the same double benchmark instructions as EXP-067's
exponent variant. No new implementation is accepted; source is restored.

Same upstream pins, Apple M6, compiler and flags as [EXP-067](../EXP-067/README.md).
Two variants: native signed `10 * exp_number + digit`, and a separate `uint32_t`
magnitude accumulated before conversion into the existing signed exponent.
Native arithmetic is selected only under Apple/Clang/AArch64 guards.

## Correctness finding

The first unsigned version passed the signed result directly to `exponent`
but left `exp_number` as an unsigned magnitude. Long-mantissa rescanning also
uses `exp_number`, so negative exponents became wrong in that path. Existing
tests caught 24 failures. That version was never benchmarked; the failed test
log and `variants/unsigned32-incorrect-rescan.patch` are retained.

The corrected variant preserves signed `exp_number` and converts the magnitude
before the original sign handling. The clamp bounds the largest update to
`10 * (0x10000000 - 1) + 9 = 0x9fffffff`, which fits uint32_t. Both corrected
variants pass `make -C ffc test` before benchmarking.

`exponent-differential.c` additionally checks float and double outcomes, consumed
lengths and successful result bits across 15 mantissas, 28 exponents, four
exponent markers, four suffixes, five format policies and four rounding modes.
Baseline, signed64, unsigned32, and both EXP-069 variants each match:

```
checks=268800 fingerprint=5279b5f6dcd5e7e5
```

Compile once per applied patch with `clang -O3 -std=c99 -Iffc
experiments/EXP-068/exponent-differential.c -o <output>`, then execute. This is
targeted differential coverage, not an exhaustive floating-point sweep or proof
that the baseline is correct. Each run is recorded in `*-differential.log`.

## Benchmark

Five interleaved serial runs per build; both precisions and all three datasets.
Same timing methodology and limitations as EXP-067.

| Variant | Double random / canada / mesh | Float random / canada / mesh |
|---|---:|---:|
| signed64 | +4.49% / -0.08% / -0.43% | +1.49% / +0.02% / -0.99% |
| unsigned32 | +3.40% / +0.20% / -4.41% | +0.87% / -0.20% / -3.48% |

[Full MB/s and Mfloat/s table](benchmark-table.md); controls and spread are in
`summary.json`. The signed64 random signal repeats EXP-067, while the float mesh
median remains slightly negative. The 32-bit change makes both mesh cells worse.

The signed64 and EXP-067 exponent builds have identical instruction words in
double `findmax_ffc` (789 instructions); disassembly files are retained. This
equivalence is limited to that function/build, not every possible caller. The
corrected uint32 version has 790 instructions; narrowing the accumulator does
not inherently shrink or accelerate the whole parser.

## Profile

Five-second double scientific-input Time Profiler comparison, using the baseline
captured alongside EXP-069. Module `ffc-profile-double`: scanner self samples
40.92% → 36.97%, `ffc_compute_float` 17.30% → 21.55%, eight-digit helper
11.08% → 12.02%. Both runs observed 99.60% S-core samples. The signed64
double function is instruction-identical to EXP-067's profiled exponent variant.
These are relative time samples, not hardware counters. The reduced scanner
share on scientific input does not resolve either mesh regression.

## Reproduce

`python3 experiments/EXP-068/build-variants.py` builds the two corrected variants
and restores source. The deliberately incorrect patch is historical evidence
only. Build directories: `m6-exp-signed64` and `m6-exp-unsigned32`. Follow EXP-067's
benchmark/profile procedure, substituting `EXP=EXP-068`; regenerate the summary
with `python3 experiments/EXP-067/summarize.py experiments/EXP-068`.
