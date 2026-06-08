# [REJECTED] ffc: mantissa-check before rounds_to_nearest probe in Clinger fast path

**Target:** ffc. Reverted; submodule stays at PR#24 tip `3314128`.

**Profile lead:** DWARF inlined-frame profile of ffc on `random` (icx2):
parse_number_string 60%, ffc_clinger_fast_path_impl **14.07%**, ffc_compute_float
8.45%. random's 17-digit mantissa always fails the fast-path mantissa check, so it
appeared to pay the volatile `ffc_rounds_to_nearest()` probe on a doomed attempt.

**Hypothesis:** test `mantissa <= MAX_MANTISSA_FAST_PATH` BEFORE the probe (safe:
MAX_MANTISSA[e] <= MAX_MANTISSA_FAST_PATH for all e, so a too-large mantissa can't
satisfy either Clinger branch) → random skips the probe.

**Correctness:** bit-identical to `3314128` over 2,000,011 values + fast-path
boundary edges (2^53, 2^53+1, 1e22/1e23, subnormals); unit + supplemental pass.
(Pure semantics-preserving reorder.)

**Benchmark (4 Intel gens, gcc, best-of-11), Δ new vs base:**
| env | random | mesh | canada |
|-----|-------:|-----:|-------:|
| Cascade Lake  | -3.1% | -3.9% | -0.3% |
| Ice Lake      | +1.8% | +2.8% | +3.5% |
| Emerald Rapids| +1.6% | -3.6% | -2.9% |
| Granite Rapids*| -0.3% | -2.0% | -1.0% |
| median        | +0.7% | **-2.8%** | -0.6% |

**Decision: REJECT.** random did NOT improve (median +0.7%, noisy) and mesh
**regressed −2.8%** (consistent). The probe is far cheaper than its 14% profile
attribution suggested — most of that 14% is the fast-path arithmetic + frame, not
the elidable volatile load. The restructured nesting also perturbed codegen on the
fast-path-taken case (mesh), causing the regression. (*gnr1 ran concurrently with
exhaustive — slightly noisy.)
