# PR #24: can ffc_loop_parse_if_eight_digits be made unconditional?

Reviewer asked to drop the `#if defined(__aarch64__) && defined(__clang__)` /
`#else` split (manual 2x-unroll vs plain while-loop) and use the unrolled version
everywhere, "to have fewer paths to maintain."

Test: A/B the **gated** (current) vs **unconditional** (unrolled for all) ffc.h.
ffc-only microbench, single-core pinned, best-of-11. Intel via gcc 11, ARM via clang 18.

## Verdict: REJECTED — unconditional regresses x86/GCC

uncond vs gated, throughput Δ:

| env | random | mesh | canada |
|-----|-------:|-----:|-------:|
| Cascade Lake (gcc)  | -4.9% | -7.7% | -4.6% |
| Ice Lake (gcc)      | -0.3% | -3.6% | -2.3% |
| Granite Rapids (gcc)| -0.8% | -7.0% | -4.5% |
| Graviton4 (clang)   | +0.4% | +0.2% | +0.1% |

x86/GCC: **median -4.5%, every cell down** (mesh worst, -7.7%). ARM/clang neutral
(it already used the unrolled path — confirms the test is sound).

Conclusion: the `#else` gate is **load-bearing, not stylistic**. GCC auto-unrolls
the plain `while` loop better than the hand-written 16-digit unroll; forcing the
manual unroll on GCC costs up to ~8% on short floats. The two paths exist because
the two compilers genuinely want different code. Keep the gate; reply to the
reviewer with the data.
