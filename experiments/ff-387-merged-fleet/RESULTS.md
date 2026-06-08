# fast_float main (8.2.7, #387 merged) vs pre-#387 baseline — full Intel fleet

Confirms the merged Lemire #387 (lazy-spans + `[[unlikely]]`) win across all 5
Intel lab generations. ffc... fast_float-only microbench (`from_chars`→double),
single-core pinned, best-of-11. Baseline = `6258cbc` (pre-#387 main); main =
`e0b53ea` (8.2.7). gcc 11.

Δ vs baseline (random / mesh / canada):

| Env | C++17 | C++20 |
|-----|-------|-------|
| Cascade Lake (clx1)   | +12.0 / +24.3 / +19.2% | +17.0 / +13.8 / +18.4% |
| Cascade Lake (clx2)   | +12.4 / +24.6 / +19.6% | +19.0 / +13.4 / +18.3% |
| Ice Lake (icx2)       | +13.4 / +23.8 / +18.3% | +8.2 / +11.9 / +15.3% |
| Emerald Rapids (spr)  | +55.6*/ +11.6 / +9.1%  | +12.8 / +18.5 / +22.4% |
| Granite Rapids (gnr1) | +12.8 / +4.2 / +10.7%  | +15.0 / +12.5 / +16.2% |

Median +13.4% (C++17) / +15.3% (C++20). *spr/C++17/random +55.6% is a shared-box
contention artifact (baseline read low); its C++20 random is a clean +12.8%.
Consistent with the earlier subset runs; completes coverage (clx2 + spr added).
