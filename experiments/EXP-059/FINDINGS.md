# EXP-059 — post-fix profiling: where's the next bottleneck?

canada (longest numbers, most parse work), base vs EXP-059 patch:
- ARM Graviton4: base IPC 5.09 -> patch 5.25; cycles 10.81B -> 10.35B (-4.3%);
  base hot loop = stp/ldp marshaling (~60%), eliminated in patch.
- clx1 Cascade Lake: cycles 20.21B -> 19.93B; instructions down. Win generalizes
  beyond mesh to canada.

NEW hot path after EXP-059 (patch annotate): the immutable findmax harness reduce
(iterator advance + fcmpe max) + the digit-scanning byte loop (ldrb / cmp<=9 /
x10-accumulate). The struct marshaling that dominated is GONE; the residual is
irreducible parse work (already SWAR-optimized: EXP-050/052/053) + harness overhead.

CONCLUSION: the parsed_number_string_t marshaling was THE remaining inefficiency on
the fast_float hot path; EXP-059 captures it portably across all tested Intel gens +
ARM. Further gains on this direction are diminishing. Next directions (future
iterations): (a) cross-pollinate the noinline-cold-marshaling idea into ffc; (b)
certified gnr1/spr quiet runs; (c) the subagent's alternative am-passing cold path
(marginal, cold-only).

# Does the EXP-059 marshaling technique apply to ffc? NO — ffc is already lean.

Profiled findmax_ffc on ARM Graviton4 mesh. Top self instructions are ALL real
parse/convert work: scvtf (int->float) 9.7%, ldrb (byte load), sub w,#0x30
(digit-'0'), cmp #0x2d (sign), cmp #0x9 (digit<=9), ldp (load std::string {ptr,len}
from the vector = harness). There is NO stp/ldp stack-spill of a parsed struct.

=> ffc does NOT materialize+spill a fat parsed_number_string-style struct on its hot
path. That is precisely WHY ffc was 2-3x faster than fast_float on ARM mesh to begin
with. EXP-059's noinline-cold-marshaling technique has nothing to elide in ffc.

CONCLUSION for the marshaling direction (Lemire #384): it is fast_float-specific.
fast_float HAD the inefficiency -> EXP-059 removes it in portable source (huge win,
closes the gap to ffc). ffc was already marshaling-free. The "cross-pollinate to ffc"
idea is therefore N/A. The direction is now thoroughly explored and concluded.

# Adversarial review (4-subagent workflow, 2026-06-03): HIGH confidence, zero must-fix

Independent review (equivalence / portability / adversarial-edge-cases + synthesis):
- EQUIVALENCE: airtight, bit-identical to upstream. Both risks formally cleared —
  (1) un-truncated mantissa on store_spans=false+>19digits is never read (caller
  checks too_many_digits and re-parses first); (2) am.power2<0 re-parse re-runs
  clinger but it's pure in (mantissa,exponent,negative,T) which store_spans doesn't
  change for !too_many_digits, so a failed clinger fails again; digit_comp reproduces
  upstream via re-materialized spans. answer.ptr/ec identical on all paths.
- ADVERSARIAL: full 2^32 float32 sweep base-vs-patch -> BYTE-IDENTICAL FNV hashes;
  200k boundary-weighted fuzz + >19-digit truncation triples all matched. No diverging
  input found.
- PORTABILITY: constexpr + __attribute__((noinline,cold)) compiles + static_asserts on
  g++ 13.3 and clang 18.1, validated against the real basictest.cpp constexpr suite
  (FASTFLOAT_CONSTEXPR_TESTS, ON in 4 CI jobs, routes >19-digit inputs through the cold
  helper at constant-eval). All 4 UC types + basic_json_fmt under strict -Werror clean.
  Runtime store_spans => no template bloat. MSVC follows __forceinline placement
  precedent; vs17-cxx20 CI is the backstop.

VERDICT: correct + portable as implemented; overall_confidence=high; must_fix=[],
should_fix=[]. Full result: review/adversarial-review-workflow-result.json.

# 4-gen Intel comparison — methodological finding: alignment sensitivity on GNR/EMR

Re-ran gnr1 (Granite Rapids) + spr (Emerald Rapids) at load 0.00 (quiet). The ffc
CONTROL (byte-identical code in base & patch binaries) STILL drifts a REPRODUCIBLE
+18% on gnr1 random (1808->2128, same as the prior "contended" run) and +11% on spr
random. Reproducible (not random) => NOT contention but CODE-ALIGNMENT sensitivity:
changing fast_float shifts ffc's hot code to a different address; on Granite/Emerald
Rapids that crosses an alignment/decode boundary (~18%). clx1 (Cascade Lake) and icx2
(Ice Lake) had FLAT controls => alignment-stable => trustworthy.

CONSEQUENCE: the two-binary interleave + ffc-control-sentinel method is only valid on
alignment-stable nodes. gnr1/spr fastfloat deltas (+15-22%) are confounded by the same
layout shift and cannot be cleanly attributed to EXP-059 with this method.

4-GENERATION INTEL COMPARISON (EXP-059, gcc, random/canada/mesh):
- Cascade Lake (clx1, Xeon 6248):   +18 / +18 / +22%   [control FLAT -> certified]
- Ice Lake     (icx2, Xeon 8360Y):  +19 / +17 / +17%   [control FLAT -> certified]
- Emerald Rapids (spr, Xeon 8592+): +16 / +18 / +18%   [control drifts +11% random -> alignment-confounded]
- Granite Rapids (gnr1, Xeon 6972P):+19 / +22 / +19%   [control drifts +18% random -> alignment-confounded]
+ ARM Graviton4: gcc +75/+73/+196%, clang +8/+8/+11%   [control FLAT -> certified]

VERDICT: EXP-059 wins on all 4 Intel gens directionally; CERTIFIED clean on Cascade
Lake + Ice Lake (+17-22%) and ARM. GNR/EMR positive but alignment-confounded (would
need alignment-robust measurement — e.g. per-function perf counters or LBR — to
certify, which the immutable two-binary benchmark harness doesn't support).
