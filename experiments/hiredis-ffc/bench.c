/* hiredis × ffc — double-parse microbenchmark  (experiments/HIREDIS-FFC.md)
 *
 * Isolates the thing the hiredis PR changes: the per-double parse. Times the two
 * predicates hiredis uses today (strtod path) vs proposed (ffc path) over a
 * corpus, with no redisReader/allocation overhead in the loop. Self-contained.
 *
 * Build: cc -O3 -std=c99 -I../../ffc -DFFC_IMPL bench.c -lm -o bench
 * Usage: ./bench <file>   (one number per line: canada.txt / mesh.txt)
 *        ./bench --random (1M doubles in [0,1])
 */
#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <math.h>
#include <time.h>

#define FFC_IMPL
#include "ffc.h"

static double now_s(void) {
  struct timespec t; clock_gettime(CLOCK_MONOTONIC, &t);
  return (double)t.tv_sec + (double)t.tv_nsec * 1e-9;
}

/* hiredis ffc path predicate — mirrors read.c exactly: copy + NUL-terminate
 * (the string is handed to createDouble), then parse the range with ffc. */
static int ffc_parse(const char *s, size_t len, double *out) {
  char buf[326];
  if (len >= sizeof(buf)) return 0;
  memcpy(buf, s, len); buf[len] = '\0';
  ffc_parse_options o = ffc_parse_options_default();
  o.format |= FFC_FORMAT_FLAG_NO_INFNAN;
  ffc_result r = ffc_from_chars_double_options(buf, buf + len, out, o);
  return r.outcome == FFC_OUTCOME_OK && r.ptr == buf + len && isfinite(*out);
}
/* hiredis strtod path predicate (incl. the per-reply NUL-terminated copy). */
static int strtod_parse(const char *s, size_t len, double *out) {
  char buf[326]; char *eptr;
  if (len >= sizeof(buf)) return 0;
  memcpy(buf, s, len); buf[len] = '\0';
  *out = strtod(buf, &eptr);
  return buf[0] != '\0' && eptr == &buf[len] && isfinite(*out);
}
/* strtod with NO copy (input already NUL-terminated) — isolates the parser cost
 * from the copy-elimination, so the speedup can be attributed honestly. */
static int strtod_nocopy(const char *s, size_t len, double *out) {
  char *eptr; *out = strtod(s, &eptr);
  return s[0] != '\0' && eptr == s + len && isfinite(*out);
}

int main(int argc, char **argv) {
  if (argc < 2) { fprintf(stderr, "usage: %s <file>|--random\n", argv[0]); return 2; }

  size_t ncap = 1 << 16, n = 0, bytes = 0;
  char **strs = malloc(ncap * sizeof(char*));
  size_t *lens = malloc(ncap * sizeof(size_t));

  char line[512];
  if (strcmp(argv[1], "--random") == 0) {
    uint64_t s = 0x123456789ULL;
    for (int i = 0; i < 1000000; i++) {
      s ^= s << 13; s ^= s >> 7; s ^= s << 17;
      double d = (double)(s >> 11) / (double)(1ULL << 53);
      int ln = snprintf(line, sizeof(line), "%.17g", d);
      if (n == ncap) { ncap*=2; strs=realloc(strs,ncap*sizeof(char*)); lens=realloc(lens,ncap*sizeof(size_t)); }
      strs[n] = malloc((size_t)ln+1); memcpy(strs[n], line, (size_t)ln+1);
      lens[n] = (size_t)ln; bytes += (size_t)ln; n++;
    }
  } else {
    FILE *f = fopen(argv[1], "r");
    if (!f) { perror("fopen"); return 2; }
    while (fgets(line, sizeof(line), f)) {
      line[strcspn(line, "\r\n")] = '\0';
      size_t ln = strlen(line);
      if (ln == 0) continue;
      if (n == ncap) { ncap*=2; strs=realloc(strs,ncap*sizeof(char*)); lens=realloc(lens,ncap*sizeof(size_t)); }
      strs[n] = malloc(ln+1); memcpy(strs[n], line, ln+1);
      lens[n] = ln; bytes += ln; n++;
    }
    fclose(f);
  }
  if (n == 0) { fprintf(stderr, "no values\n"); return 2; }

  int reps = 200;
  volatile double sink = 0;
  double best_copy = 1e30, best_nocopy = 1e30, best_ffc = 1e30;

  for (int rep = 0; rep < reps + 5; rep++) {
    double d, t0 = now_s();
    for (size_t i = 0; i < n; i++) { strtod_parse(strs[i], lens[i], &d); sink += d; }
    double dt = now_s() - t0; if (rep >= 5 && dt < best_copy) best_copy = dt;
  }
  for (int rep = 0; rep < reps + 5; rep++) {
    double d, t0 = now_s();
    for (size_t i = 0; i < n; i++) { strtod_nocopy(strs[i], lens[i], &d); sink += d; }
    double dt = now_s() - t0; if (rep >= 5 && dt < best_nocopy) best_nocopy = dt;
  }
  for (int rep = 0; rep < reps + 5; rep++) {
    double d, t0 = now_s();
    for (size_t i = 0; i < n; i++) { ffc_parse(strs[i], lens[i], &d); sink += d; }
    double dt = now_s() - t0; if (rep >= 5 && dt < best_ffc) best_ffc = dt;
  }

  double mb = (double)bytes / 1e6;
  double s_copy = mb / best_copy, s_nocopy = mb / best_nocopy, f = mb / best_ffc;
  const char *name = strcmp(argv[1],"--random")==0 ? "random[0,1]" : argv[1];
  /* hiredis (strtod) and ffc both copy+NUL-terminate identically, so this is a
   * pure parser comparison. strtod-nocopy is shown only to confirm the copy is
   * negligible (strtod itself is the cost). */
  printf("%-12s %zu vals %5.2fMB | strtod %7.2f | ffc %7.2f MB/s | ffc %+.0f%%"
         "   [strtod-nocopy %7.2f]\n",
         name, n, mb, s_copy, f, (f - s_copy)/s_copy*100.0, s_nocopy);
  (void)sink;
  return 0;
}
