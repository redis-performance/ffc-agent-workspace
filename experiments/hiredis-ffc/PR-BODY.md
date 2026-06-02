## Summary

RESP3 double replies (the `,` type) are parsed in `read.c` with `strtod()`. This PR replaces that with **ffc**, a pure-C99 single-header correctly-rounded float parser (a C port of Daniel Lemire's [fast_float](https://github.com/fastfloat/fast_float)), vendored as `ffc.h`. `strtod` remains available as a fallback via `-DHIREDIS_FLOAT_STRTOD`.

Three reasons, in order of importance:

### 1. Locale correctness (a latent bug)

`strtod()` honours the process `LC_NUMERIC` locale, but RESP3 doubles are *always* `.`-separated. A hiredis client embedded in a process that has called e.g. `setlocale(LC_NUMERIC, "de_DE.UTF-8")` (decimal comma) **misparses** the valid reply `,3.14\r\n`: `strtod("3.14")` returns `3.0`, and the existing `eptr != &buf[len]` check then rejects it as a `"Bad double value"` **PROTOCOL error**. So under a comma-locale, hiredis errors on essentially every double reply today.

ffc takes the decimal point as an explicit option (default `'.'`), so it is locale-independent by construction.

### 2. Speed

ffc is several times faster than glibc `strtod`. Parse-only microbenchmark (best of 200 iterations, pinned core), using the exact predicates hiredis uses (the `strtod` column includes the per-reply NUL-terminated copy hiredis does today):

| Platform | dataset | strtod (hiredis today) | ffc | speedup |
|---|---|---:|---:|---:|
| x86 (Intel) | random `[0,1]` | 108 MB/s | **783 MB/s** | **+622%** |
| x86 (Intel) | canada (geo coords) | 101 MB/s | **735 MB/s** | **+629%** |
| x86 (Intel) | mesh (short floats) | 84 MB/s | **799 MB/s** | **+847%** |
| ARM (Graviton4) | random `[0,1]` | 195 MB/s | **1832 MB/s** | **+839%** |
| ARM (Graviton4) | canada | 169 MB/s | **1713 MB/s** | **+915%** |
| ARM (Graviton4) | mesh | 164 MB/s | **1665 MB/s** | **+912%** |

glibc `strtod` itself is the bottleneck -- eliminating the copy (see below) accounts for only ~4-10%. Double-heavy reply streams (`TS.RANGE`/`TS.MRANGE`, `FT.SEARCH ... WITHSCORES`, vector-search distances, `ZRANGE ... WITHSCORES`, `GEODIST`) are parse-bound on `strtod`.

### 3. No per-reply copy

Today hiredis does `memcpy(buf,p,len); buf[len]='\0';` into a 326-byte stack buffer *solely* because `strtod` needs a NUL-terminated string. ffc's `ffc_from_chars_double` parses the reader buffer range `[p, p+len)` directly. `createDouble` copies the textual form from `p` just as well as from `buf`, so the buffer disappears.

## Correctness

RESP3 semantics are preserved **exactly**:
- The strict `inf`/`-inf`/`nan`/`-nan` tokens are matched in place (case-insensitive, no copy).
- ffc runs with `NO_INFNAN`, so the numeric path only ever yields finite values.
- The full-consume (`res.ptr == p+len`) + `isfinite` checks mirror the `strtod` path's `eptr`/`isfinite` checks.
- ffc is in fact **stricter** than `strtod`: it rejects the leading-whitespace and C99 hex-float inputs (`" 3.14"`, `"0x1p4"`) that `strtod` silently accepts -- neither is valid RESP3.

Testing:
- Existing double reader tests pass (incl. the embedded-NUL invalid case and the array case).
- Added in-tree tests: bit-exact edge magnitudes (`0`, `-0`, `5e-324` subnormal, `DBL_MIN`, `DBL_MAX`, ...) and malformed rejections -- all green under **both** the ffc default and the `-DHIREDIS_FLOAT_STRTOD` fallback.
- An out-of-tree sweep of **3,000,000** values (random bit patterns / `[0,1)` / mixed magnitudes / short floats, across multiple printf formats) is **bit-identical to `strtod`** with zero accept/reject disagreements.

`ffc.h` compiles clean under hiredis's existing `-std=c99 -pedantic -Werror -Wall -Wextra -Wstrict-prototypes -Wwrite-strings`.

## Notes

- `ffc.h` is a single vendored header (no build-system change; only `read.c` includes it). It is tri-licensed Apache-2.0 / MIT / Boost-1.0 and is included here under **MIT** (compatible with hiredis's BSD-3), marked with an SPDX header.
- Default build now uses ffc; define `HIREDIS_FLOAT_STRTOD` to revert to `strtod`. Happy to keep it opt-in instead if you'd prefer to land the capability before flipping the default.
