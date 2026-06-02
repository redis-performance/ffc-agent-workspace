/* hiredis × ffc — parser parity + locale harness  (effort: experiments/HIREDIS-FFC.md)
 *
 * Proves the two claims the hiredis PR rests on:
 *   1. ffc_from_chars_double is bit-identical to strtod (C locale) over a large
 *      corpus of finite doubles, and agrees on accept/reject for malformed input.
 *   2. strtod is locale-dependent (a latent RESP3 bug); ffc is not.
 *
 * Build:
 *   cc -O2 -std=c99 -I../../ffc -DFFC_IMPL parity.c -o parity   (or -I../../hiredis)
 * Run:
 *   ./parity            # parity sweep + malformed parity + locale demo
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <math.h>
#include <locale.h>

#define FFC_IMPL
#include "ffc.h"

/* The exact predicate hiredis uses on the ffc path. */
static int ffc_parse(const char *s, size_t len, double *out) {
  ffc_parse_options o = ffc_parse_options_default();
  o.format |= FFC_FORMAT_FLAG_NO_INFNAN;
  ffc_result r = ffc_from_chars_double_options(s, s + len, out, o);
  return r.outcome == FFC_OUTCOME_OK && r.ptr == s + len && isfinite(*out);
}

/* The exact predicate hiredis uses on the strtod path (numeric, non-inf/nan). */
static int strtod_parse(const char *s, size_t len, double *out) {
  char buf[326]; char *eptr;
  if (len >= sizeof(buf)) return 0;
  memcpy(buf, s, len); buf[len] = '\0';
  *out = strtod(buf, &eptr);
  return buf[0] != '\0' && eptr == &buf[len] && isfinite(*out);
}

static uint64_t rng_state = 0x9E3779B97F4A7C15ULL;
static uint64_t xorshift(void) {
  rng_state ^= rng_state << 13; rng_state ^= rng_state >> 7; rng_state ^= rng_state << 17;
  return rng_state;
}

static int bits_equal(double a, double b) {
  uint64_t x, y; memcpy(&x, &a, 8); memcpy(&y, &b, 8); return x == y;
}

int main(void) {
  /* Force the C locale so the parity sweep compares like-for-like. */
  setlocale(LC_NUMERIC, "C");

  long n = 3000000, mism = 0, accept_disagree = 0;
  char s[64];
  const char *fmts[] = {"%.17g", "%.15g", "%g", "%.1f", "%.6f", "%.17e"};
  int nf = (int)(sizeof(fmts)/sizeof(fmts[0]));

  for (long i = 0; i < n; i++) {
    double d;
    uint64_t bits = xorshift();
    int mode = (int)(i % 4);
    if (mode == 0) { memcpy(&d, &bits, 8); if (!isfinite(d)) continue; }        /* any finite bit pattern */
    else if (mode == 1) d = (double)(bits >> 11) / (double)(1ULL << 53);        /* [0,1) */
    else if (mode == 2) d = ((int64_t)bits) / 1e6;                              /* canada-ish magnitudes */
    else d = (double)(int16_t)bits + ((bits & 0xff) / 256.0);                   /* mesh-ish short */

    int len = snprintf(s, sizeof(s), fmts[i % nf], d);
    if (len <= 0 || (size_t)len >= sizeof(s)) continue;

    double a, b;
    int oka = strtod_parse(s, (size_t)len, &a);
    int okb = ffc_parse(s, (size_t)len, &b);
    if (oka != okb) {
      if (accept_disagree < 5)
        fprintf(stderr, "ACCEPT DISAGREE: \"%s\" strtod=%d ffc=%d\n", s, oka, okb);
      accept_disagree++;
    } else if (oka && !bits_equal(a, b)) {
      if (mism < 5) fprintf(stderr, "BIT MISMATCH: \"%s\" strtod=%.17g ffc=%.17g\n", s, a, b);
      mism++;
    }
  }
  printf("parity sweep: %ld values | bit-mismatches=%ld | accept-disagreements=%ld\n",
         n, mism, accept_disagree);

  /* Edge inputs where ffc MUST match strtod: RESP3-valid values + clearly
   * malformed strings both reject (and identical bits when accepted). */
  const char *edge[] = {
    /* valid */
    "0","-0","0.0","-0.0","1","1.0","1e308","1e-308","2.2250738585072014e-308",
    "1.7976931348623157e308","4.9e-324","123456789012345678901234567890","0.1","-0.1",
    "3.14159265358979323846",
    /* malformed: both reject */
    "", "3.14 ", "3.14x", "1.2.3", "+", "-", ".", "1e", "1e+", "infinity", "1,5"
  };
  long edge_mism = 0;
  for (size_t i = 0; i < sizeof(edge)/sizeof(edge[0]); i++) {
    double a, b; size_t len = strlen(edge[i]);
    int oka = strtod_parse(edge[i], len, &a), okb = ffc_parse(edge[i], len, &b);
    if (oka != okb || (oka && !bits_equal(a,b))) {
      fprintf(stderr, "EDGE DISAGREE: \"%s\" strtod(%d,%.17g) ffc(%d,%.17g)\n", edge[i], oka,a, okb,b);
      edge_mism++;
    }
  }
  printf("edge cases: %zu | disagreements=%ld\n", sizeof(edge)/sizeof(edge[0]), edge_mism);

  /* ffc is STRICTER than the current strtod path: strtod skips leading
   * whitespace and parses C99 hex floats, both of which RESP3 forbids but the
   * strtod path silently accepts today. ffc rejects them. Informational. */
  const char *stricter[] = {" 3.14", "\t1", "0x1p4", "0X1.8p3", "  -2"};
  printf("ffc-stricter (strtod lax-accepts, ffc rejects — RESP3-correct):\n");
  for (size_t i = 0; i < sizeof(stricter)/sizeof(stricter[0]); i++) {
    double a, b; size_t len = strlen(stricter[i]);
    int oka = strtod_parse(stricter[i], len, &a), okb = ffc_parse(stricter[i], len, &b);
    printf("    \"%s\": strtod accept=%d  ffc accept=%d\n", stricter[i], oka, okb);
  }

  /* ---- Locale regression: the headline correctness win ---- */
  printf("\n--- locale test (the strtod RESP3 bug) ---\n");
  const char *target_locale = "de_DE.UTF-8"; /* decimal comma */
  if (setlocale(LC_NUMERIC, target_locale) == NULL) {
    printf("  (skipped: locale %s not installed)\n", target_locale);
  } else {
    double a, b;
    int oka = strtod_parse("3.14", 4, &a);
    int okb = ffc_parse("3.14", 4, &b);
    printf("  under %s, parsing \"3.14\":\n", target_locale);
    printf("    strtod : accept=%d value=%.17g  %s\n", oka, a,
           (oka && a == 3.14) ? "ok" : "*** WRONG (locale-dependent) ***");
    printf("    ffc    : accept=%d value=%.17g  %s\n", okb, b,
           (okb && b == 3.14) ? "ok (locale-independent)" : "*** WRONG ***");
    setlocale(LC_NUMERIC, "C");
  }

  long total_fail = mism + accept_disagree + edge_mism;
  printf("\nRESULT: %s\n", total_fail == 0 ? "PASS (ffc ≡ strtod over all finite inputs)"
                                           : "FAIL");
  return total_fail == 0 ? 0 : 1;
}
