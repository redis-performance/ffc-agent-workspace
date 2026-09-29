// Independent scalar oracle, guard pages, and public-parser fingerprint.
#ifndef _DEFAULT_SOURCE
#define _DEFAULT_SOURCE
#endif
#define FFC_IMPL
#include "ffc.h"
#include <fenv.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>

static uint64_t checks, fingerprint = UINT64_C(14695981039346656037);
static void mix(uint64_t x) {
  for (int k = 0; k < 8; ++k) {
    fingerprint ^= (x >> (8 * k)) & 255;
    fingerprint *= UINT64_C(1099511628211);
  }
}
static int digits(const char *p, size_t count) {
  for (size_t k = 0; k < count; ++k)
    if (p[k] < '0' || p[k] > '9') return 0;
  return 1;
}
static void check_helper(const char *p, size_t length, uint64_t seed) {
  const char *actual_end = p, *expected_end = p, *end = p + length;
  uint64_t actual = seed, expected = seed;
  while (end - expected_end >= 8 && digits(expected_end, 8)) {
    for (int k = 0; k < 8; ++k) expected = expected * 10 + (uint64_t)(*expected_end++ - '0');
  }
  if (end - expected_end >= 4 && digits(expected_end, 4)) {
    for (int k = 0; k < 4; ++k) expected = expected * 10 + (uint64_t)(*expected_end++ - '0');
  }
  ffc_loop_parse_if_eight_digits(&actual_end, end, &actual);
  if (actual_end != expected_end || actual != expected) {
    fprintf(stderr, "Scanner mismatch: length=%zu seed=%" PRIu64 "\n", length, seed);
    exit(1);
  }
  ++checks;
}
static void check_public(const char *p, size_t length) {
  double d = 0;
  float f = 0;
  ffc_result rd = ffc_from_chars_double(p, p + length, &d);
  ffc_result rf = ffc_from_chars_float(p, p + length, &f);
  mix(rd.outcome); mix((uint64_t)(rd.ptr - p));
  mix(rf.outcome); mix((uint64_t)(rf.ptr - p));
  if (rd.outcome == FFC_OUTCOME_OK) {
    uint64_t bits; memcpy(&bits, &d, sizeof(bits)); mix(bits);
  }
  if (rf.outcome == FFC_OUTCOME_OK) {
    uint32_t bits; memcpy(&bits, &f, sizeof(bits)); mix(bits);
  }
  checks += 2;
}
int main(void) {
  long page_size = sysconf(_SC_PAGESIZE);
  if (page_size < 256) return 2;
  size_t page = (size_t)page_size;
  char *mapping = mmap(NULL, page * 3, PROT_NONE, MAP_PRIVATE | MAP_ANON, -1, 0);
  if (mapping == MAP_FAILED || mprotect(mapping + page, page, PROT_READ | PROT_WRITE)) return 2;
  char *begin = mapping + page, *end = mapping + 2 * page;
  const uint64_t seeds[] = {0, 1, UINT64_MAX, UINT64_C(0x123456789abcdef0)};
  const unsigned char invalid[] = {0, '.', 'e', '-', '/', ':', 0x80, 0xff};
  char text[256];
  for (size_t length = 0; length <= 128; ++length) {
    for (size_t k = 0; k < length; ++k) text[k] = (char)('0' + (k * 7 + length) % 10);
    // Each length ends exactly at a guard page; start placement catches underreads.
    for (int placement = 0; placement < 2; ++placement) {
      char *input = placement ? end - length : begin;
      memcpy(input, text, length);
      for (size_t s = 0; s < sizeof(seeds) / sizeof(seeds[0]); ++s)
        check_helper(input, length, seeds[s]);
      for (size_t k = 0; k < length; ++k) {
        for (size_t b = 0; b < sizeof(invalid); ++b) {
          input[k] = (char)invalid[b];
          for (size_t s = 0; s < sizeof(seeds) / sizeof(seeds[0]); ++s)
            check_helper(input, length, seeds[s]);
        }
        input[k] = text[k];
      }
    }
  }
  const int rounds[] = {FE_TONEAREST, FE_UPWARD, FE_DOWNWARD, FE_TOWARDZERO};
  const char *prefixes[] = {"0.", "-123.", "1.", "12345."};
  const char *suffixes[] = {"", "e-20", "e+309", "e-999", "x", "e-", ".5"};
  for (size_t r = 0; r < sizeof(rounds) / sizeof(rounds[0]); ++r) {
    if (fesetround(rounds[r])) return 2;
    for (size_t n = 0; n <= 96; ++n)
    for (size_t a = 0; a < sizeof(prefixes) / sizeof(prefixes[0]); ++a)
    for (size_t b = 0; b < sizeof(suffixes) / sizeof(suffixes[0]); ++b) {
      size_t offset = strlen(prefixes[a]);
      memcpy(text, prefixes[a], offset);
      for (size_t k = 0; k < n; ++k) text[offset + k] = (char)('0' + (n + k * 3) % 10);
      size_t tail = strlen(suffixes[b]);
      memcpy(text + offset + n, suffixes[b], tail);
      size_t length = offset + n + tail;
      char *input = end - length;
      memcpy(input, text, length);
      check_public(input, length);
    }
  }
  fesetround(FE_TONEAREST);
  munmap(mapping, page * 3);
  printf("checks=%" PRIu64 " fingerprint=%016" PRIx64 "\n", checks, fingerprint);
  return 0;
}
