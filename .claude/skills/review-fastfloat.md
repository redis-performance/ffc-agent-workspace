# Skill: review-fastfloat

Review a `fast_float` change for **upstream merge-readiness** against
`fastfloat/fast_float` (maintainer: Daniel Lemire, `@lemire`) before proposing it.
Purpose: maximize the likelihood Lemire merges it on the first pass by pre-clearing
every gate his CI and review style enforce.

Use this on any diff in `fast_float/include/fast_float/*.h` (e.g. the race wins
EXP-050/052/053) before drafting a PR. It is a checklist + a set of runnable gates,
distilled from fast_float's CI config and its last ~25 merged PRs (see Evidence).

---

## How to run it

Given a change in the `fast_float/` submodule working tree (or a commit):

1. Print the diff under review (`git -C fast_float show <sha>` or `git -C fast_float diff`).
2. Walk every checklist item below; mark ✅/⚠️/❌ with a one-line reason.
3. Run the **gates** (format, C++11, endianness build, full + exhaustive tests,
   benchmark) — these are pass/fail, not opinions.
4. Emit the verdict block. Only call a change "merge-ready" when all gates pass and
   no ❌ remains.

---

## Merge-readiness checklist

### 1. Format gate (hard CI fail if violated)
- CI runs **clang-format version 17** (`jidicula/clang-format-action`,
  `lint_and_format_check.yml`). Style = `.clang-format`: `BasedOnStyle: LLVM`,
  `SortIncludes: false`, `SeparateDefinitionBlocks: Always`, `MaxEmptyLinesToKeep: 1`.
- Run it and diff-check:
  ```bash
  clang-format-17 -style=file -i fast_float/include/fast_float/<changed>.h
  git -C fast_float diff --exit-code   # must be empty
  ```
  If `clang-format-17` isn't installed, use the repo's `script/run-clangcldocker.sh`
  or note that formatting was NOT verified (a likely first-round bounce).

### 2. C++11 floor (hard fail — headers must compile as C++11)
- The library targets `cxx_std_11` (`CMakeLists.txt`: `FASTFLOAT_CXX_STANDARD 11`,
  `target_compile_features(fast_float INTERFACE cxx_std_11)`).
- **No C++14/17/20-only constructs in `include/`.** No `if constexpr` (use
  `FASTFLOAT_IF_CONSTEXPR17`), no C++14 relaxed `constexpr` (use the
  `FASTFLOAT_CONSTEXPR14` / `FASTFLOAT_CONSTEXPR20` macros), no `std::bit_cast`,
  no structured-binding-only paths in C++11 code, no `<concepts>`/`<bit>`.
- `constexpr` evaluation paths are guarded by `cpp20_and_in_constexpr()`; don't add
  runtime-only constructs that break the constexpr branch.

### 3. Endianness — big-endian / s390x (Lemire tests this personally)
- CI includes `s390x.yml` (**big-endian**) and `risc.yml`. Lemire has explicitly
  blocked merges on getting s390x green (PR #359 thread).
- Any multi-byte read MUST go through `read8_to_u64` / `read4_to_u32` (they
  `byteswap` under `FASTFLOAT_IS_BIG_ENDIAN`). SWAR masks (`0x30303030...`) are only
  valid AFTER that little-endian-normalizing read.
- ❌ Flag any raw `memcpy`/`reinterpret_cast` of 2/4/8 bytes that bypasses the
  endian-aware readers, or any byte-order assumption.
- Pure byte-by-byte digit scans (e.g. EXP-050's nested-ifs: `*p - UC('0')`) are
  endian-agnostic → ✅.

### 4. Warning-clean across the full matrix (CI uses -Werror)
- Tests compile with: `-Werror -Wall -Wextra -Weffc++ -Wsign-compare -Wshadow
  -Wwrite-strings -Wpointer-arith -Winit-self -Wconversion -Wsign-conversion`
  (`tests/CMakeLists.txt`), plus MSVC `/permissive-` and `/EHsc`.
- CI matrix: ubuntu22/24, gcc12, clang, **cxx20**, **sanitizers** (`ubuntu22-sanitize`),
  alpine, emscripten, msys2(±clang), VS17 (x64/arm/clang/cxx20).
- Common bounce causes seen upstream: `-Wconversion`/`-Wsign-conversion` on
  int→uint casts (cast explicitly, mirror existing `uint64_t(*p - UC('0'))`),
  MSVC C4702 "unreachable code" (PR #368), `/permissive-` propagation (PR #365),
  UB under sanitizers (PR #353), `-Wshadow` from reused local names.

### 5. Templated `UC` correctness (char / char16_t / char32_t / wchar_t)
- Hot functions (`parse_number_string`, `loop_parse_if_eight_digits`) are
  `template <typename UC>`. A change must hold for all char widths, the SIMD
  (`char16_t`) path, AND the constexpr path. Confirm `wide_char_test` passes.
- Watch `has_simd_opt<UC>()` branches and the `char`-specialized overloads — a
  `char`-only optimization must not silently change the templated overload's
  behavior.

### 6. Behavior preserved across formats
- `from_chars` defaults to `chars_format::general`; also honor `scientific`/`fixed`/
  `hex`, `basic_json_fmt`, `skip_white_space`, `allow_leading_plus`, `no_infnan`.
  A digit-scan change must not alter parsing for any of these (the JSON path has
  extra leading-zero / no-digits diagnostics).

### 7. Correctness gates (must pass; add tests for new behavior)
```bash
scripts/test-fast_float.sh               # core unit + supplemental corpus (14 tests)
EXHAUSTIVE=1 scripts/test-fast_float.sh  # REQUIRED for mantissa/digit/round changes
```
- For anything touching the digit/mantissa/round path, run exhaustive
  (`-DFASTFLOAT_EXHAUSTIVE=ON`: `exhaustive32`, `exhaustive32_64`, `random64`).
- New observable behavior → add edge-case tests to `tests/basictest.cpp` and
  reference the issue (`Resolves #NNN`). Tests-only PRs are welcome (PR #366).

### 8. Optimization PRs need evidence (this is how Lemire evaluates speed)
- Provide **before/after benchmark numbers** in the PR body, on a named CPU +
  compiler, in fast_float's units: GB/s, Mfloat/s (or Mip/s), ns, **c/f, i/f, i/c**
  (cycles/instructions per float — he reads the perf counters). See PR #359/#356.
- If adding a new parse kind, add a `bench_*.cpp` (PR #359 added `bench_uint16.cpp`).
- For this workspace, attach the `scripts/run-bench.sh` aarch64 gcc+clang rows from
  `experiments/<EXP>/bench-results/`. Report regressions honestly (none > noise).

### 9. PR hygiene & scope
- **Small and single-purpose.** Merged PRs are overwhelmingly tiny
  (`+3/-4`, `+6/-2`, `+15/-0`). Split unrelated changes.
- **Edit `include/fast_float/*.h` only.** The amalgam is generated by
  `script/amalgamate.py` (CI: `amalgamate-ubuntu24.yml` compiles it); it is NOT
  committed in `main`, so do not hand-edit or commit a generated `fast_float.h`.
- Keep it **header-only, zero-dependency**: do not add `#include`s of heavy stdlib
  headers — upstream actively removes them (PR #379 dropped `std::min`/`<algorithm>`).
- Don't reformat untouched lines; keep the diff minimal so review is trivial.

### 10. Attribution & etiquette
- Add yourself to `CONTRIBUTORS` (amalgamate.py emits it into the header).
- Credit the lineage when relevant (these ports originate in `redis-performance/ffc.h`,
  itself a fast_float port).
- Expect Lemire's flow: he often **approves then "lets it sit in case others have
  comments,"** may ask you to **"sync with main,"** and merges into the **next
  release**. Be responsive; keep the branch rebased on `upstream/main`.

---

## Output format

```
fast_float merge-readiness review — <change / EXP-id>

Gates:
  clang-format-17 ...... PASS | FAIL (n files reformatted)
  C++11 compile ........ PASS | FAIL
  big-endian safe ...... PASS | N/A (byte-scan only) | FAIL: <where>
  -Werror matrix ....... PASS | FAIL: <warning>
  unit+supplemental .... PASS (14/14) | FAIL
  exhaustive ........... PASS | NOT RUN (not a mantissa change) | FAIL
  benchmark evidence ... <gcc/clang Δ% table> | MISSING

Checklist: <✅/⚠️/❌ per item 1-10 with one-line reasons>

Verdict: MERGE-READY | NEEDS WORK
Blocking: <list ❌ items>
Suggested PR title/body: <if merge-ready>
```

---

## Evidence (last ~25 merged PRs + CI, captured 2026-06-01)

- Format: `lint_and_format_check.yml` → clang-format **v17**; `.clang-format` = LLVM,
  SortIncludes:false, SeparateDefinitionBlocks:Always, MaxEmptyLines:1.
- C++11 floor: `CMakeLists.txt` `cxx_std_11`.
- Amalgam generated, not committed: `script/amalgamate.py`, `amalgamate-ubuntu24.yml`;
  header-touching PR #356 changed only `include/fast_float/*.h`.
- Big-endian scrutiny: `s390x.yml`; Lemire in PR #359 — "test BIG ENDIAN … s390x".
- Warnings/UB bounces: #368 (C4702 unreachable), #365 (`/permissive-`), #353 (UB),
  #357 (endianness bug in uint8).
- Zero-dependency ethos: #379 (remove `std::min`/`<algorithm>`).
- Optimization-PR norm (bench + perf counters): #359 (uint16, added `bench_uint16.cpp`,
  GB/s + c/ip/i/ip table), #356 (optimize `fastfloat_strncasecmp`).
- Tests-only welcome: #366 ("no performance claims; tests only", Resolves #168).
- Review/merge style: #359 — "Looks good. I will let it sit in case others have
  comments." / "sync with our main branch" / "Will be in the next release."
- Maintainer's own PRs are mostly benchmarks, docs, and small fixes (#345, #350-352).

Refresh this list periodically: `gh pr list -R fastfloat/fast_float --state merged
--limit 25 --json number,title,author,additions,deletions`.
