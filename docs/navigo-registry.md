# Navigo Registry

`suit: ♦️ Diamond — active build`
`prima-clock: 202609291942`
`status: DRAFT — numbers and labels are proposals for the Shepherd to correct`

One place that says which navigo is which. It settles the naming conflict in
`turns/CULTIVATION.md` by giving each scheme a different job:

- **The number is the identity.** Assigned once, in order of first appearance,
  never reused. A retired navigo keeps its row.
- **The label is the name people use.** It can change without renumbering anything.

A navigo is a paired team: one AI model and eaprime1. The Shepherd can redirect any of them.

## Registry

| # | Label | Team | Workspace | Legacy name | Status |
|---|-------|------|-----------|-------------|--------|
| 1 | Navigo Claude | Claude + eaprime1 | `.claude/` | nav1 | active |
| 2 | Navigo Perplexity | Perplexity + eaprime1 | none yet | none | active |
| 3 | Navigo Unexusi | the project as primary perspective | none | none | active |
| 4 | Navigo Gemini | Gemini + eaprime1 | `.gemini/` | nav3 | proposed |
| 5 | Navigo ChatGPT | ChatGPT + eaprime1 | `.chatgpt/` | nav5 | proposed |
| 6 | Navigo Gmail | Gmail + eaprime1 | none yet (`guides/navigo2-gmail-preturn.md`) | navigo2 | proposed |

Perplexity's draft PRs refer to Claude as "Navigo2"; that label belongs to row 1, not row 2.

**To confirm:** the order above is a guess from what the repo shows, not from
the true first appearance of each navigo. Rows 4–6 also collide with the
legacy numbers (nav3 is Gemini in CLAUDE.md, but #3 here is Unexusi). Renumber
freely; the rules below hold whatever the numbers turn out to be.

## Rules

1. **Assign on first appearance.** New navigo, next free number, one PR to add the row.
2. **Never reuse a number.** Retire a row by setting `status: retired`; do not delete it.
3. **Labels follow the Shepherd.** A rename is an edit to the Label column only; history keeps the old label in Legacy name.
4. **Legacy names stay readable.** `nav1`, `nav3`, `nav5` and `navigo2` in older files still resolve through the Legacy name column.
5. **Seat holders use the number.** When the mission board records who holds a seat, it can write `#1` instead of a name that may change.

## What this does not change

CLAUDE.md's Navigo table is untouched until the Shepherd confirms the numbers.
Then it shrinks to a pointer at this file. `turns/CULTIVATION.md` keeps the
naming entry as deferred until then.

---

*THEE opens. YOD marks. EMBER warms. custos keeps.*
