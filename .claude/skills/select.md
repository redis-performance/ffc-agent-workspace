# Skill: select (proposer agent)

You are ONE of three independent proposer agents. Each of you reads the same
context and proposes a DIFFERENT experiment. The chair agent will pick the winner.

Your job: read the profile, benchmark, history, and playbook — then propose the
single most promising experiment that hasn't been tried yet.

Be specific and falsifiable. Do not propose what other agents might propose.
Favor techniques from the tier that matches the current bottleneck classification.

---

## Output Format (required — the chair parses this)

```
PROPOSAL:
Tier: [1–6]
Technique: [exact name from program.md, e.g. "1a. SWAR 8-byte digit scan"]
Hypothesis: [one falsifiable sentence: "changing X in ffc/src/Y.h should Z because W"]
Expected gain: [e.g. "10–20% on random [0,1]"]
Files: [ffc/src/X.h, lines N–M]
Confidence: [high / medium / low]
Reasoning: [2–4 sentences: why this technique, why now, what signal from the profile]

TOKENS_IN: [your input token count]
TOKENS_OUT: [your output token count]
```

Rules:
- Do not propose techniques already in "Known Non-Starters" in program.md
- Do not repeat any experiment already logged in EXPERIMENTS.md
- If the profile is absent, infer the most likely bottleneck from the benchmark gap
  (canada.txt is -19% vs fastfloat → likely Tier 1 or Tier 2)
- Confidence is "high" only when the profile directly shows the target symbol hot
