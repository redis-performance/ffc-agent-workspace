#!/usr/bin/env bash
# Agent-agnostic shim. Set AGENT=claude|codex|aider (default: claude).
# Usage: AGENT=claude ./scripts/agent-run.sh <skill> [args...]
set -euo pipefail

WORKSPACE="$(cd "$(dirname "$0")/.." && pwd)"
AGENT="${AGENT:-claude}"
SKILL="${1:-optimize}"
shift || true
ARGS="${*:-}"

SKILL_FILE="$WORKSPACE/.claude/skills/$SKILL.md"
if [[ ! -f "$SKILL_FILE" ]]; then
  echo "ERROR: skill '$SKILL' not found at $SKILL_FILE" >&2
  echo "Available skills: $(ls "$WORKSPACE/.claude/skills/" | sed 's/\.md//' | tr '\n' ' ')" >&2
  exit 1
fi

PROMPT="$(cat "$SKILL_FILE")"
if [[ -n "$ARGS" ]]; then
  PROMPT="$PROMPT

Args: $ARGS"
fi

case "$AGENT" in
  claude)
    if ! command -v claude &>/dev/null; then
      echo "ERROR: claude CLI not found. Install: npm i -g @anthropic-ai/claude-code" >&2
      exit 1
    fi
    cd "$WORKSPACE"
    exec claude --print "$PROMPT"
    ;;
  codex)
    echo "ERROR: codex backend not yet wired" >&2
    exit 1
    ;;
  aider)
    echo "ERROR: aider backend not yet wired" >&2
    exit 1
    ;;
  *)
    echo "ERROR: unknown AGENT=$AGENT (supported: claude, codex, aider)" >&2
    exit 1
    ;;
esac
