// ffc-only microbench for Intel TMA / hot-instruction profiling.
// Parses a dataset repeatedly through ffc_from_chars_double so the hot loop is
// ENTIRELY ffc's parser (no harness/other-parser dilution). Build against the
// race-tip ffc.h and compare perf -M TopdownL1/L2 / annotate across Intel gens.
//   cc -O3 -march=native -std=c99 -DFFC_IMPL ffc_tma.cpp -o ffc_tma -lm
//   ffc_tma <dataset> [reps]
#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#define FFC_IMPL
#include "ffc.h"
static double now_s(void){ struct timespec t; clock_gettime(CLOCK_MONOTONIC,&t); return (double)t.tv_sec+(double)t.tv_nsec*1e-9; }

int main(int argc, char **argv) {
  if (argc < 2) { fprintf(stderr, "usage: %s <file> [reps]\n", argv[0]); return 2; }
  long reps = argc > 2 ? atol(argv[2]) : 2500;
  FILE *f = fopen(argv[1], "r");
  if (!f) { perror("fopen"); return 2; }
  char *blob = NULL; size_t cap = 0, len = 0;
  size_t *off = NULL, *ln = NULL, n = 0, ncap = 0;
  char line[512];
  while (fgets(line, sizeof(line), f)) {
    line[strcspn(line, "\r\n")] = 0; size_t L = strlen(line);
    if (!L) continue;
    if (len + L > cap) { cap = (len + L) * 2 + 4096; blob = (char*)realloc(blob, cap); }
    if (n == ncap) { ncap = ncap * 2 + 1024; off = (size_t*)realloc(off, ncap*sizeof(size_t)); ln = (size_t*)realloc(ln, ncap*sizeof(size_t)); }
    off[n] = len; ln[n] = L; memcpy(blob + len, line, L); len += L; n++;
  }
  fclose(f);
  if (!n) { fprintf(stderr, "no values\n"); return 2; }
  volatile double sink = 0; long ok = 0;
  double best = 1e30;
  int trials = getenv("FFC_TRIALS") ? atoi(getenv("FFC_TRIALS")) : 5;
  for (int tr = 0; tr < trials; tr++) {
    double t0 = now_s();
    for (long r = 0; r < reps; r++)
      for (size_t i = 0; i < n; i++) {
        double d; ffc_result res = ffc_from_chars_double(blob + off[i], blob + off[i] + ln[i], &d);
        if (res.outcome == FFC_OUTCOME_OK) { sink += d; ok++; }
      }
    double dt = now_s() - t0; if (dt < best) best = dt;
  }
  // ONLY the best elapsed seconds to stdout (clean for scripting); ok to stderr.
  printf("%.5f\n", best);
  fprintf(stderr, "ok=%ld sink=%g\n", ok, (double)sink);
  return 0;
}
