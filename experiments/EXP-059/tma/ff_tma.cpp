// fast_float-only microbench for Intel TMA (top-down) analysis of EXP-058/059.
// Parses a dataset repeatedly through fast_float::from_chars<double> so the hot
// loop is ENTIRELY fast_float's parser (no other parsers diluting the topdown
// breakdown). Build against base vs patch headers and compare perf -M TopdownL1/L2.
//
//   c++ -O3 -march=native -std=c++17 -I<ff_include> ff_tma.cpp -o ff_tma
//   ff_tma <dataset> <reps>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <vector>
#include "fast_float/fast_float.h"

int main(int argc, char **argv) {
  if (argc < 2) { std::fprintf(stderr, "usage: %s <file> [reps]\n", argv[0]); return 2; }
  long reps = argc > 2 ? std::atol(argv[2]) : 2000;

  // Load the dataset into a flat contiguous buffer of [begin,end) spans, so the
  // loop touches only the parser + the spans (no per-iteration allocation).
  std::FILE *f = std::fopen(argv[1], "r");
  if (!f) { std::perror("fopen"); return 2; }
  std::string blob;             // all tokens concatenated
  std::vector<std::pair<size_t,size_t>> spans;  // (offset,len) into blob
  char line[512];
  while (std::fgets(line, sizeof(line), f)) {
    line[std::strcspn(line, "\r\n")] = '\0';
    size_t n = std::strlen(line);
    if (!n) continue;
    spans.emplace_back(blob.size(), n);
    blob.append(line, n);
  }
  std::fclose(f);
  if (spans.empty()) { std::fprintf(stderr, "no values\n"); return 2; }

  const char *base = blob.data();
  volatile double sink = 0;
  long ok = 0;
  for (long r = 0; r < reps; r++) {
    for (auto &sp : spans) {
      double d;
      auto res = fast_float::from_chars(base + sp.first, base + sp.first + sp.second, d);
      if (res.ec == std::errc()) { sink += d; ok++; }
    }
  }
  std::fprintf(stderr, "parsed %ld ok (%zu tokens x %ld reps), sink=%g\n",
               ok, spans.size(), reps, (double)sink);
  return 0;
}
