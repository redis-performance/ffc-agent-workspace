// Standalone profiling driver: parses one dataset file with fast_float ONLY,
// repeatedly, so perf attributes everything to the fast_float code path.
// usage: driver <file> [reps]
#include "fast_float/fast_float.h"

#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <string>
#include <vector>

int main(int argc, char **argv) {
  if (argc < 2) {
    std::fprintf(stderr, "usage: %s <file> [reps]\n", argv[0]);
    return 2;
  }
  std::ifstream in(argv[1]);
  std::vector<std::string> lines;
  std::string s;
  while (std::getline(in, s)) {
    if (!s.empty()) {
      lines.push_back(s);
    }
  }
  int reps = (argc > 2) ? std::atoi(argv[2]) : 3000;
  double sum = 0;
  for (int r = 0; r < reps; r++) {
    for (std::string const &l : lines) {
      double x = 0;
      auto res = fast_float::from_chars(l.data(), l.data() + l.size(), x);
      if (res.ptr == l.data()) {
        std::fprintf(stderr, "parse fail: %s\n", l.c_str());
        return 1;
      }
      sum += x;
    }
  }
  std::printf("%f over %zu lines x %d reps\n", sum, lines.size(), reps);
  return 0;
}
