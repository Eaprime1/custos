# Ouroboros Wobble

## The Loop That Doesn't Quite Close

A pattern observed in collaborative editing: a loop between collaborators where each "polish and proceed" pass nudges a word toward a near-synonym, the cumulative drift invisible until someone goes back through old conversation transcripts. Nobody is wrong in any single pass — the loop just never closes back on its starting point.

## Lived Example

**Drifted lexeme(s):** `"refine"` → `"polish"` → `"smooth"` → `"streamline"` → `"refine"` (but now meaning "make more efficient" rather than original "make more precise")

| Original meaning | Current (drifted) meaning |
|-----------------|---------------------------|
| "refine" = make more precise, remove impurities | "refine" = make more efficient, optimize flow |

**Context:** In review passes of documentation for the `custos` project, the word "refine" was used initially to mean "remove ambiguity and tighten precision." Over successive passes, it was replaced with "polish" (which carries a connotation of surface-level improvement), then "smooth" (implying removal of friction), then "streamline" (implying efficiency gains), and finally back to "refine" — but now with the meaning of "make more efficient" rather than the original "make more precise." The shift was subtle: each replacement was contextually appropriate, but the cumulative effect changed the semantic anchor.

## Wobble Mechanism Proposal

A lightweight mechanism to flag "this word's meaning is shifting" during a polish pass, before it lands silently:

1. **Lexeme drift detector** — A small script (e.g., `bin/drift-detect`) that compares word usage across git history. It looks for words that have been replaced by near-synonyms in consecutive commits, then flags when a word reappears after being replaced. The script outputs a report like:
   ```
   WARNING: 'refine' was replaced by 'polish' in commit abc123, then 'polish' by 'smooth' in def456, then 'smooth' by 'streamline' in ghi789, then 'streamline' by 'refine' in jkl012. Possible semantic drift.
   ```

2. **Integration with `atelier/concordance.md`** — Once the concordance is live, the drift detector can cross-reference word usage against the concordance's definitions. If a word is used in a way that deviates from its concordance entry, the detector flags it.

3. **Pre-commit hook** — A git pre-commit hook that runs the drift detector on the staged changes. If drift is detected, the commit is blocked with a warning and a suggestion to review the word choice.

4. **Manual review trigger** — A comment syntax `[wobble: <word>]` that can be added to a commit message or PR description to explicitly mark a word as potentially drifted. The detector then tracks that word across future changes.

This mechanism is intentionally lightweight — it doesn't prevent drift, but it makes it visible before it becomes entrenched.

## Hypothetical Origin

Filed as a hypothetical in 202606200005. The lived instance was identified by eaprime1 through careful re-reading of old conversation transcripts.
# Ouroboros, the Nth-Radian Wobble, and the Commission Creator — atelier seed

*nursery entry, filed 202606200005 — nothing here is finished*

## The Idea

A loop that doesn't quite close. The ouroboros eats itself — a perfect
circle, no seam. Custos's version wobbles by some Nth radian instead: a
deliberate imperfection in the loop that keeps it from becoming a closed
system devouring itself blindly. The wobble is the safety mechanism. It's
also a trait or skill — something earned, not assumed. No one engages the
full Möbius loop without first earning the wobble: the prerequisite,
certification, or demonstrated knowledge that proves they know how to
exit before they're allowed to enter.

The wobble itself isn't fixed. As whoever holds it grows more capable,
the wobble shrinks — fewer radians of correction needed to get back out.
Skill earned reduces the friction of using the skill.

A second, related idea surfaced alongside it: a **commission creator** —
a system for generating commissions, where "commission" is the general
word for missions, bounties, quests, adventures, or whatever shape the
work takes. Requests come in, the commission creator shapes them into the
right type of commission, and these converge at one point before being
distributed back out (a diaspora) to whoever or whatever takes them on.

## Why now

Raised in the same conversation as the Testing Lab seed
(`atelier/testing-lab.md`), as a way of thinking about how custos holds
itself accountable for its own automation as it grows — described as
custos's nature: a loop, a Möbius, but with the Nth-radian wobble instead
of pure self-consumption. The framing offered was explicit: this is a
safety mechanism *and* a skill to be earned, in that order — gate the
loop behind the wobble, not the other way around.

## Open threads (not yet decided)

- **What "engaging the loop" actually means in custos.** Recursive
  automation? Self-modifying workflows? A specific feature, or a design
  principle applied across several? Not yet pinned to anything concrete.
- **How the wobble is earned.** What does the prerequisite/cert/knowledge
  check look like in practice — a quest, a review, a demonstrated track
  record? `quests/` already has a dependency system (`requires`/
  `unlocks`) that might be the natural home for this once it's concrete.
- **Commission creator vs. existing templates.** `.github/ISSUE_TEMPLATE/
  mission.yml` and `bounty.yml` already cover two commission types by
  hand. Is the commission creator a generalization of these two into one
  system, or a new layer that sits above them and decides which template
  applies?
- **Convergence point and diaspora.** Where commissions converge before
  distribution isn't named yet — possibly related to the Testing Lab
  (a place things pass through before going out), possibly its own
  separate location.
- **Relationship to the Testing Lab.** Both seeds came from the same
  conversation and both describe places things converge before moving on.
  Worth checking, once either has a working pattern, whether they're the
  same convergence point wearing two names or genuinely separate.

---

*Filed by Claude, prima-clock 202606200005. Not commissioned, not scoped,
not ready — that's the point of atelier. Enjoy the journey.*
