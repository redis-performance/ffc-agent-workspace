#!/usr/bin/env bash
# Implementation phase: N agents implement the winning hypothesis in parallel,
# each producing a unified diff. Each diff is applied to a fresh ffc/src/ copy,
# correctness-checked, and benchmarked. Best passing variant wins.
# Token counts come from the Anthropic API response (via llm-call.py) — not self-reported.
#
# Usage: EXP_ID=EXP-001 ./scripts/implement.sh experiments/proposals/TIMESTAMP/chair-decision.md
#   or:  EXP_ID=EXP-001 ./scripts/implement.sh   (reads hypothesis from stdin)
set -euo pipefail

WORKSPACE="$(cd "$(dirname "$0")/.." && pwd)"
LLM="python3 $WORKSPACE/scripts/llm-call.py"
FFC_DIR="$WORKSPACE/ffc"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
LEDGER="$WORKSPACE/experiments/token-ledger.tsv"
EXP_ID="${EXP_ID:-EXP-000}"
N_VARIANTS="${N_VARIANTS:-3}"
VARIANTS_DIR="$WORKSPACE/experiments/$EXP_ID/variants/$TIMESTAMP"

# Read hypothesis from file or stdin
if [[ -n "${1:-}" && -f "$1" ]]; then
  HYPOTHESIS_FILE="$1"
else
  HYPOTHESIS_FILE="$VARIANTS_DIR/hypothesis.md"
  mkdir -p "$VARIANTS_DIR"
  cat > "$HYPOTHESIS_FILE"
fi

mkdir -p "$VARIANTS_DIR"

# Implementer models (different architectures/sizes for implementation diversity)
MODELS=("claude-opus-4-7" "claude-sonnet-4-6" "claude-sonnet-4-6")
AGENT_NAMES=("opus" "sonnet-a" "sonnet-b")

# ── Step 1: build prompt files and launch implementers in parallel ─────────────
echo "==> Implementation phase — $EXP_ID — $N_VARIANTS variants in parallel" >&2

PIDS=()
for i in $(seq 0 $((N_VARIANTS - 1))); do
  model="${MODELS[$i]}"
  name="${AGENT_NAMES[$i]}"
  prompt_file="$VARIANTS_DIR/prompt-$name.md"

  # Build prompt: skill + hypothesis + sources
  cat "$WORKSPACE/.claude/skills/implement.md" > "$prompt_file"
  echo "" >> "$prompt_file"
  echo "---" >> "$prompt_file"
  echo "## Winning hypothesis" >> "$prompt_file"
  cat "$HYPOTHESIS_FILE" >> "$prompt_file"
  echo "" >> "$prompt_file"
  echo "## Current source files" >> "$prompt_file"
  echo "" >> "$prompt_file"
  echo "### ffc/src/parse.h" >> "$prompt_file"
  cat "$FFC_DIR/src/parse.h" >> "$prompt_file"
  echo "" >> "$prompt_file"
  echo "### ffc/src/ffc.h" >> "$prompt_file"
  cat "$FFC_DIR/src/ffc.h" >> "$prompt_file"
  echo "" >> "$prompt_file"
  echo "### ffc/src/common.h" >> "$prompt_file"
  cat "$FFC_DIR/src/common.h" >> "$prompt_file"

  echo "    Variant $((i+1))/$N_VARIANTS: $model ($name)" >&2
  $LLM \
    --model "$model" \
    --prompt-file "$prompt_file" \
    --exp-id "$EXP_ID" \
    --phase "implement" \
    --agent-id "$name" \
    --ledger "$LEDGER" \
    --description "implementation variant" \
    > "$VARIANTS_DIR/variant-$name-raw.md" 2>&1 &
  PIDS+=($!)
done

for pid in "${PIDS[@]}"; do wait "$pid" || true; done
echo "==> All implementers done. Extracting diffs..." >&2

# ── Step 2: extract unified diffs from each agent's output ────────────────────
for i in $(seq 0 $((N_VARIANTS - 1))); do
  name="${AGENT_NAMES[$i]}"
  raw="$VARIANTS_DIR/variant-$name-raw.md"
  diff_out="$VARIANTS_DIR/variant-$name.diff"

  # Extract content between the DIFF: marker and the end of the fenced block
  awk '/^DIFF:/{found=1; next} /^```$/ && found{found=0} found{print}' "$raw" \
    > "$diff_out" 2>/dev/null || true

  # Fallback: extract raw --- a/ ... +++ b/ ... @@ blocks if marker not found
  if [[ ! -s "$diff_out" ]]; then
    awk '/^--- a\//{found=1} found{print}' "$raw" > "$diff_out" 2>/dev/null || true
  fi
done

# ── Step 3: apply each diff to a fresh src copy, test, benchmark ───────────────
declare -A VARIANT_SCORE   # variant_name → MB/s (random dataset)
declare -A VARIANT_STATUS  # variant_name → pass|fail|fail-patch|fail-test|fail-amalgam

for i in $(seq 0 $((N_VARIANTS - 1))); do
  name="${AGENT_NAMES[$i]}"
  diff_file="$VARIANTS_DIR/variant-$name.diff"
  src_copy="$VARIANTS_DIR/src-$name"

  echo "" >&2
  echo "==> Variant $((i+1))/$N_VARIANTS ($name): apply → test → bench" >&2

  cp -r "$FFC_DIR/src" "$src_copy"

  if [[ ! -s "$diff_file" ]]; then
    echo "    No diff extracted — FAIL." >&2
    VARIANT_STATUS[$name]="fail-no-diff"
    continue
  fi

  # Apply diff against a temp dir structured as ffc/src/
  tmp_ffc="$VARIANTS_DIR/tmp-ffc-$name"
  mkdir -p "$tmp_ffc"
  cp -r "$FFC_DIR/src" "$tmp_ffc/src"

  if patch -p1 -d "$tmp_ffc" --dry-run < "$diff_file" &>/dev/null; then
    patch -p1 -d "$tmp_ffc" < "$diff_file" &>/dev/null
    echo "    Diff applied cleanly." >&2
  else
    echo "    Diff failed to apply — FAIL." >&2
    VARIANT_STATUS[$name]="fail-patch"
    continue
  fi

  # Swap in this variant's src, regenerate amalgam, run tests
  mv "$FFC_DIR/src" "$FFC_DIR/src.bak-$name"
  cp -r "$tmp_ffc/src" "$FFC_DIR/src"

  if ! make -C "$FFC_DIR" ffc.h &>/dev/null; then
    echo "    Amalgamation failed — FAIL." >&2
    rm -rf "$FFC_DIR/src" && mv "$FFC_DIR/src.bak-$name" "$FFC_DIR/src"
    VARIANT_STATUS[$name]="fail-amalgam"
    continue
  fi

  if ! make -C "$FFC_DIR" test &>/dev/null; then
    echo "    Unit tests failed — FAIL." >&2
    rm -rf "$FFC_DIR/src" && mv "$FFC_DIR/src.bak-$name" "$FFC_DIR/src"
    VARIANT_STATUS[$name]="fail-test"
    continue
  fi

  # Benchmark: rebuild with this ffc.h and get random-dataset score
  "$WORKSPACE/scripts/build-bench.sh" &>/dev/null
  bench_out="$VARIANTS_DIR/bench-$name.txt"
  "$WORKSPACE/scripts/run-bench.sh" > "$bench_out" 2>/dev/null || true

  score="$(grep -E '^ffc' "$bench_out" | head -1 | grep -oP '[0-9]+\.[0-9]+(?= MB/s)' | head -1 || echo 0)"
  VARIANT_STATUS[$name]="pass"
  VARIANT_SCORE[$name]="${score:-0}"
  echo "    PASS — random ffc: ${score:-0} MB/s" >&2

  # Restore original src for next variant
  rm -rf "$FFC_DIR/src" && mv "$FFC_DIR/src.bak-$name" "$FFC_DIR/src"
done

# ── Step 4: pick the winner ───────────────────────────────────────────────────
echo "" >&2
echo "==> Results:" >&2
WINNER=""
WINNER_SCORE="0"
for name in "${!VARIANT_STATUS[@]}"; do
  status="${VARIANT_STATUS[$name]}"
  score="${VARIANT_SCORE[$name]:-0}"
  echo "    $name  status=$status  score=${score} MB/s" >&2
  if [[ "$status" == "pass" ]] && awk "BEGIN{exit !($score > $WINNER_SCORE)}"; then
    WINNER="$name"
    WINNER_SCORE="$score"
  fi
done

echo "WINNER: ${WINNER:-none}" > "$VARIANTS_DIR/result.txt"
echo "SCORE: $WINNER_SCORE MB/s" >> "$VARIANTS_DIR/result.txt"

if [[ -z "$WINNER" ]]; then
  echo "" >&2
  echo "==> No variant passed — all rejected." >&2
  exit 1
fi

echo "" >&2
echo "==> Winner: $WINNER ($WINNER_SCORE MB/s)" >&2

# Apply winner's diff to ffc/src/ permanently (caller will commit or revert)
patch -p1 -d "$FFC_DIR" < "$VARIANTS_DIR/variant-$WINNER.diff" &>/dev/null
make -C "$FFC_DIR" ffc.h &>/dev/null

echo "==> Winner applied to ffc/src/." >&2
echo "==> Run scripts/run-bench.sh + scripts/run-profile.sh, then:" >&2
echo "==>   git -C ffc add src/ && git -C ffc commit -m '$EXP_ID: ...'" >&2
echo "==> Variants saved to $VARIANTS_DIR/" >&2
