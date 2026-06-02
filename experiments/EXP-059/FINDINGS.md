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
