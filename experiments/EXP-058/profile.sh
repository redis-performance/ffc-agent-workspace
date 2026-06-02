#!/usr/bin/env bash
# Profile base vs patch fastfloat parsing (EXP-058). perf stat deltas + per-symbol
# annotate of the inlined findmax_fastfloat<char> hot loop. base/patch binaries
# differ ONLY in fast_float, so stat deltas isolate the change.
#   SUDO=  (default 'sudo') ; PIN=core ; DS=mesh|random|canada ; PASS=lab sudo pw (Intel)
set -u
D="$HOME/ffc-race/simple_fastfloat_benchmark/data"
PIN="${PIN:-3}"; DS="${DS:-mesh}"
arg=""; [ "$DS" = canada ] && arg="-f $D/canada.txt"; [ "$DS" = mesh ] && arg="-f $D/mesh.txt"
SYM='double findmax_fastfloat<char>(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)'
# sudo wrapper: piped password on Intel lab, passwordless on ARM metal
SU(){ if [ -n "${PASS:-}" ]; then printf '%s' "$PASS" | sudo -S -p '' "$@"; else sudo -n "$@"; fi; }
echo "==== node=$(uname -n) arch=$(uname -m) dataset=$DS pin=$PIN ===="
for v in base patch; do
  B=/tmp/bench-$v-gcc
  echo "---- $v: perf stat ----"
  SU perf stat -e instructions,cycles,branches,branch-misses -- taskset -c "$PIN" "$B" $arg >/dev/null 2>/tmp/st-$v.txt
  grep -E "instructions|cycles|branch-misses|branches |insn per|elapsed" /tmp/st-$v.txt | sed 's/^ */    /'
  echo "---- $v: record+annotate findmax_fastfloat<char> (top self instrs) ----"
  SU perf record -g -F 2999 -o /tmp/p-$v.data -- taskset -c "$PIN" "$B" $arg >/dev/null 2>&1
  SU perf annotate --stdio -i /tmp/p-$v.data "$SYM" 2>/dev/null | grep -E "^\s+[0-9]+\.[0-9]+ :" | sort -rn -k1 | head -10 | sed 's/^/    /'
done
echo "---- top symbols (patch, self%) ----"
SU perf report --stdio -i /tmp/p-patch.data --no-children 2>/dev/null | grep -E "findmax_fastfloat<char>|findmax_ffc" | head -3 | sed 's/^/    /'
