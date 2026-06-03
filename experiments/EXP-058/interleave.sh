#!/usr/bin/env bash
# Interleaved base-vs-patch fast_float benchmark (EXP-058). Runs the saved
# /tmp/bench-{base,patch}-{gcc,clang} binaries back-to-back per iteration so
# machine drift hits both equally; the ffc row (identical in both binaries) is
# the drift sentinel. Median of 5. Pin core via PIN (default 3).
set -u
D="$HOME/ffc-race/simple_fastfloat_benchmark/data"
PIN="${PIN:-3}"
BP="${BP:-bench}"   # binary prefix: 'bench' (double) or 'bench32' (float)
med(){ printf '%s\n' "$@" | sort -n | awk '{a[NR]=$1} END{print a[int((NR+1)/2)]}'; }
gf(){ echo "$1" | grep -m1 '^fastfloat' | grep -oE '[0-9]+\.[0-9]+ MB/s' | grep -oE '^[0-9.]+'; }
gc(){ echo "$1" | grep -m1 '^ffc'       | grep -oE '[0-9]+\.[0-9]+ MB/s' | grep -oE '^[0-9.]+'; }
echo "node=$(uname -n) arch=$(uname -m) pin=$PIN"
printf "%-5s %-7s | %-9s %-9s %-7s | ffc(base/patch)\n" CC DS base_ff patch_ff dFF%
for cc in ${CCS:-gcc clang}; do
  for ds in random canada mesh; do
    arg=""; [ "$ds" = canada ] && arg="-f $D/canada.txt"; [ "$ds" = mesh ] && arg="-f $D/mesh.txt"
    bff=(); pff=(); bfc=(); pfc=()
    for i in 1 2 3 4 5; do
      ob=$(taskset -c "$PIN" /tmp/$BP-base-$cc  $arg 2>/dev/null)
      op=$(taskset -c "$PIN" /tmp/$BP-patch-$cc $arg 2>/dev/null)
      bff+=( "$(gf "$ob")" ); pff+=( "$(gf "$op")" )
      bfc+=( "$(gc "$ob")" ); pfc+=( "$(gc "$op")" )
    done
    B=$(med "${bff[@]}"); P=$(med "${pff[@]}")
    d=$(awk -v b="$B" -v p="$P" 'BEGIN{ if(b>0) printf "%+.2f", (p-b)/b*100; else print "?" }')
    printf "%-5s %-7s | %-9s %-9s %-7s | %s/%s\n" "$cc" "$ds" "$B" "$P" "$d" "$(med "${bfc[@]}")" "$(med "${pfc[@]}")"
  done
done
