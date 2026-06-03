# PR #24 merge validation — exhaustive correctness

Validates the merge of upstream `b1894aa` (PR #23, 4-digit SWAR follow-up) into
ffc PR #24 branch `perf/force-inline-ffc-impl` (merge commit `3314128`).

The conflict in `ffc_loop_parse_if_eight_digits` was resolved by keeping **both**
the Clang/AArch64 2× (16-digit) unroll and upstream's new 4-digit follow-up block.
Two distinct code paths therefore needed exhaustive coverage:

- x86 takes the `#else` plain-loop path (the 2× unroll is `__aarch64__ && __clang__`-gated)
- AArch64+Clang takes the 2× unroll path

## Result — full 2^32 binary32 exhaustive, all nodes `all ok`, exit 0

| Node | Gen | Cores | Compiler | Path | Result |
|------|-----|-------|----------|------|--------|
| clx1 | Cascade Lake | 80 | gcc 11 | x86 `#else` + 4-digit | all ok |
| icx2 | Ice Lake | 144 | gcc 11 | x86 `#else` + 4-digit | all ok |
| spr | Emerald Rapids | 256 | gcc 11 | x86 `#else` + 4-digit | all ok |
| gnr1 | Granite Rapids | 384 | gcc 11 | x86 `#else` + 4-digit | all ok |
| Graviton4 | ARM | 96 | clang 18.1.3 | **AArch64 2× unroll** + 4-digit | all ok (135.95s) |

Logs in `exhaustive-logs/`. Intel fleet reached non-interactively via
`scripts/intelx.sh`; ARM via `~/.ssh/benchmarksredislabsus-east-1.pem`.
