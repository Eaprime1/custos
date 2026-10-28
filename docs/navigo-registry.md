# Navigo Registry

`suit: ♦️ Diamond — active build`
`prima-clock: 202609292013`
`status: DRAFT — keys and unassigned numbers are proposals for the Shepherd to correct`

One place that says which navigo is which. A navigo is a paired team: one AI
model and eaprime1. The Shepherd can redirect any of them. Each navigo carries
three separate identifiers, so the naming schemes stop competing (see
`turns/CULTIVATION.md`):

| Identifier | Job | Changes? |
|---|---|---|
| **Key** | unique system id for one navigo *instance* (a particular notebook, workspace or seat) | never; never reused |
| **Number** | the team number that already exists (`nav1`, `navigo2`, `nav3`, `nav5`) | stays as it is |
| **Label** | the name the Shepherd uses in conversation, e.g. "Navigo Perplexity" | freely |

The number names the team (a model line paired with eaprime1). Several
instances of one team share its number and are told apart by key: a Gemini
notebook such as *Ethica Nexus* is `nav3` with its own key.

## Registry

| Key | Number | Label | Team | Workspace | Status |
|-----|--------|-------|------|-----------|--------|
| `nx-claude-main` | nav1 | Navigo Claude | Claude + eaprime1 | `.claude/` | active |
| `nx-gemini-ethica-nexus` | nav3 | Navigo Gemini Notebook (Ethica Nexus) | Gemini + eaprime1 | `.gemini/` | proposed |
| `nx-perplexity-main` | unassigned | Navigo Perplexity | Perplexity + eaprime1 | none yet | active |
| `nx-unexusi-main` | unassigned | Navigo Unexusi | the project as primary perspective | none | active |
| `nx-chatgpt-main` | nav5 | Navigo ChatGPT | ChatGPT + eaprime1 | `.chatgpt/` | proposed |
| `nx-gmail-main` | navigo2 | Navigo Gmail | Gmail + eaprime1 | none yet (`guides/navigo2-gmail-preturn.md`) | proposed |

**To confirm:**
- Every key above is a proposal. Only *Ethica Nexus* came from the Shepherd; the rest follow the same pattern.
- Perplexity and Unexusi have no number yet. `nav4` is free if the Shepherd wants it; otherwise the next free number is `nav6`.
- Perplexity's draft PRs refer to Claude as "Navigo2". That label belongs to row 1 (`nav1`), not to `navigo2` (Gmail). This is the one number conflict.
- Whether one team can hold several keys (as assumed for Gemini notebooks) or every instance needs its own number.

## Rules

1. **Assign a key on first appearance.** New navigo instance, new key, one PR to add the row. Format: `nx-<model>-<instance>`.
2. **Never reuse a key.** Retire a row by setting `status: retired`; do not delete it.
3. **Existing numbers stay.** A number changes only if two teams would share it by mistake, and then the Shepherd decides.
4. **Labels follow the Shepherd.** A rename is an edit to the Label column only.
5. **Seat holders use the key.** When the mission board records who holds a seat, it can write the key instead of a name that may change.

## What this does not change

CLAUDE.md's Navigo table is untouched until the Shepherd confirms the keys and
the two open numbers. Then it shrinks to a pointer at this file.
`turns/CULTIVATION.md` keeps the naming entry as deferred until then.

---

*THEE opens. YOD marks. EMBER warms. custos keeps.*
