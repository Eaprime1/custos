# Ouroboros Wobble

## The Loop That Doesn't Close

A pattern observed in collaborative review: a loop between collaborators that doesn't quite close, with a deliberate "wobble" as the safety/skill mechanism.

## Lived Example

**Drifted lexeme(s):** [To be filled by eaprime1 after reviewing old conversation transcripts]

**Original meaning:** [Original meaning of the drifted word(s)]

**Current (drifted) meaning:** [Current meaning after cumulative drift]

## Wobble Mechanism Proposal

To flag when a word's meaning is shifting during a polish pass, before it lands silently:

1. **Lexeme drift tracker**: Maintain a lightweight concordance (`atelier/concordance.md`) that records each collaborator's usage of key terms per review pass. If a term's definition or context shifts by more than a configurable threshold (e.g., cosine similarity < 0.9 in embedding space, or a simple human-flagged delta), flag it.
2. **Pass annotation**: During each "polish and proceed" pass, annotate any term whose usage feels slightly off from its prior definition. This can be a comment or a diff in the concordance.
3. **Cumulative drift alert**: After N passes (e.g., 3), if a term has been flagged in more than half of them, surface a warning: "This word may have drifted. Review its original definition."
4. **Manual override**: Allow collaborators to explicitly reset a term's definition if the drift is intentional (e.g., a new shared understanding).

This mechanism leans on `atelier/concordance.md` once that's live (see the linked mission issue).