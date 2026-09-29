// Isolate ffc from the other parsers in the unchanged upstream benchmark.
// Usage: driver <dataset> [seconds]. Build with PROFILE_FLOAT for float parsing.
#define FFC_IMPL
#include "ffc.h"
#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <limits>
#include <string>
#include <vector>

#ifdef PROFILE_FLOAT
using value_type = float;
#define PARSE ffc_from_chars_float
#else
using value_type = double;
#define PARSE ffc_from_chars_double
#endif

// Keep an identifiable symbol while allowing the parser to inline as it does
// in findmax_ffc. Match the upstream benchmark's max reduction, not a sum chain.
__attribute__((noinline)) value_type
profile_ffc(const std::vector<std::string> &lines) {
  value_type maximum = std::numeric_limits<value_type>::lowest();
  for (const auto &line : lines) {
    value_type value;
    const auto result = PARSE(line.data(), line.data() + line.size(), &value);
    if (result.outcome != FFC_OUTCOME_OK || result.ptr != line.data() + line.size()) {
      std::fprintf(stderr, "Incomplete or invalid parse in profile dataset\n");
      std::exit(1);
    }
    if (value > maximum) maximum = value;
  }
  return maximum;
}

int main(int argc, char **argv) {
  if (argc < 2 || argc > 3) return 2;
  const double seconds = argc == 3 ? std::strtod(argv[2], nullptr) : 5.0;
  if (!(seconds > 0 && seconds <= 60)) return 2;
  std::ifstream input(argv[1]);
  if (!input) { std::perror(argv[1]); return 1; }
  std::vector<std::string> lines;
  std::string line;
  while (std::getline(input, line)) {
    if (!line.empty() && line.back() == '\r') line.pop_back();
    if (!line.empty()) lines.push_back(line);
  }
  if (input.bad() || lines.empty()) return 1;
  const auto start = std::chrono::steady_clock::now();
  size_t repetitions = 0;
  volatile value_type maximum = 0;
  do {
    maximum = profile_ffc(lines);
    ++repetitions;
  } while (std::chrono::duration<double>(std::chrono::steady_clock::now() - start).count() < seconds);
  std::printf("ffc max=%g lines=%zu repetitions=%zu\n", double(maximum), lines.size(), repetitions);
}
