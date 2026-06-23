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
