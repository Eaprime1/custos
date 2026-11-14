# Review Surface

`prima-clock: 202609251844`

*What the review bots noticed, in one plain sentence each, and whether it matters.*

Append only. One `##` entry per PR. No JSON, no tables of findings, no code blocks. If every flag was noise, say so in one line. Implements Shepherd zero-point 3 (issue #321).

Entry shape:

```
## PR #N — title
prima-clock: YYYYMMDDHHMM
- Bot name: what it noticed. Actionable / noise, and why.
```

---

## PR #319 — pandora: navigo2 preturn germ (Gmail stream / Breathe II Act II)
prima-clock: 202609210713

- ECC Tools: flagged seven "Missing" items against a software-project checklist. Noise, because custos is a lore and quests repo, not the software corpus that checklist was written for.
- Copilot: cited `.artesian/mission-custos-voices-aequitas-triad.md` and `.artesian/README.md` as existing when, at that moment, neither did. Noise, a hallucinated reference. Both files have since been created (issue #324).
- Claude review: completed clean, and all four review threads were resolved before merge. Nothing outstanding.

All bot findings on #319 were noise, apart from the review threads the review itself resolved.

## PR #343 — Issue system: labels, claims, no-cash rewards, Bot Brief, lexeme fallback
prima-clock: 202609270322

- Claude review: failed on a subscription session limit, not on the code. Re-run once after the reset and passed.
- Earlier bot findings: the stale plan-doc line on auto-close and `open` left on claimed issues. Actionable. Both fixed before the review above.
- DeepSource: grade A. Codacy: clean after Eric's update.

## PR #356 — Review packet: API-free PR summary; paid review only on request
prima-clock: 202609270305

- codereviewbot-ai: five findings (removed-file letter, null user, duplicate hits, misleading text, non-draft trigger). Actionable. All fixed.
- codereviewbot-ai: the packet was missing the template's "What Door" section. Actionable. Fixed.
- DeepSource, Codacy: clean.

## PR #367 — Seal-cue guard, whole-word packet scan, Latin cue record
prima-clock: 202609270405

- Codacy: three minor comprehensibility findings in CLAUDE.md: one compound bullet, then two lines starting with a pronoun. Actionable. Fixed.
- codereviewbot-ai: LGTM. DeepSource: grade A.

## PR #342 — docs: extend CONTRIBUTING.md — world/ vs tools/ routing guidance
prima-clock: 202609270422

- Claude review: the `atelier/` wording contradicted CLAUDE.md. Actionable. Fixed.
- codereviewbot-ai: the retired `bounty` label was still used. Actionable. Fixed, and the section heading was renamed.
- Review packet: all template sections were missing from the description. Actionable. The description was written from the diff.

## PR #405 and #420: math display nit
prima-clock: 202610070905

- nav5 (#420): the \(90^\circ\) math display in the Shadow of Polaris README may not render everywhere. Optional. Not changed.
- A bot thread on #405 flagged a math block as broken. My first reading of it was wrong (it was fine); answered and resolved on the thread.

## PR #426 — Scanner stops flagging replace/unknown; Shadow of Polaris scene index and checklist
prima-clock: 202610070905

- Codacy: a 48-word sentence in CLAUDE.md. Actionable. Fixed (split into bullets).
- Codacy: an undefined-acronym finding on a shouted marker word in CLAUDE.md. Actionable, minor. A gloss and a glossary did not clear it; pointing CLAUDE.md at the glossary did.
- Review packet: listed the words the scanner had just retired. Noise: it runs the old matching from main until the PR merges.
- Copilot: could not review, its quota was used up. Noise.
- DeepSource: grade A. claude[bot] review (ran on the ai-review label): no comments.
