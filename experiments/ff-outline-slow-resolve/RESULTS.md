# [ACCEPTED] ffc: out-of-line the rare disambiguation on GCC

**Target:** ffc. Branch `perf/outline-slow-resolve` off PR#24 tip `3314128`
(kept separate from #24, which is under review). Standalone PR candidate.

**Origin:** 7-subagent investigation (workflow) of the "frontend-bound / isolate
the proven-rare slow path" question. 6/7 agents said dead-end (the slow path is
already out-of-line; EXP-060 territory). The dissenting Agent 6 (fast_float
cross-reference) found the real lever: ffc force-inlines the RARE post-fast-path
disambiguation into every from_chars instantiation, whereas fast_float hoists it
into a non-inlined parse_number_slow_path.

**Change:** hoist the too_many_digits recompute (2nd compute_float + compute_error)
and the power2<0 big-integer compare into a non-inlined `ffc_resolve_slow`. A
pre-bench `nm` gate distinguished this from EXP-060: GCC `from_chars_double`
shrinks **4320 -> 3395 B (-21%)** (real byte removal), where EXP-060 removed 0
bytes (it annotated already-out-of-line code).

**Gated to GCC** (`#if defined(__GNUC__) && !defined(__clang__)`): Clang inlines
differently — outlining regressed Clang/AArch64 ~1-3% — so Clang/MSVC keep the
original inline form, byte-identical to baseline.

**Correctness:** bit-identical to `3314128` over 2,000,010 values (incl. 1-28
digit mantissas exercising too_many_digits, e-notation, round-to-even edges),
under BOTH gcc and clang; unit + supplemental pass; full 2^32 exhaustive all-ok.

**Benchmark (best-of-15, clean sequential):**
| toolchain | random | mesh | canada |
|-----------|-------:|-----:|-------:|
| Cascade Lake / GCC | +4.3% | +15.1% | +9.5% |
| Ice Lake / GCC     | +3.0% | +6.6%  | +9.4% |
| Emerald Rapids / GCC (initial) | +14.1% | +1.0% | +2.6% |
| Granite Rapids / GCC (initial) | +1.2% | +0.2% | +4.1% |
| Cascade Lake / Clang | +0.0% | -0.0% | -0.0% (baseline) |
| Graviton4 / Clang    | +9.0%* | +0.6% | +0.0% (baseline) |

TMA: icx2 mesh frontend-bound 13.3% -> 10.9%. *ARM Clang random +9% is clang-side
variance (clang uses the unchanged baseline form); no regression on any cell.

**Decision: ACCEPT.** Clean GCC win (+3-15%, all gcc cells positive, no
regressions), Clang exactly neutral. Portable, paper-grounded (Mushtak-Lemire),
cross-pollinated from fast_float. Strong standalone ffc PR candidate — and the
inverse (ffc already hoists; this confirms the design) means nothing to port back.

## UPDATE — main-baseline re-measurement (PR base reality check)

Re-measured against bare `kolemannix/main` (b1894aa) on branch
`perf/outline-slow-resolve-clean` (the would-be standalone PR base). Hot frame
ffc_from_chars_double_options shrinks 4365->3305 B (-24%); bit-identical
(gcc+clang) + exhaustive all-ok. BUT throughput (best-of-25, gcc):
  Cascade Lake: random +3.6%  mesh +4.7%  canada -2.9%
  Ice Lake:     random +5.0%  mesh +7.7%  canada -2.9%
  Clang (x86/ARM): exactly neutral.

So vs BARE MAIN it REGRESSES canada -2.9% (consistent, not noise) — fails the
no-regression bar. It is a CLEAN win only STACKED ON #24 (whose exp==0 early-exit
makes canada exit before the restructured code, so the perturbation never hits
canada there: on the #24 branch canada was +9%). Standalone PR therefore HELD.

STATUS: accepted-on-#24-branch (perf/outline-slow-resolve @ ead51af), but NOT a
clean standalone vs main. Open only after #24 lands (rebase on new main), or fix
the canada fast-path codegen perturbation first.
