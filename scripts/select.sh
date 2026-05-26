#!/usr/bin/env bash
# Selection phase: 3 proposer agents (different models) independently propose the
# next experiment, then a chair agent picks the winner.
#
# Output: experiments/proposals/TIMESTAMP/ with one file per agent + chair decision
# Stdout: the winning proposal (for piping into implement.sh)
set -euo pipefail

WORKSPACE="$(cd "$(dirname "$0")/.." && pwd)"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
PROPOSALS_DIR="$WORKSPACE/experiments/proposals/$TIMESTAMP"
LEDGER="$WORKSPACE/experiments/token-ledger.tsv"
EXP_ID="${EXP_ID:-$(printf 'EXP-%03d' "$(grep -c '^EXP-' "$WORKSPACE/experiments/EXPERIMENTS.md" 2>/dev/null || echo 0)")}"

mkdir -p "$PROPOSALS_DIR"

# Proposer models (diversity is the point)
MODELS=("claude-opus-4-7" "claude-sonnet-4-6" "claude-haiku-4-5-20251001")
AGENT_NAMES=("opus" "sonnet" "haiku")

# Build context shared by all proposers
CONTEXT="$(cat <<EOF
## Profile (most recent)
$(ls -t "$WORKSPACE/experiments/profile-results"/*.txt 2>/dev/null | head -1 | xargs cat 2>/dev/null || echo "(no profile yet — classify from benchmark gap)")

## Benchmark baseline (most recent)
$(ls -t "$WORKSPACE/experiments/bench-results"/*.txt 2>/dev/null | head -1 | xargs cat 2>/dev/null || echo "(no benchmark yet)")

## Experiment history (last 5)
$(tail -100 "$WORKSPACE/experiments/EXPERIMENTS.md" 2>/dev/null || echo "(none yet)")

## Optimization playbook
$(cat "$WORKSPACE/.claude/program.md")
EOF
)"

PROPOSER_PROMPT="$(cat "$WORKSPACE/.claude/skills/select.md")

---
$CONTEXT"

echo "==> Selection phase — $EXP_ID — $TIMESTAMP" >&2
echo "==> Launching ${#MODELS[@]} proposer agents in parallel..." >&2

# Launch all proposers in parallel
PIDS=()
for i in "${!MODELS[@]}"; do
  model="${MODELS[$i]}"
  name="${AGENT_NAMES[$i]}"
  out="$PROPOSALS_DIR/proposal-$name.md"
  echo "    Agent $((i+1))/${#MODELS[@]}: $model" >&2
  claude --model "$model" --print "$PROPOSER_PROMPT" > "$out" 2>/dev/null &
  PIDS+=($!)
done

# Wait for all
for pid in "${PIDS[@]}"; do wait "$pid" || true; done
echo "==> All proposers done." >&2

# Log tokens from each proposal
for i in "${!MODELS[@]}"; do
  name="${AGENT_NAMES[$i]}"
  out="$PROPOSALS_DIR/proposal-$name.md"
  tokens_in="$(grep -oP 'TOKENS_IN:\s*\K[0-9]+' "$out" 2>/dev/null | tail -1 || echo 0)"
  tokens_out="$(grep -oP 'TOKENS_OUT:\s*\K[0-9]+' "$out" 2>/dev/null | tail -1 || echo 0)"
  echo -e "$EXP_ID\tselect-propose\t$name\t${MODELS[$i]}\t$tokens_in\t$tokens_out\t$TIMESTAMP\tproposal" >> "$LEDGER"
done

# Chair agent: reads all proposals and picks the winner
CHAIR_MODEL="claude-opus-4-7"
CHAIR_PROMPT="$(cat "$WORKSPACE/.claude/skills/chair.md")

---
## Proposals to evaluate

$(for i in "${!MODELS[@]}"; do
  name="${AGENT_NAMES[$i]}"
  echo "### Agent $((i+1)) — ${MODELS[$i]}"
  cat "$PROPOSALS_DIR/proposal-$name.md" 2>/dev/null || echo "(missing)"
  echo ""
done)"

echo "==> Chair agent ($CHAIR_MODEL) selecting winner..." >&2
CHAIR_OUT="$PROPOSALS_DIR/chair-decision.md"
claude --model "$CHAIR_MODEL" --print "$CHAIR_PROMPT" > "$CHAIR_OUT" 2>/dev/null

tokens_in="$(grep -oP 'TOKENS_IN:\s*\K[0-9]+' "$CHAIR_OUT" 2>/dev/null | tail -1 || echo 0)"
tokens_out="$(grep -oP 'TOKENS_OUT:\s*\K[0-9]+' "$CHAIR_OUT" 2>/dev/null | tail -1 || echo 0)"
echo -e "$EXP_ID\tselect-chair\tchair\t$CHAIR_MODEL\t$tokens_in\t$tokens_out\t$TIMESTAMP\tchair decision" >> "$LEDGER"

echo "==> Chair decision saved to $CHAIR_OUT" >&2
echo "==> Proposals saved to $PROPOSALS_DIR/" >&2

# Print the chair decision to stdout (for piping or reading)
cat "$CHAIR_OUT"
