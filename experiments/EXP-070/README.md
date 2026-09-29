# EXP-070 — ffc float API inlining on Apple M6

**Linux validation completed 2026-09-29:** correctness/linkage passed on Intel, AMD and ARM; float improved on every dataset. Small x86 double decreases reproduced, and the M6 decrease remains unresolved. **Still parked.** See [full Linux evidence](lab/LINUX-VALIDATION.md).

For an x86 lab run, use a fresh checkout of branch
`exp/apple-m6-float-inlining-20260929`, initialize its pinned submodules, then:

```sh
python3 experiments/EXP-070/run-lab.py
```

The runner uses **Clang**, `-march=native`, two build jobs and seven interleaved
baseline/candidate rounds. It applies the final patch locally, tests both
configurations, benchmarks float and double on all three datasets, collects
Linux perf profiles of float/double mesh, summarizes results, and restores ffc
source afterward. Logs go to `experiments/EXP-070/lab/<host>-<timestamp>/`.
No candidate commit in an external fork is needed; the exact patch is in this
workspace. The fast_float source is held fixed as the control.

Prerequisites: Clang/Clang++, GCC (ffc's syntax check), make, CMake >=3.15,
Python >=3.10, Git, `shasum`, Linux `perf`, and sudo access for perf. CMake fetches
the pinned build/test dependencies on first use. `ARCH_FLAGS` and `JOBS` override
the compiler target and build parallelism. `--dry-run` checks source pins and
prerequisites; `--runs` and `--profile-seconds` control measurement length. Run
on an otherwise idle lab runner and retain CPU/core placement with the results.
The prototype's option is Clang-only; a GCC run would not test the optimization.

The complete runner was smoke-tested locally with one benchmark round and
one-second profiles (`lab/mac-workflow-smoke/`): builds, regular/supplemental
tests, C/C++ linkage, both benchmark precisions, all four profiles, summary
generation and source restoration passed. That single round validates the
workflow only; it does not replace the seven-round M6 result or establish x86
performance. The Linux perf path is left for the lab run.

For example, after cloning this workspace branch:

```sh
git submodule sync --recursive
git submodule update --init --recursive
python3 experiments/EXP-070/run-lab.py --dry-run
python3 experiments/EXP-070/run-lab.py
```

**Decision: Parked, partial win.** The final candidate improves all three float
datasets by 14–35%, but double mesh decreases 1.61%. The workspace's
no-regression requirement therefore prevents acceptance. Both parser checkouts
remain at their upstream sources. The opt-in implementation is a saved patch,
not an installed feature or changed default.

## Finding and candidate evolution

Double has forced-inline API declarations and definitions; float does not.
Baseline double `findmax_ffc` contains 800 instructions, while float is a
53-instruction wrapper calling `ffc_from_chars_float_options` for each value.
Allowing the float call to specialize in its caller produces a 761-instruction
function and removes the generic options call from its hot loop.

The first trial copied double's `extern FFC_IMPL_INLINE` pattern to both float
APIs. It passed parser tests and showed large float gains, but a separate
translation-unit test exposed missing float symbols when the implementation
was compiled as C++. The C implementation linked successfully. This initial
patch and the first opt-in form are **not safe candidates**; see
`inline-keyword-linkage-failure.log`.

The final patch is [variants/float-inline-clang-on.patch](variants/float-inline-clang-on.patch).
It adds `FFC_ENABLE_FLOAT_INLINING`, disabled by default, and applies Clang's
`always_inline` attribute without the C++ `inline` keyword when both it and
`FFC_IMPL` are defined. Float APIs retain external symbols. Other compilers and
non-implementation translation units retain ordinary declarations. This was initially
tested on Apple Clang 21/M6; the Linux follow-up above extends validation to
Clang 18 on Intel/AMD/ARM and GCC 13 compatibility, with the stated regression limits.

## Correctness

All benchmarked variants passed `make -C ffc test` first (including 274,944
format checks). The final enabled and disabled configurations also pass:

- Separate implementation/caller translation units in all four C99/C++17
  language combinations, testing both float entry points.
- The supplemental corpus.
- 268,800 differential checks each, including four rounding modes, float and
  double, long mantissas and extreme/malformed exponents; both match baseline
  fingerprint `5279b5f6dcd5e7e5`.

No full exhaustive sweep. `check-linkage.py`, the validation logs, and the
shared EXP-068 differential source make the additional checks reproducible.

## Benchmark

Apple M6, Apple Clang 21; ffc `965d4db`, fast_float `9498cc3`, harness `a856c09`.
All use `-mcpu=apple-m6 -O3 -DFFC_ROUNDS_TO_NEAREST`; the final enabled build adds
`-DFFC_ENABLE_FLOAT_INLINING`. No exponent changes are stacked.

Discovery: five interleaved runs per build of the initial inline-keyword patch.
Confirmation: seven new rounds of upstream, final option disabled, and final
option enabled. All three datasets and both precisions; serial runs and the
unchanged 100-repetition harness. Same timing/units limitations as EXP-067.

| Candidate | Double random / canada / mesh | Float random / canada / mesh |
|---|---:|---:|
| initial inline-keyword trial | +1.72% / -0.09% / -1.04% | +17.79% / +14.17% / +34.30% |
| final Clang attribute, enabled | +1.88% / +0.81% / -1.61% | +17.87% / +14.43% / +35.37% |
| final option disabled | +1.00% / -0.20% / +0.27% | +0.88% / +0.32% / +2.19% |

[Discovery MB/s and Mfloat/s](benchmark-table.md),
[confirmation MB/s and Mfloat/s](confirmation/benchmark-table.md), and JSON
summaries contain all values, controls and min/max across runs. Only the first
ASCII fast_float row is scored as the control.

The disabled parser functions have exactly the same instruction words as
upstream in **both** benchmark precisions. Their measured variation illustrates
why small changes must be treated cautiously. Nevertheless, the enabled
double-mesh decrease repeats the initial trial and exceeds its fast_float
control decrease (-0.16%), so it is not dismissed as noise. Enabling the option
also changes emitted float function sizes/layout in the double benchmark binary.
Layout is a hypothesis for the regression; no hardware cause is established.

## Profile

Five-second Instruments Time Profiler runs through `scripts/run-profile.sh`,
same build flags, mesh and a fixed scientific corpus. Float mesh, module
`ffc-profile-float`: scanner self share 43.44% → 46.95%, conversion
`ffc_compute_float` 11.42% → 14.02%. The baseline generic
`ffc_from_chars_float_options` is a prominent 11.96% self symbol; with inlining
it is no longer among the top 15 self symbols. The disassembly independently
confirms removal of its per-value out-of-line call. The remaining bottleneck
is scanning/conversion. Both profiles observed >99.5% S-core samples.

On scientific float input, scanner share is 38.29% → 38.38% and conversion
16.40% → 15.28%. Percentages are relative time samples, not absolute cycle
savings or hardware stall counters. The profile driver includes a full-input
check, unlike the benchmark, and is evidence about attribution rather than a
replacement throughput measurement.

Double mesh remains scanner-dominated: 57.91% → 59.01% scanner self samples,
module `ffc-profile-double`, with >99.5% S-core samples. See the baseline and
`inline-on-retry` reports. One earlier invocation completed trace export but returned an error
after its shell script was edited while running. Its log is retained as a
failed invocation; the stable-script rerun is used for comparison.

## Reproduce / next action

From a clean recorded baseline, `python3 experiments/EXP-070/build-optin.py`
builds the final disabled and enabled variants, runs parser tests and restores
sources. Builds are `m6-float-inline-clang-off` and `m6-float-inline-clang-on`.
`build-variants.py` reproduces the historical unsafe inline-keyword trial only.
Do not use that earlier patch for integration.

Apply the final patch, force amalgamation (`make -B -C ffc ffc.h`), and run
`check-linkage.py off` and `check-linkage.py on` for linkage coverage. Follow
EXP-067's benchmark/profile procedure, using `EXP=EXP-070/confirmation` to keep
final measurements separate and restoring source afterward.

The next focused experiment should retain float specialization while examining
why emitting the new float wrappers perturbs double mesh. Keep correctness and
external linkage checks in that loop. A default rollout or a broader Apple/ARM
claim is not supported by this experiment.
