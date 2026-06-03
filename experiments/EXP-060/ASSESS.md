# EXP-060 — ffc Intel headroom assessment (4 runners, ffc-only microbench TMA)

ffc-only microbench (ffc_tma.cpp: ffc_from_chars_double in a loop), race-tip ffc.h
(perf/force-inline-ffc-impl @ 88eeecd, incl vk fix), perf -M TopdownL1 + annotate.

TMA (representative, icx2/gnr Ice Lake/Granite):
- mesh:   backend 2.2%, FRONTEND 19.2%, badspec 5.3%, retiring 73.3%
- canada: backend 5.7%, frontend 11.3%, badspec 5.7%, retiring 77.3%

Hot instrs:
- mesh:   vdivsd (Clinger mantissa/10^k) ~12% [INHERENT — fast_float divides too],
          + branches (jbe/jne/cmp), power-of-ten table load, digit sub $0x30.
          (vaddsd ~9% is the microbench's `sink += d` accumulator — measurement artifact.)
- canada: SWAR imul ($0x640001 parse_4_digits, $0x5f5e100 = 1e8 combine), mulx (UMULH
          Eisel-Lemire), pow5 table loads (vmovss FFC_POWERS_OF_FIVE), branches. 77% retiring.

ASSESSMENT:
1. canada is ~77% retiring (efficient real work: SWAR + Eisel-Lemire) — little headroom.
2. mesh is 19% FRONTEND-bound — high. ffc force-inlines aggressively (ffc_inline =
   always_inline on positive/negative_digit_comp; from_chars_double force-inlined). The
   cold bigint slow path inlined into the hot frame bloats icache/decode.
3. The Clinger division is inherent (not an ffc-vs-fast_float gap).

HYPOTHESIS (the EXP-059 lever, applied to ffc): mark the cold slow path (ffc_digit_comp +
the bigint workers) noinline+cold so it's emitted out of line, shrinking the hot
from_chars_double -> reduce mesh frontend-bound -> faster. Test base-vs-patch on the 4 runners.

## RESULT: noinline-cold slow path → REJECTED (regresses ffc)

Marked ffc_digit_comp noinline+cold (the EXP-059 lever). Self-timed ffc-only
microbench, best-of-7, pinned, 4 Intel runners:
  mesh:   Ice Lake -14.7%, (Emerald/Granite) -19.4%, Cascade -6.0%  (ALL SLOWER)
  canada: -1 to -3% (slower)
ffc PATCH mesh frontend-bound only nudged 19.2% -> 18.0% (retiring 73.3->74.0) — a
tiny FE win swamped by a large overall regression.

WHY (the asymmetry with EXP-059): fast_float force-inlined its slow path at THREE call
sites (always_inline scanner) — de-inlining removed real hot-frame bloat (+8..196%).
ffc has the slow path as a SINGLE `static` ffc_digit_comp call the compiler already
lays out well; forcing noinline+cold pessimizes codegen/layout around the hot Clinger
path (mesh, which never even calls digit_comp, regresses 15-19% — a layout/opt effect).

CONCLUSION: the noinline-cold technique is fast_float-specific. ffc is at its tuned
ceiling on this lever. ffc's ~19% mesh frontend-bound is a side effect of its aggressive
force-inlining, which is NET-POSITIVE (de-inlining is worse). No ffc change to keep.
The Clinger division (mesh ~12%) is inherent to correctly-rounded parsing (fast_float
divides identically). REVERTED.
