# Upstream PR packaging validation

PR: https://github.com/kolemannix/ffc.h/pull/31
Head: ccaab79, base: 965d4db.

The user accepted the observed double regressions up to approximately 2% as an
opt-in tradeoff and authorized submission. EXP-070 is accepted for the disabled-
by-default option; the measurements and control limitations remain unchanged.

The parser-source diff is byte-identical to `float-inline-clang-on.patch`:
SHA256 6ceb8123f8d437e6f8f3f26a6c7977f08df859bf94abfc881ca636d7e8663372.
Only documentation and a `make test` separate-TU regression check were added to
the validated parser patch. The amalgam was regenerated, never edited directly.

Final lightweight local checks: `make test`,
`make -B test EXTRA_CFLAGS='-D_DEFAULT_SOURCE -DFFC_ENABLE_FLOAT_INLINING'`,
`CC=gcc CXX=g++ python3 test_src/test_float_linkage.py`, regenerated-header
byte comparison, and git diff whitespace check all passed. The linkage test was
also run against the earlier inline-keyword patch and correctly failed on the
missing exported float symbols; its expected-failure log is retained.

The parser change needs no new benchmark run: its exact source diff and upstream
base are the same ones measured on all three idle Linux runners and Apple M6.
No heavy workload ran locally, and no lab reservation was reopened for packaging.
