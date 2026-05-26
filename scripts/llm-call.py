#!/usr/bin/env python3
"""
Call the Anthropic API with a prompt, print the response to stdout,
and write real token counts to a ledger row on stderr.

Usage:
  python3 scripts/llm-call.py \
    --model claude-opus-4-7 \
    --prompt-file /path/to/prompt.txt \
    --exp-id EXP-001 \
    --phase select-propose \
    --agent-id opus \
    --ledger /path/to/token-ledger.tsv

Output:
  stdout  — model response text (for further processing)
  stderr  — progress/debug lines prefixed with "##"
  ledger  — one TSV row appended: exp_id, phase, agent_id, model,
            tokens_in, tokens_out, timestamp, description
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

    with open(args.prompt_file) as f:
        prompt = f.read()

    api_key = os.environ.get("ANTHROPIC_API_KEY")
    if not api_key:
        print("## ERROR: ANTHROPIC_API_KEY not set", file=sys.stderr)
        sys.exit(1)

    import anthropic
    client = anthropic.Anthropic(api_key=api_key)

    print(f"## Calling {args.model} ({args.phase} / {args.agent_id})...", file=sys.stderr)
    t0 = time.time()

    message = client.messages.create(
        model=args.model,
        max_tokens=4096,
        messages=[{"role": "user", "content": prompt}],
    )

    elapsed = time.time() - t0
    tokens_in  = message.usage.input_tokens
    tokens_out = message.usage.output_tokens
    response   = message.content[0].text

    print(f"## Done in {elapsed:.1f}s — in={tokens_in} out={tokens_out}", file=sys.stderr)

    # Append to ledger
    timestamp = datetime.utcnow().strftime("%Y%m%dT%H%M%SZ")
    row = "\t".join([
        args.exp_id, args.phase, args.agent_id, args.model,
        str(tokens_in), str(tokens_out), timestamp, args.description
    ])
    with open(args.ledger, "a") as f:
        f.write(row + "\n")

    # Response to stdout (no self-reported token noise)
    print(response)

if __name__ == "__main__":
    main()
