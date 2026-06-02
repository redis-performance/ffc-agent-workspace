# hiredis × ffc — proposing ffc as hiredis's internal float parser

**Goal**: replace `strtod()` in hiredis's RESP3 double-reply path with **ffc** (pure-C99
single-header), and upstream it as a PR to `redis/hiredis`. Track the whole effort here.

**Status**: 🚀 **PR OPENED** — https://github.com/redis/hiredis/pull/1328 (H0–H7 done).
ffc is the default RESP3 double parser (MIT-vendored `ffc.h`), `strtod` fallback via
`-DHIREDIS_FLOAT_STRTOD`. Validated: 3M-value strtod-parity bit-identical, ~7–10× faster
(x86+ARM), locale bug fixed, tests green under both builds. Branch `ffc-double-parser` @
`f19c4b5`, pushed to `fcostaoliveira/hiredis`. Next: respond to maintainer review.
**Owner**: this workspace. **Started**: 2026-06-02.
**Submodule**: `hiredis/` → `git@github.com:fcostaoliveira/hiredis.git` (fork of `redis/hiredis`),
currently `1d18adb` (heads/master).

---

## Why ffc, and why this is uniquely ffc's opening

hiredis is **pure C** (C99, BSD-3, vendored into Redis itself + dozens of language
bindings). That single fact is the whole thesis:

| | strtod (today) | fast_float | **ffc** |
|---|---|---|---|
| Language | C stdlib | **C++** ❌ (can't link into pure-C hiredis) | **C99 single header** ✅ |
| Speed vs strtod | 1× (baseline) | ~2–3× | **~2–3×** |
| Locale-independent | ❌ respects `LC_NUMERIC` | ✅ | ✅ |
| Needs NUL-terminated input | ✅ (forces a copy) | ❌ (range API) | ❌ (range API) |

**The race established ffc ≈ fast_float in speed (and ahead on several ARM cells).** Since
fast_float is C++, ffc is the *only* high-performance from_chars-style parser that can drop
into hiredis. This is the strategic payoff of having pushed ffc forward.

### Three concrete wins over `strtod`

1. **Speed.** ffc is 2–3× faster than glibc `strtod` (see benchmark `strtod` vs `ffc` rows,
   all datasets). RESP3 double replies are hot in real workloads: RedisTimeSeries
   (`TS.RANGE`/`TS.MRANGE`), `FT.SEARCH … WITHSCORES`, vector-search distance scores,
   `ZADD`/`ZRANGE … WITHSCORES`, `GEODIST`. A reply stream of thousands of doubles is
   parse-bound on `strtod`.
2. **Locale correctness — a latent RESP3 bug.** `strtod` honors the process `LC_NUMERIC`
   locale. RESP3 doubles are *always* `.`-separated, but a hiredis client embedded in a
   process that called `setlocale(LC_NUMERIC, "de_DE.UTF-8")` (decimal `,`) will **misparse**
   `,3.14\r\n` — `strtod("3.14")` returns `3.0` in that locale. ffc is locale-independent by
   construction (`decimal_point` is an explicit option, default `'.'`). This is a correctness
   argument, not just performance — strong for conservative maintainers.
3. **No per-reply copy.** Today hiredis does `memcpy(buf, p, len); buf[len]=0;` into a
   326-byte stack buffer *solely* because `strtod` needs a NUL-terminated string. ffc's
   `ffc_from_chars_double(start, end, &out)` parses the reader buffer range `[p, p+len)`
   directly. The string form the reply keeps (`reply->str`) is copied by `createDouble` from
   `p` just as well as from `buf` → the dedicated buffer + memcpy + NUL-terminate disappears.

---

## Integration point (exact)

`hiredis/read.c`, `processLineItem()`, the `REDIS_REPLY_DOUBLE` branch (lines ~290–327):

```c
} else if (cur->type == REDIS_REPLY_DOUBLE) {
    char buf[326], *eptr;          // <-- buf only exists to feed strtod
    double d;
    ...
    memcpy(buf,p,len); buf[len]='\0';
    if (len==3 && strcasecmp(buf,"inf")==0)  d = INFINITY;
    else if (len==4 && strcasecmp(buf,"-inf")==0) d = -INFINITY;
    else if ((len==3 && strcasecmp(buf,"nan")==0) || (len==4 && strcasecmp(buf,"-nan")==0)) d = NAN;
    else {
        d = strtod(buf,&eptr);
        if (buf[0]=='\0' || eptr!=&buf[len] || !isfinite(d)) { ...PROTOCOL error... }
    }
    obj = r->fn->createDouble(cur,d,buf,len);
}
```

### Proposed shape

```c
} else if (cur->type == REDIS_REPLY_DOUBLE) {
    double d;
    /* RESP3 permits only "inf"/"-inf"/"nan"/"-nan" + finite values. Keep the strict,
     * length-checked special-cases (case-insensitive, no copy) — ffc would otherwise
     * also accept "infinity", "nan(...)", which RESP3 forbids. */
    if      (len==3 && !hi_strncasecmp(p,"inf",3))  d = INFINITY;
    else if (len==4 && !hi_strncasecmp(p,"-inf",4)) d = -INFINITY;
    else if ((len==3 && !hi_strncasecmp(p,"nan",3)) ||
             (len==4 && !hi_strncasecmp(p,"-nan",4))) d = NAN;
    else {
        /* ffc: locale-independent, no NUL-terminated copy. NO_INFNAN so ffc rejects
         * inf/nan tokens (handled strictly above); GENERAL = fixed+scientific. */
        ffc_parse_options o = ffc_parse_options_default();
        o.format |= FFC_FORMAT_FLAG_NO_INFNAN;
        ffc_result res = ffc_from_chars_double_options(p, p+len, &d, o);
        if (res.outcome != FFC_OUTCOME_OK || res.ptr != p+len || !isfinite(d)) {
            __redisReaderSetError(r,REDIS_ERR_PROTOCOL,"Bad double value");
            return REDIS_ERR;
        }
    }
    obj = r->fn->createDouble(cur,d,p,len);   /* copies the string form from p */
}
```

Semantics preserved 1:1: full-consume (`res.ptr == p+len` ≡ `eptr == &buf[len]`),
finiteness, identical round-to-nearest-even result, identical PROTOCOL error on junk.

---

## Open questions to resolve during implementation

1. **Vendoring model.** hiredis vendors `sds` as `sds.c/.h`. ffc is a single 3.4k-line /
   144K header (`ffc/ffc.h`, generated from `ffc/src/*.h`). Options: (a) drop `ffc.h` in as
   a vendored header; (b) gate behind `HIREDIS_FLOAT_FFC` with `strtod` fallback so the
   default build is unchanged and adopters opt in. Likely lead with (b) to lower maintainer
   risk, then make it default once proven.
2. **`hi_strncasecmp`.** hiredis has no length-bounded case-insensitive compare; the current
   code relies on NUL-terminated `strcasecmp` over `buf`. Add a tiny static helper (3 lines)
   so we can drop `buf` entirely, or keep a 5-byte local just for the inf/nan tokens.
3. **License.** ffc is triple-licensed Apache-2.0 / MIT / Boost-1.0 (all permissive);
   hiredis is BSD-3. Vendoring under MIT or Boost is cleanest (no Apache patent-clause
   questions). Confirm + add the chosen license header + NOTICE.
4. **Float (RESP3 has only double).** hiredis only parses doubles in RESP3 — `ffc_from_chars_double`
   is the only entry needed. (ffc's int parsers are not in scope; hiredis integers use its own scanner.)
5. **Exhaustive RESP3 corpus.** Build a parity test: same inputs through `strtod` and ffc,
   assert identical `double` bits (or both error). Include subnormals, 17-sig-digit
   round-trips, `1e308`/`1e-308`, `-0.0`, max RESP3 length.

---

## Validation plan

**Correctness (must pass before any benchmark or PR):**
- hiredis `make check` / `test.c` existing double tests green.
- New parity suite: `strtod` vs `ffc` bit-identical over a generated corpus
  (random doubles, dtoa round-trips, edge magnitudes, malformed → both reject).
- **Locale regression test**: under `LC_NUMERIC=de_DE.UTF-8`, assert ffc parses `3.14`
  correctly while documenting that `strtod` does not (the headline correctness win).
- RESP3-strictness: `infinity`, `1.0junk`, `0x1p4`, empty, leading space → PROTOCOL error
  (parity with today).

**Benchmark (prove the speed claim):**
- New microbench (in the hiredis fork or this workspace): synthesize N RESP3
  `,<double>\r\n` frames, feed through `redisReader`, measure replies/s and MB/s,
  baseline `strtod` vs ffc. Reuse the race's three dataset shapes (random/canada/mesh-like).
- Report on the same x86 (pinned core) + ARM-metal surfaces used for the race, so numbers
  are comparable to the established ffc/fast_float figures.
- Real-reply sample: capture a `TS.RANGE`/`FT.SEARCH WITHSCORES` reply stream and replay it.

---

## Milestones

| # | Milestone | Status |
|---|-----------|--------|
| H0 | Add `hiredis/` submodule (fcostaoliveira fork) | ✅ done (2026-06-02) |
| H1 | Identify integration point + draft proposal (this doc) | ✅ done |
| H2 | Vendor `ffc.h` into the fork + `HIREDIS_FLOAT_FFC` build gate | ✅ done — `ffc.h` (3442 lines) vendored; `#define FFC_IMPL` in read.c (sole TU) |
| H3 | Implement read.c double-path swap + `hiTokCaseEq` helper | ✅ done — builds clean under `-std=c99 -pedantic -Werror`; hiredis double reader tests #48–62 pass (incl. embedded-NUL invalid + array) |
| H4 | Parity test suite (strtod≡ffc) + locale regression test | ✅ done — `parity.c`: 3,000,000 values bit-identical, 0 accept/reject disagreements; locale bug reproduced |
| H5 | double-parse microbenchmark (strtod vs ffc) | ✅ done — `bench.c`, x86 local + ARM Graviton4 metal |
| H6 | Decide default-on vs opt-in; license header; NOTICE | ✅ done — default-on (ffc), `-DHIREDIS_FLOAT_STRTOD` fallback; SPDX MIT header on `ffc.h` |
| H7 | PR fcostaoliveira/hiredis → redis/hiredis with bench + correctness evidence | ✅ **opened: [redis/hiredis#1328](https://github.com/redis/hiredis/pull/1328)** |

## Review round 1 (2026-06-02, PR #1328 @ `a8ca884`)

CI + Cursor Bugbot surfaced three items; all addressed (pushed `a8ca884`):
1. **macOS CI fail** — Apple Clang `-Wstatic-in-inline` (`ffc.h`'s `extern inline`
   entry points call file-local `static` helpers) → `-Werror` fail. Fixed: scoped
   `#pragma clang diagnostic ignored "-Wstatic-in-inline"` around the vendored
   include (GCC unaffected). **macOS now passes.**
2. **Bugbot (medium)** — passing the raw reader pointer (`p[len]` == `\r`, not `\0`)
   to `createDouble` changed the implicit NUL-terminated-string contract. Fixed:
   restored the `buf` copy + NUL-terminate; ffc parses that buffer. Costs ~40% of
   the ffc speedup but keeps the callback contract.
3. **Bugbot (low)** — real `ffc.h` bug: `ffc_negative_digit_comp` called
   `ffc_am_to_float(..., FFC_VALUE_KIND_DOUBLE)` instead of `vk` (8-byte-write /
   4-byte-read of the value union on the float slow path). Not reachable from
   hiredis. Fixed at the root in `ffc/src/digit_comparison.h:460`, regenerated,
   re-vendored. ⏳ validating via ffc float exhaustive (2³² sweep, still running).

**Faithful re-benchmark (both paths now copy+NUL-terminate → pure parser delta):**
x86 random/canada/mesh +335/306/344%; ARM Graviton4 +411/400/251% (~**4×**, down
from the ~7–9× of the copy-free prototype — the copy was the difference).

## Results (x86 local, Intel, pinned core 3)

**Correctness (H3/H4):**
- hiredis reply-reader double tests pass on the ffc build (#48 parse, #49 invalid/embedded-NUL,
  #50 inf, #51 nan, #52 -nan, #62 array).
- `parity.c`: 3,000,000 generated doubles (random bit patterns / `[0,1)` / canada-ish /
  mesh-ish, 6 printf formats) → **0 bit-mismatches, 0 accept-disagreements** vs `strtod` (C
  locale). 26 hand-picked edge cases: 0 disagreements.
- ffc is **stricter** than the strtod path (RESP3-correct): rejects ` 3.14` (leading ws),
  `\t1`, `0x1p4`, `0X1.8p3` — all of which `strtod` silently accepts today.
- **Locale bug** (`LOCPATH=~/.locale LC_NUMERIC=de_DE.UTF-8`): parsing `3.14`,
  `strtod` → `3.0` and the hiredis predicate then **rejects it as a PROTOCOL error**;
  ffc → `3.14`, accepted. A hiredis client in a comma-locale process errors on every
  double reply today.

**Speed (H5)** — `bench.c`, best of 200, parse predicates mirroring hiredis exactly:

| Dataset | strtod+copy (hiredis today) | strtod no-copy | **ffc** | ffc vs hiredis | parser-only |
|---------|----------------------------:|---------------:|--------:|---------------:|------------:|
| random [0,1] | 108.45 MB/s | 112.55 | **783.09** | **+622%** | +596% |
| canada.txt | 100.80 MB/s | 100.11 | **735.01** | **+629%** | +634% |
| mesh.txt | 84.45 MB/s | 88.75 | **799.50** | **+847%** | +801% |

**ARM Graviton4 metal** (`bench.c`, best of 200, pinned core 3):

| Dataset | strtod+copy (hiredis today) | strtod no-copy | **ffc** | ffc vs hiredis | parser-only |
|---------|----------------------------:|---------------:|--------:|---------------:|------------:|
| random [0,1] | 195.14 MB/s | 201.08 | **1831.85** | **+839%** | +811% |
| canada.txt | 168.69 MB/s | 174.42 | **1712.61** | **+915%** | +882% |
| mesh.txt | 164.49 MB/s | 180.68 | **1664.86** | **+912%** | +821% |

The per-reply copy is **not** the bottleneck (~3–10%); glibc `strtod` itself is. ffc gives
~**7–9× (x86) / ~9–10× (ARM)** faster double parsing. (Reader-level throughput including
`redisReply` alloc/free is alloc-dominated and dilutes this — the parse is the part the
PR changes.)

## Risks / mitigations

- **Maintainer conservatism (new code in a vendored-everywhere lib).** Mitigate: single
  header, zero build-system change, opt-in flag with `strtod` fallback, exhaustive parity
  proof, and lead the PR narrative with the *locale correctness bug*, not just speed.
- **Binary-size / amalgam churn.** 144K header; note it's only compiled into `read.o`.
- **Rounding parity.** ffc is a correctly-rounded parser (round-nearest-even, same as a
  conforming `strtod`); the parity suite is the proof.
- **ABI/embedding.** hiredis is often statically vendored; a header-only add is the
  lowest-friction form factor.

---

## Log

- **2026-06-02** — Effort opened. Added `hiredis/` submodule @ `1d18adb`. Located the sole
  float-parse site (`read.c:311`, `strtod` in the `REDIS_REPLY_DOUBLE` branch). Confirmed
  `createDoubleObject` copies the string form from its `str` arg (so we can pass `p` and drop
  the `buf` copy). Confirmed ffc default options = GENERAL + `decimal_point='.'`, infnan ON
  (so the numeric path needs `NO_INFNAN` + the existing strict inf/nan guards). ffc.h amalgam
  = 3442 lines / 144K, tri-licensed Apache/MIT/Boost. Drafted integration shape + validation
  plan. Next: H2 (vendor + build gate).
- **2026-06-02** — H2–H5 landed (branch `ffc-double-parser` @ `9c895b4`). Vendored `ffc.h`,
  added the `-DHIREDIS_FLOAT_FFC` gate (`#define FFC_IMPL` in read.c, the sole TU — the amalgam
  emits implementations only under `FFC_IMPL`). Swapped the read.c double branch (strict in-place
  inf/nan tokens via `hiTokCaseEq`, `ffc_from_chars_double_options` with `NO_INFNAN`, no buf copy).
  Builds clean under hiredis's `-std=c99 -pedantic -Werror -Wall -Wextra`. hiredis double reader
  tests pass. `parity.c`: 3M values bit-identical to strtod; locale bug reproduced. `bench.c`:
  ffc ~7–9× faster (the copy is only ~4%; strtod is the wall). Harness in
  `experiments/hiredis-ffc/` (`parity.c`, `bench.c`, `build-bench.sh`). Next: H6 — decide
  opt-in vs default-on + license header, then H7 (PR). Open question for H6: lead the PR with the
  *locale correctness bug* (hard to argue against) and offer it opt-in first to lower maintainer risk.
- **2026-06-02** — H6 + H7 done. Decision (user): **default-on** (ffc default, `strtod` via
  `-DHIREDIS_FLOAT_STRTOD`), vendored under **MIT** (SPDX header on `ffc.h`). Added build-agnostic
  in-tree tests (bit-exact edge magnitudes + malformed rejections), green under both builds.
  Squashed the branch to one commit (`f19c4b5`), pushed to `fcostaoliveira/hiredis`, and **opened
  the PR: https://github.com/redis/hiredis/pull/1328** (via the `GH_TOKEN= GITHUB_TOKEN= gh`
  OAuth fallback — the PAT can't open upstream PRs). PR body archived at
  `experiments/hiredis-ffc/PR-BODY.md`. Now awaiting maintainer review.
