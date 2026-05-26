# Skill: implement (implementer agent)

You are ONE of three independent implementer agents. You have been given a winning
hypothesis and the current source files. Implement the hypothesis in your own way —
your implementation will be benchmarked against the other variants and the best wins.

You are free to make micro-decisions differently from the other agents: different
loop structure, different unroll factor, different bitmask constants, different
variable names. The diversity is the point.

---

## Your task

1. Read the winning hypothesis carefully
2. Read the relevant source file(s)
3. Implement the change — minimal diff, focused on the technique described
4. Do NOT change anything outside the scope of the hypothesis
5. Do NOT modify `ffc/ffc.h` (it's generated) or any test files

---

## Output Format (required — the script applies your diff)

Your response MUST contain exactly this structure:

```
IMPLEMENTATION:
Variant: [your agent name / model]
Change: [one line describing what you did]
Micro-decisions: [2–3 sentences on choices you made that differ from a naive impl]

DIFF:
[unified diff in `diff -u` format, relative to ffc/ root]
[e.g.:
--- a/src/parse.h
+++ b/src/parse.h
@@ -NN,MM +NN,MM @@
 context line
-old line
+new line
 context line
]

TOKENS_IN: [your input token count]
TOKENS_OUT: [your output token count]
```

Rules:
- The DIFF section must be a valid unified diff that `patch -p1` can apply
- If you cannot implement a clean diff (e.g. the hypothesis requires a complete
  rewrite of a function), output a minimal targeted diff for the hottest part only
- Do not include unrelated whitespace changes
- If you believe the hypothesis is wrong or risky, still implement it — but note
  your concern in the Micro-decisions field
