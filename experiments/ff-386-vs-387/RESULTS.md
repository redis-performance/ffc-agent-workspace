# fast_float #386 (cold) vs #387 (unlikely) — head-to-head

Lemire opened #387 as a "conceptually better" alternative to #386: both keep the
lazy-spans (`store_spans`) hot-path change, but #386 marks the slow-path
functions `noinline cold` while #387 marks the slow-path *branches*
`fastfloat_unlikely` (`[[unlikely]]` in C++20, `__builtin_expect` otherwise).

Method: fast_float-only self-timing microbench (`from_chars`→double), single-core
pinned, best-of-9. Baseline = `fastfloat/fast_float@main` (6258cbc). Built both
C++17 and C++20. Intel via gcc 11, Graviton4 via clang 18.

## Verdict: performance-equivalent
- #386 vs base: median **+11.8%** (range +6.4..+24.0%)
- #387 vs base: median **+13.4%** (range +6.2..+24.3%)
- **#387 vs #386: median +0.7%, mean +1.0%** — |Δ|<3% in **22/29** cells.

Neither approach consistently wins; differences are within run-to-run noise across
5 microarchitectures (Cascade Lake, Ice Lake, Emerald Rapids, Granite Rapids,
Graviton4), both compilers, both language standards. (One Emerald Rapids c++17
cell showed an impossible +106% spike — shared-box contention — excluded; that
box was re-run on an idle core, `logs/spr2.log`.)

Conclusion: #387's branch-hint mechanism matches #386's function-attribute
mechanism on speed, and is cleaner (no function-level noinline). Endorse #387;
close #386 in its favor.
