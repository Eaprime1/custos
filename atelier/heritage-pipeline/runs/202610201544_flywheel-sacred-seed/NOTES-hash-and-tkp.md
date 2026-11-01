# Notes: the embedded hash, and TKP

`suit: ♦️ Seed — structure forming`
`Prima-clock: 202611011732`
`status: notes and suggestions for the Shepherd, added to the Finish the Conversation package at his request (anchor 202611010921, read as Pacific; 202611011721 UTC). Nothing here is decided. Tracked as rows 2 and 4 of custos issue #510.`

*Two places where the SOP and the Atrium decisions part ways. Each note says what the SOP asks, what has been
verified, what this package does about it, and a suggestion. Suggestions are marked as such.*

---

## 1. The embedded hash

**What the SOP asks.** Stage IV and section IV: every finished PR Journey carries a five-part Makers Mark
Passport, and mark 4 ("UL Listed") is a SHA-256 *inside* that block, so the document carries its own hash.

**What is verified** (from the engine test of 202610131200, `DRAFT-202610131200.md` section 7; the engines are
still not in custos, so it was not re-run today):

- Running the collapse engine and then the makers engine's `verify` on the same PR Journey gave **TAMPERED**.
- The cause was two different rules for which text is hashed. One tool strips anything between `---` lines
  as front matter; the other hashes the body with a plain `strip()`. A passport inside the file it covers
  forces every tool to agree on a stripping rule, and two tools did not.

**What is ratified.** For origins: SHA-256 of the exact bytes, the hash in a file *beside* the origin, and
`sha256sum -c` as the authority (Armarium `RULES.md` section 1, rules 1 to 4). Rule 5 covers the older case:
where a document must carry an embedded passport, the hash covers everything before **one exact marker line**,
in one shared module, tested against `sha256sum` on the same bytes.

**What this package does.** Nothing is embedded. `seeds.json`, the Active Reference and `PLAN.md` carry no
passport and no hash. The hash of this thread's origin goes beside it in the Armarium once an exact-bytes
export exists (`PLAN.md` section 8, question 2).

**Suggestion, for the derived documents (PR Journey, Active Reference) the SOP wants sealed.** My reading; the
Shepherd chooses.

| Option | How | For | Against |
|---|---|---|---|
| **A. Sidecar** (suggested) | The passport is its own file, `<name>.passport.json`, next to the document. Its hash field is the SHA-256 of the document's exact bytes. | No stripping rule exists, so no two tools can disagree. Same logic as the ratified origin rule. A changed document fails `sha256sum -c`. | The passport is no longer one file with the document. |
| **B. Embedded, one marker** | The passport sits at the end, below one exact marker line. The hash covers every byte before it. | Keeps the SOP's "one sealed document". | Needs the shared module and its test forever. The marker must be unique, so a body that quotes it breaks the rule. |

**Tests either option should pass** before anyone relies on it:

1. Collapse, then verify, on a small fixture: passes (today's result is TAMPERED).
2. Change one character of the document: verify fails.
3. Swap CRLF for LF: verify fails (exact bytes).
4. Option B only: change the passport block alone, and the hash does not change. Add a second marker line,
   and the document is rejected.
5. The engine's hash equals `sha256sum` of the same bytes, character for character.

**A smaller note.** The SOP's franking mark is 17 digits (milliseconds) and the repo's stamps are 12. That is
row 8 of the issue. Whichever option is chosen, the stamp inside the passport must not be part of what a
stripping rule has to guess at.

---

## 2. TKP

**What the SOP asks.** Stage III evaluates Total Ka Pressure with a threshold of 0.75, and step 1 of the
checklist reads: "Verify thread has achieved completion (TKP ≥ 0.75)." So TKP is used as the test for *done*.

**What is verified** (same engine test, `DRAFT` sections 6 and 7):

- The Sanctum text scored **0.99**, the cap. A plain paragraph scored **0.50**, the floor.
- The 0.75 gate passes any text with enough headings and symbols, so it cannot tell texts apart at the top.
- The collapse engine's value grows with length: `€C = words × 0.05 + TKP × 20` and
  `Ξ = words / 30 + TKP × 10`. The run gave 851.0 €C and 564 Ξ, and a 150-word note at the same TKP gives about
  27 €C, so padding raises the number.

**What this package does.** No TKP is claimed for this thread. The engines are not in custos, so none was
computed, and the gate stays **pending**. Whether the thread is complete is the Shepherd's judgment, and the
manual gate in `PLAN.md` section 6 stands in until he decides otherwise.

**Suggestions.** Mine; the Shepherd decides.

1. **Do not use TKP as the test for "done".** What it measures is structure markers, not completion. Completion
   is a decision, and the Shepherd already holds the Right of No. Replace the Ka Pressure Audit with the
   pass/fail checklist (prompt P6 in `DRAFT` section 10 is the by-hand form).
2. **If TKP stays, keep it as information only.** Report its parts, not one number. No length term, so words never
   raise it. Bounded and banded, in line with what the Shepherd decided on 202610131229 (`DRAFT` section 0).
3. **Give it negative controls** so it can be trusted: (a) the same text with many added headings and symbols
   and no new content must not pass; (b) the same text pasted twice must not score higher.
4. **Record the tool version** with every value, and report the median and the maximum across a ledger so
   inflation shows early (`DRAFT` section 6, principle 5).

---

## 3. Where this goes next

- Issue #510 rows 2 and 4 carry both questions. The Shepherd's answers go there.
- The Armarium branch `hopechest/origins` exists (`PLAN.md` section 9) but holds no origin.

**Open for the Shepherd:** option A or B for derived documents, and whether the TKP gate is retired, kept as
information, or kept as it is.

---

**prima-clock:** 202611011732
**witnessed:** false
