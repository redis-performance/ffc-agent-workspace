// Compile once against the baseline and once against a candidate. Compare the
// fingerprints, which include outcome, consumed bytes, and successful bit values.
#define FFC_IMPL
#include "ffc.h"
#include <fenv.h>
#include <inttypes.h>
#include <stdio.h>
#include <string.h>

static uint64_t fingerprint = UINT64_C(14695981039346656037);
static uint64_t checks;
static void mix(uint64_t value) {
  for (int i = 0; i < 8; ++i) {
    fingerprint ^= (value >> (i * 8)) & 255;
    fingerprint *= UINT64_C(1099511628211);
  }
}

int main(void) {
  const char *mantissas[] = {
    "0", "-0", "1", "-1", "1.2345678901234567", "-123.45678901234567",
    "1000000000000000000000000000000000000001",
    "1.175494140627517859246175898662808184331245864732796240031385942718174675986",
    "0.000000000000000000000000000000000000000000000000000000000000000001",
    "1.7976931348623157", "4.9406564584124654", "2.2250738585072014",
    ".5", "-0.00000000000000000000000000", "9999999999999999999"
  };
  const char *exponents[] = {
    "", "+", "-", "0", "-0", "+00", "1", "-1", "09", "-09", "10",
    "-38", "38", "308", "-324", "-999", "999", "268435455", "268435456",
    "268435457", "-268435455", "-268435456", "2684354559", "4294967295",
    "-4294967295", "99999999999999999999999999999999999999999999",
    "-99999999999999999999999999999999999999999999",
    "000000000000000000000000000000000000000000001"
  };
  const char *markers[] = {"e", "E", "d", "D"};
  const char *suffixes[] = {"", "x", ".5", "e2"};
  const int rounds[] = {FE_TONEAREST, FE_UPWARD, FE_DOWNWARD, FE_TOWARDZERO};
  const ffc_format formats[] = {FFC_PRESET_GENERAL, FFC_PRESET_JSON,
                               FFC_PRESET_FORTRAN, FFC_FORMAT_FLAG_SCIENTIFIC,
                               FFC_FORMAT_FLAG_FIXED};
  char input[512];
#define LENGTH(array) (sizeof(array) / sizeof((array)[0]))
  for (size_t r = 0; r < LENGTH(rounds); ++r) {
    if (fesetround(rounds[r]) != 0) return 2;
    for (size_t m = 0; m < LENGTH(mantissas); ++m)
    for (size_t e = 0; e < LENGTH(exponents); ++e)
    for (size_t k = 0; k < LENGTH(markers); ++k)
    for (size_t s = 0; s < LENGTH(suffixes); ++s)
    for (size_t f = 0; f < LENGTH(formats); ++f) {
      int length = snprintf(input, sizeof(input), "%s%s%s%s",
                            mantissas[m], markers[k], exponents[e], suffixes[s]);
      if (length < 0 || (size_t)length >= sizeof(input)) return 2;
      ffc_parse_options options = ffc_parse_options_default();
      options.format = formats[f];
      double d = 0;
      float v = 0;
      ffc_result rd = ffc_from_chars_double_options(input, input + length, &d, options);
      ffc_result rf = ffc_from_chars_float_options(input, input + length, &v, options);
      mix(rd.outcome); mix((uint64_t)(rd.ptr - input));
      mix(rf.outcome); mix((uint64_t)(rf.ptr - input));
      if (rd.outcome == FFC_OUTCOME_OK) {
        uint64_t bits; memcpy(&bits, &d, sizeof(bits)); mix(bits);
      }
      if (rf.outcome == FFC_OUTCOME_OK) {
        uint32_t bits; memcpy(&bits, &v, sizeof(bits)); mix(bits);
      }
      checks += 2;
    }
  }
  fesetround(FE_TONEAREST);
  printf("checks=%" PRIu64 " fingerprint=%016" PRIx64 "\n", checks, fingerprint);
  return 0;
}
