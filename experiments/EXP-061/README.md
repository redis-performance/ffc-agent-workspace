# EXP-061 — [fast_float] exponent-digit loop do-while — REJECTED

Branch: `exp062-expdo` -> actually `exp061-expdo` (fast_float submodule), unmerged.
Verdict: consistent -1.5..-2.3% GCC regression on icx2/clx1 (flat ffc-control sentinel),
clang neutral; gnr1 gcc-mesh +10.7% outlier is a layout artifact (ctrl moved, no mechanism).
See EXPERIMENTS.md entry. Raw interleaves in bench-results/ (format:
`cc dataset round side ff=<canonical fastfloat MB/s> ffc=<control MB/s>`).
The `*-UNRELIABLE.txt` local file is kept as evidence of the co-compilation layout confound
(control swung +/-7.5% between base/patch builds locally).
