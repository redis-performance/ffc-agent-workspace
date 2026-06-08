# [PARKED] fast_float FASTFLOAT_ASSUME_ROUNDS_TO_NEAREST

**Target:** fast_float. **Branch:** `exp/assume-rounds-nearest` off `upstream/main`
(`e0b53ea`, 8.2.7), commit `e00a790`. NOT merged.

**Hypothesis:** a compile-time `FASTFLOAT_ASSUME_ROUNDS_TO_NEAREST` folding
`rounds_to_nearest()` to `true` elides the volatile-FCMP probe on the Clinger
fast path → faster on fast-path inputs. (Cross-pollination of ffc's accepted
EXP-030 `FFC_ROUNDS_TO_NEAREST`.)

**Correctness:** default build is `#ifdef`-guarded → byte-identical, all tests
pass. Macro-on: bit-identical to default over 200,011 values in the round-to-
nearest env. (basictest.cpp's `fesetround(FE_UPWARD/DOWNWARD)` test would fail
with the macro on — that's the documented contract: don't define it if you change
the rounding mode.)

**Benchmark (ffc microbench, 4 Intel gens, gcc, c++17+c++20, best-of-11), Δ on:**
| dataset | C++17 median | C++20 median |
|---------|-------------:|-------------:|
| random | +4.5% (noisy*) | −1.0% |
| mesh | +2.7% | +2.6% |
| canada | +1.7% | +1.4% |

*C++17 random inflated by spr/clx1 contention outliers; C++20 random is −1%.

**Decision: PARK.** Real but marginal. random uses Eisel-Lemire (mantissa >
max_mantissa_fast_path), not the Clinger fast path, so there's no probe to elide
there — only mesh/canada (fast-path) see ~+1.5–2.6%, with per-cell noise (incl.
icx2 mesh −2.6%). Below the clean accept bar (≥+2% AND no >1% regression AND
stable). The probe is too cheap relative to digit scanning to matter much.

**If revisited:** zero-risk opt-in; could still be an upstream PR for parity with
ffc (embedders who control their fenv), but not on benchmark merit alone.
