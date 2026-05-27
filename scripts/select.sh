#!/usr/bin/env bash
# Selection phase: 3 proposer agents (different models) independently propose the
# next experiment, then a chair agent picks the winner.
# Token counts come from the Anthropic API response (via llm-call.py) — not self-reported.
#
# Output: experiments/proposals/TIMESTAMP/ with one file per agent + chair decision
# Stdout: the winning proposal (for piping into implement.sh)
set -euo pipefail

WORKSPACE="$(cd "$(dirname "$0")/.." && pwd)"
LLM="python3 $WORKSPACE/scripts/llm-call.py"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
PROPOSALS_DIR="$WORKSPACE/experiments/$EXP_ID/proposals/$TIMESTAMP"
LEDGER="$WORKSPACE/experiments/token-ledger.tsv"
EXP_ID="${EXP_ID:-$(printf 'EXP-%03d' "$(grep -c '^## EXP-' "$WORKSPACE/experiments/EXPERIMENTS.md" 2>/dev/null || echo 0)")}"

mkdir -p "$PROPOSALS_DIR"

# Proposer models (diversity is the point — different architectures / sizes)
MODELS=("claude-opus-4-7" "claude-sonnet-4-6" "claude-haiku-4-5-20251001")
AGENT_NAMES=("opus" "sonnet" "haiku")

# Build context shared by all proposers
CONTEXT_FILE="$PROPOSALS_DIR/context.md"
cat > "$CONTEXT_FILE" <<EOF
## Profile (most recent)
$(ls -t "$WORKSPACE/experiments"/EXP-*/profile-results/*.txt 2>/dev/null | head -1 | xargs cat 2>/dev/null || echo "(no profile yet — classify from benchmark gap)")

## Benchmark baseline (most recent)
$(ls -t "$WORKSPACE/experiments"/EXP-*/bench-results/*.txt 2>/dev/null | head -1 | xargs cat 2>/dev/null || echo "(no benchmark yet)")

## Experiment history
$(cat "$WORKSPACE/experiments/EXPERIMENTS.md" 2>/dev/null || echo "(none yet)")

## Optimization playbook
$(cat "$WORKSPACE/.claude/program.md")
EOF

# Build proposer prompt files (one per agent — same content, separate files for parallelism)
for i in "${!MODELS[@]}"; do
  name="${AGENT_NAMES[$i]}"
  prompt_file="$PROPOSALS_DIR/prompt-$name.md"
  cat "$WORKSPACE/.claude/skills/select.md" > "$prompt_file"
  echo "" >> "$prompt_file"
  echo "---" >> "$prompt_file"
  cat "$CONTEXT_FILE" >> "$prompt_file"
done

echo "==> Selection phase — $EXP_ID — $TIMESTAMP" >&2
echo "==> Launching ${#MODELS[@]} proposer agents in parallel..." >&2

# Launch all proposers in parallel (token counts written to ledger by llm-call.py)
PIDS=()
for i in "${!MODELS[@]}"; do
  model="${MODELS[$i]}"
  name="${AGENT_NAMES[$i]}"
  $LLM \
    --model "$model" \
    --prompt-file "$PROPOSALS_DIR/prompt-$name.md" \
    --exp-id "$EXP_ID" \
    --phase "select-propose" \
    --agent-id "$name" \
    --ledger "$LEDGER" \
    --description "proposal" \
    > "$PROPOSALS_DIR/proposal-$name.md" 2>&1 &
  PIDS+=($!)
done

for pid in "${PIDS[@]}"; do wait "$pid" || true; done
echo "==> All proposers done." >&2

# Build chair prompt
CHAIR_MODEL="claude-opus-4-7"
CHAIR_PROMPT_FILE="$PROPOSALS_DIR/prompt-chair.md"
cat "$WORKSPACE/.claude/skills/chair.md" > "$CHAIR_PROMPT_FILE"
echo "" >> "$CHAIR_PROMPT_FILE"
echo "---" >> "$CHAIR_PROMPT_FILE"
echo "## Proposals to evaluate" >> "$CHAIR_PROMPT_FILE"
for i in "${!MODELS[@]}"; do
  name="${AGENT_NAMES[$i]}"
  echo "" >> "$CHAIR_PROMPT_FILE"
  echo "### Agent $((i+1)) — ${MODELS[$i]} ($name)" >> "$CHAIR_PROMPT_FILE"
  cat "$PROPOSALS_DIR/proposal-$name.md" >> "$CHAIR_PROMPT_FILE" 2>/dev/null || echo "(missing)" >> "$CHAIR_PROMPT_FILE"
done

echo "==> Chair agent ($CHAIR_MODEL) selecting winner..." >&2
CHAIR_OUT="$PROPOSALS_DIR/chair-decision.md"
$LLM \
  --model "$CHAIR_MODEL" \
  --prompt-file "$CHAIR_PROMPT_FILE" \
  --exp-id "$EXP_ID" \
  --phase "select-chair" \
  --agent-id "chair" \
  --ledger "$LEDGER" \
  --description "chair decision" \
  > "$CHAIR_OUT" 2>&1

echo "==> Done. Proposals: $PROPOSALS_DIR/" >&2
echo "==> Chair decision: $CHAIR_OUT" >&2

cat "$CHAIR_OUT"
