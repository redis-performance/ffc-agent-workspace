# [PARKED] ffc: SWAR the integer part (8-digit loop in the integer scan)

**Target:** ffc. Reverted; submodule stays at PR#24 tip `3314128`. Patch in
`integer-swar.patch`.

**Change:** the integer scan was 5-digit peel + byte-by-byte `while` for 6+
digits (only the fraction used the 8-digit SWAR). Added
`ffc_loop_parse_if_eight_digits(&p, pend, &i)` to the integer tail too.

**Correctness:** bit-identical to `3314128` over 1.5M values incl. 1–22 digit
integers + overflow-boundary edges; unit + supplemental pass; **full 2^32
exhaustive all-ok** (73.9s). Overflow during the fast scan is handled by the
existing too_many_digits re-scan.

**Benchmark (gcc, best-of-21 denoised), Δ new vs base:**
| dataset | clx1 | icx2 | gnr1 |
|---------|-----:|-----:|-----:|
| ints (12–18 digit) | +15.3% | +16.1% | +24.7% |
| random | -2.6% | +0.7% | +0.4% |
| mesh | +4.4% | +3.7% | -2.7% |
| canada | +4.1% | +3.8% | +0.4% |

**Decision: PARK.** Large, consistent **+18% on integer-heavy inputs** (a real
workload: JSON integers/IDs/timestamps, integer-valued RESP3 doubles) and clean
+4% canada — BUT the standard datasets show reproducible per-microarch
regressions (Cascade Lake random −2.6%, Granite Rapids mesh −2.7%): the inserted
call perturbs ffc_parse_number_string's codegen on the fraction-heavy path. Fails
the race's "no >1% regression on random/mesh/canada" bar.

**Revisit options:** (1) restructure so the short-integer peel's codegen is
untouched (e.g. gate the SWAR call) to kill the fraction regressions; (2) ship as
an integer-workload-targeted change/PR where the +18% justifies it. The harness
datasets are fraction-heavy and don't reward it as-is.
