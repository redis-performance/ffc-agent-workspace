#!/usr/bin/env bash
# Implementation phase: N agents implement the winning hypothesis in parallel
# git worktrees of ffc/src/, then correctness-check + benchmark each variant.
# The best-performing variant that passes all checks wins.
#
# Usage: EXP_ID=EXP-001 ./scripts/implement.sh "path/to/chair-decision.md"
#   or:  EXP_ID=EXP-001 ./scripts/implement.sh  (reads from stdin)
set -euo pipefail

WORKSPACE="$(cd "$(dirname "$0")/.." && pwd)"
FFC_DIR="$WORKSPACE/ffc"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
LEDGER="$WORKSPACE/experiments/token-ledger.tsv"
EXP_ID="${EXP_ID:-EXP-000}"
N_VARIANTS="${N_VARIANTS:-3}"
VARIANTS_DIR="$WORKSPACE/experiments/variants/$EXP_ID-$TIMESTAMP"

# Read hypothesis from file or stdin
if [[ -n "${1:-}" && -f "$1" ]]; then
  HYPOTHESIS="$(cat "$1")"
else
  HYPOTHESIS="$(cat)"
fi

# Implementer models (different perspectives)
MODELS=("claude-opus-4-7" "claude-sonnet-4-6" "claude-sonnet-4-6")
AGENT_NAMES=("opus" "sonnet-a" "sonnet-b")

mkdir -p "$VARIANTS_DIR"

# Read the implement skill prompt + current sources
IMPLEMENT_PROMPT_BASE="$(cat "$WORKSPACE/.claude/skills/implement.md")"

SOURCE_CONTEXT="$(cat <<EOF
## Winning hypothesis
$HYPOTHESIS

## Current source files

### ffc/src/parse.h
$(cat "$FFC_DIR/src/parse.h")

### ffc/src/ffc.h (core algorithm)
$(cat "$FFC_DIR/src/ffc.h")

### ffc/src/common.h (SIMD helpers)
$(cat "$FFC_DIR/src/common.h")
EOF
)"

echo "==> Implementation phase — $EXP_ID — $N_VARIANTS variants in parallel" >&2

# ── Step 1: generate diffs in parallel ────────────────────────────────────────
PIDS=()
for i in $(seq 0 $((N_VARIANTS - 1))); do
  model="${MODELS[$i]}"
  name="${AGENT_NAMES[$i]}"
  diff_out="$VARIANTS_DIR/variant-$name.diff"
  full_prompt="$IMPLEMENT_PROMPT_BASE

---
$SOURCE_CONTEXT"

  echo "    Variant $((i+1))/$N_VARIANTS: $model → $diff_out" >&2
  claude --model "$model" --print "$full_prompt" > "$VARIANTS_DIR/variant-$name-raw.md" 2>/dev/null &
  PIDS+=($!)
done

for pid in "${PIDS[@]}"; do wait "$pid" || true; done
echo "==> All implementers done. Extracting diffs..." >&2

# ── Step 2: extract unified diffs from each agent's output ────────────────────
for i in $(seq 0 $((N_VARIANTS - 1))); do
  name="${AGENT_NAMES[$i]}"
  raw="$VARIANTS_DIR/variant-$name-raw.md"
  diff_out="$VARIANTS_DIR/variant-$name.diff"

  # Extract content between DIFF: and TOKENS_IN:
  awk '/^DIFF:/{found=1; next} /^TOKENS_IN:/{found=0} found{print}' "$raw" > "$diff_out" 2>/dev/null || true

  tokens_in="$(grep -oP 'TOKENS_IN:\s*\K[0-9]+' "$raw" 2>/dev/null | tail -1 || echo 0)"
  tokens_out="$(grep -oP 'TOKENS_OUT:\s*\K[0-9]+' "$raw" 2>/dev/null | tail -1 || echo 0)"
  echo -e "$EXP_ID\timplement\t$name\t${MODELS[$i]}\t$tokens_in\t$tokens_out\t$TIMESTAMP\tvariant diff" >> "$LEDGER"
done

# ── Step 3: create worktrees, apply diffs, test + benchmark each ──────────────
declare -A VARIANT_SCORE   # variant_name → MB/s (random dataset)
declare -A VARIANT_STATUS  # variant_name → pass|fail

for i in $(seq 0 $((N_VARIANTS - 1))); do
  name="${AGENT_NAMES[$i]}"
  diff_file="$VARIANTS_DIR/variant-$name.diff"
  wt_path="$VARIANTS_DIR/worktree-$name"

  echo "" >&2
  echo "==> Variant $((i+1))/$N_VARIANTS ($name): apply → test → bench" >&2

  # Create a fresh copy of ffc/src for this variant
  cp -r "$FFC_DIR/src" "$wt_path"

  # Apply the diff (patch -p1 from the ffc/ root)
  if [[ -s "$diff_file" ]]; then
    if patch -p1 -d "$wt_path/.." --dry-run < "$diff_file" &>/dev/null; then
      patch -p1 -d "$wt_path/.." < "$diff_file" &>/dev/null
      echo "    Diff applied cleanly." >&2
    else
      echo "    Diff failed to apply — marking FAIL." >&2
      VARIANT_STATUS[$name]="fail-patch"
      continue
    fi
  else
    echo "    No diff extracted — marking FAIL." >&2
    VARIANT_STATUS[$name]="fail-no-diff"
    continue
  fi

  # Swap in variant src, regenerate, test
  ORIG_SRC="$FFC_DIR/src"
  mv "$ORIG_SRC" "${ORIG_SRC}.bak-$name"
  cp -r "$wt_path" "$ORIG_SRC"

  if ! make -C "$FFC_DIR" ffc.h &>/dev/null; then
    echo "    Amalgamation failed — FAIL." >&2
    mv "${ORIG_SRC}.bak-$name" "$ORIG_SRC"
    VARIANT_STATUS[$name]="fail-amalgam"
    continue
  fi

  if ! make -C "$FFC_DIR" test &>/dev/null; then
    echo "    Tests failed — FAIL." >&2
    mv "${ORIG_SRC}.bak-$name" "$ORIG_SRC"
    VARIANT_STATUS[$name]="fail-test"
    continue
  fi

  # Benchmark
  "$WORKSPACE/scripts/build-bench.sh" &>/dev/null
  bench_out="$VARIANTS_DIR/bench-$name.txt"
  "$WORKSPACE/scripts/run-bench.sh" > "$bench_out" 2>/dev/null || true

  # Extract random-dataset ffc MB/s as the score
  score="$(grep -E '^ffc' "$bench_out" | head -1 | grep -oP '[0-9]+\.[0-9]+(?= MB/s)' | head -1 || echo 0)"
  VARIANT_STATUS[$name]="pass"
  VARIANT_SCORE[$name]="${score:-0}"
  echo "    PASS — random ffc: $score MB/s" >&2

  # Restore original src
  mv "${ORIG_SRC}.bak-$name" "$ORIG_SRC"
done

# ── Step 4: pick the winner ───────────────────────────────────────────────────
echo "" >&2
echo "==> Results:" >&2
WINNER=""
WINNER_SCORE="0"
for name in "${!VARIANT_STATUS[@]}"; do
  status="${VARIANT_STATUS[$name]}"
  score="${VARIANT_SCORE[$name]:-0}"
  echo "    $name: $status  score=$score MB/s" >&2
  if [[ "$status" == "pass" ]] && awk "BEGIN{exit !($score > $WINNER_SCORE)}"; then
    WINNER="$name"
    WINNER_SCORE="$score"
  fi
done

if [[ -z "$WINNER" ]]; then
  echo "==> No variant passed — all rejected. Nothing to commit." >&2
  echo "WINNER: none" > "$VARIANTS_DIR/result.txt"
  exit 1
fi

echo "" >&2
echo "==> Winner: $WINNER ($WINNER_SCORE MB/s)" >&2

# Apply winner's diff to ffc/src/ for the caller to commit
patch -p1 -d "$FFC_DIR" < "$VARIANTS_DIR/variant-$WINNER.diff" &>/dev/null
make -C "$FFC_DIR" ffc.h &>/dev/null

echo "WINNER: $WINNER" > "$VARIANTS_DIR/result.txt"
echo "SCORE: $WINNER_SCORE MB/s" >> "$VARIANTS_DIR/result.txt"
echo "" >&2
echo "==> Winner applied to ffc/src/. Run scripts/run-bench.sh and scripts/run-profile.sh" >&2
echo "==> then commit: git -C ffc add src/ && git -C ffc commit -m '$EXP_ID: ...'" >&2
echo "==> Variants saved to $VARIANTS_DIR/" >&2
