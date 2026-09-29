# EXP-071 — fast_float exponent peeling on Apple M6

**Decision: Parked; source restored.** Two-digit peeling improves scientific
input by about 2.3–2.5%, but float mesh is slightly lower. One-digit peeling
regresses both mesh cells. Neither patch meets the no-regression gate.

The user asked to investigate fast_float alongside ffc. This experiment changes
only fast_float, with upstream ffc as the control. Baseline: fast_float `9498cc3`,
ffc `965d4db`, benchmark `a856c09`, Apple M6, Apple Clang 21, `-mcpu=apple-m6`.
No ffc optimization is stacked into these comparisons.

## Architecture review

Current fast_float already has templated/inlined float and double APIs, native
`10 * accumulator + digit`, integer scan unrolling, 4-digit SWAR follow-up,
span-elision on the common path, and cold slow-path reparsing. The missing float
API inlining found in ffc does not transfer directly. The fraction-tail unroll
was also tested and rejected historically in EXP-054; it is not automatically
revived simply because ffc uses it.

Test one- and two-digit exponent peeling, assigning the already validated first
digit directly and leaving the original signed accumulator, clamp and fallback
loop intact. Apple/Clang/AArch64 guards bound this experiment; they do not prove
a gain on every Apple generation. The template retains its character type and
constexpr-compatible operations.

## Correctness and benchmark

Both candidates pass `COMPILER=clang JOBS=2 scripts/test-fast_float.sh` (15/15
tests, core plus supplemental, strict upstream warnings) before benchmarking.
The ffc control also passes `make -C ffc test`. No all-core exhaustive sweep.
Five interleaved serial runs per build, both precisions, three datasets and the
unchanged 100-repetition benchmark. Same timing caveats as EXP-067.

| Variant | Double random / canada / mesh | Float random / canada / mesh |
|---|---:|---:|
| peel1 | +1.78% / +0.49% / -1.25% | +1.39% / +0.06% / -2.06% |
| peel2 | +2.46% / +0.27% / +0.14% | +2.29% / +0.02% / -0.97% |

[Full MB/s and Mfloat/s table](benchmark-table.md). JSON includes the unchanged
ffc control and run spread. Only the first ASCII fast_float row is scored;
UTF-16 is retained in raw logs but is not pooled with ASCII throughput.

## Profile

Extended `scripts/run-profile.sh` with `PARSER=fast_float` (default remains ffc).
It verifies the selected parser's revision and source diff against build
provenance, compiles the same isolated full-input-checking driver, and records
the parser in artifact names/provenance. The Instruments summarizer accepts
the corresponding process prefix. Both parser paths were exercised successfully.

Five-second double scientific-input Time Profiler comparison, module
`fast_float-profile-double`:

| Self symbol | Baseline | Peel2 |
|---|---:|---:|
| parse_number_string_impl<false, false, char> | 33.37% | 31.37% |
| compute_float<binary_format<double>> | 17.25% | 18.66% |
| to_float<double> | 7.00% | 8.95% |

99.68% and 99.58% of samples, respectively, were on S cores. The scanner share
falls as intended, while conversion takes a greater share. These are time
samples, not hardware stall counters. The small float mesh decrease remains
unresolved; the profile does not turn it into an acceptable regression.

## Reproduce and next step

From the clean recorded baseline, `python3 experiments/EXP-071/build-variants.py`
builds `m6-fastfloat-peel1` and `m6-fastfloat-peel2`, runs correctness gates and
restores source. Follow EXP-067's benchmark procedure with `EXP=EXP-071`.
The shared summarizer stores both parsers in JSON; pass `fastfloat` as its second
argument to display that parser. For profiles, apply the chosen patch, set `PARSER=fast_float`,
select the matching build, and use the same fixed scientific corpus as EXP-067.

Before reviving this candidate, repeat the float mesh cell and inspect actual
generated code under matched layout conditions. Keep it separate from ffc's
float inlining. A broader M6 fast_float search should examine scanner/code-size
costs; no evidence here supports adding a new NEON path or changing defaults.
