#!/usr/bin/env python3
"""
Call the Anthropic API with a prompt, print the response to stdout,
and write real token counts to the ledger.

Requires ANTHROPIC_API_KEY or CLAUDE_CODE_OAUTH_TOKEN in the environment.

Usage:
  python3 scripts/llm-call.py \
    --model claude-opus-4-7 \
    --prompt-file /path/to/prompt.txt \
    --exp-id EXP-001 \
    --phase select-propose \
    --agent-id opus \
    --ledger /path/to/token-ledger.tsv

Output:
  stdout  — model response text
  stderr  — progress lines prefixed with ##
  ledger  — one TSV row appended:
            exp_id, phase, agent_id, model,
            tokens_in, tokens_out, cost_usd, timestamp, description
"""
import argparse
import os
import sys
import time
from datetime import datetime


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--model",       required=True)
    parser.add_argument("--prompt-file", required=True)
    parser.add_argument("--exp-id",      default="EXP-000")
    parser.add_argument("--phase",       default="unknown")
    parser.add_argument("--agent-id",    default="agent")
    parser.add_argument("--ledger",      required=True)
    parser.add_argument("--description", default="")
    args = parser.parse_args()

    # Auth: prefer ANTHROPIC_API_KEY, fall back to CLAUDE_CODE_OAUTH_TOKEN
    api_key    = os.environ.get("ANTHROPIC_API_KEY")
    oauth_token = os.environ.get("CLAUDE_CODE_OAUTH_TOKEN")

    if not api_key and not oauth_token:
        print("## ERROR: set ANTHROPIC_API_KEY or CLAUDE_CODE_OAUTH_TOKEN", file=sys.stderr)
        print("##   ANTHROPIC_API_KEY  — API key from console.anthropic.com", file=sys.stderr)
        print("##   CLAUDE_CODE_OAUTH_TOKEN — run `claude setup-token` to generate", file=sys.stderr)
        sys.exit(1)

    with open(args.prompt_file) as f:
        prompt = f.read()

    import anthropic

    if api_key:
        client = anthropic.Anthropic(api_key=api_key)
    else:
        # OAuth token: pass as bearer via custom auth header
        client = anthropic.Anthropic(
            api_key="oauth",  # placeholder, overridden by header
            default_headers={"Authorization": f"Bearer {oauth_token}"},
        )

    print(f"## Calling {args.model} ({args.phase} / {args.agent_id})...", file=sys.stderr)
    t0 = time.time()

    message = client.messages.create(
        model=args.model,
        max_tokens=4096,
        messages=[{"role": "user", "content": prompt}],
    )

    elapsed    = time.time() - t0
    tokens_in  = message.usage.input_tokens
    tokens_out = message.usage.output_tokens

    # Cost estimation (input/output prices per MTok as of 2026-05)
    PRICES = {
        "claude-opus-4-7":          (15.0, 75.0),
        "claude-sonnet-4-6":        (3.0,  15.0),
        "claude-haiku-4-5-20251001": (0.8,   4.0),
    }
    p_in, p_out = PRICES.get(args.model, (3.0, 15.0))
    cost_usd = (tokens_in * p_in + tokens_out * p_out) / 1_000_000

    print(f"## Done in {elapsed:.1f}s — in={tokens_in} out={tokens_out} cost=${cost_usd:.4f}",
          file=sys.stderr)

    # Append to ledger
    timestamp = datetime.utcnow().strftime("%Y%m%dT%H%M%SZ")
    row = "\t".join([
        args.exp_id, args.phase, args.agent_id, args.model,
        str(tokens_in), str(tokens_out), f"{cost_usd:.6f}", timestamp, args.description
    ])
    with open(args.ledger, "a") as f:
        f.write(row + "\n")

    print(message.content[0].text)


if __name__ == "__main__":
    main()
