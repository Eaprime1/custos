# Concordance

*The named, kept. THEE catches what has no name yet; the concordance keeps the name once it arrives.*

`prima-clock: 202609251844`
`suit: ♦️ Diamond — working glossary, promoted from atelier/concordance.md (issue #128)`

---

## Scope

Both halves. **Lexemes** (the words custos coins) and **methods** (the processes that cost something to rediscover). The seed's open question — lexemes only, or both — is settled by its own first case: the claude-code-action billing trap was a method, not a word, and it was the entry that most needed keeping.

## How an entry is added

- One `###` heading per term, alphabetical within its half.
- Each entry: a one-line definition, where it lives (the source of truth), and when it was entered.
- A PR that coins a new term adds its entry here in the same PR. The `glossary-update` label marks it.
- The atelier seed (`atelier/concordance.md`) stays as the origin record. It holds the open threads (update mechanism, sibling tools) that aren't settled yet.

---

## Lexemes

### Granum

A seed before germination: carried, stored, reviewed, planted or held, but not yet rooted. It isn't a germ yet. A draft PR is the germination chamber, not final integration.
**Source:** `atelier/nav5-granum-anchor-review.md` · **Entered:** 202609251844

### Lumenar

The lit interaction zone where entities meet without becoming one another. It holds three pressures: lumen (the glow of exchange), liminal (the threshold between prime states) and arc (motion from arrival toward dispatch).
**Do not use it for:** the Field, the Unexusi layer, Ka, Plexus, Resonance, or any prime/pinnacle state.
**Source:** `world/symbols.md` · **Entered:** 202609251844

### now_here ↔ nowhere

The polarity axis between located and unlocated material: the same letters, spaced differently. Nowhere is pre-name material; now_here is named and in custody. The shadow well is the waiting state between them.
**Source:** `world/polarity.md`, `.shadow-well/README.md` · **Entered:** 202609251844

### prima-clock

A `YYYYMMDDHHMM` stamp that anchors an event in custody time. Generate it with `date '+%Y%m%d%H%M'`. MOAV carriers, registry rows and new `.md` files carry one.
**Source:** `prima-clock/registry.md`, `CLAUDE.md` · **Entered:** 202609251844

---

## Methods

### claude-code-action auth precedence

When a `claude-code-action` step declares both `anthropic_api_key` and `claude_code_oauth_token`, the API key silently wins and is billed, with no warning. The setup logs look identical right up until the SDK call fails with "Credit balance is too low". Pick one billing path per workflow and **comment out** the unused input; leaving it blank isn't enough.
**Status in custos:** audited 202609251844 (issue #127). `claude-code-review.yml` is the only workflow that uses the action, and it is OAuth-only with the key line commented.
**Source:** `atelier/concordance.md` ("First case for the methods side") · **Entered:** 202609251844

### Self-modifying-workflow OIDC validation

A PR that edits the workflow file `claude-code-action` runs from fails that workflow's `pull_request` run with `401 Workflow validation failed ... must exist and have identical content to the version on the repository's default branch`. GitHub is refusing to let a PR grant itself CI permissions. The failure is expected on every commit of that PR and clears once it merges, so don't chase it as a real bug.
**Source:** `atelier/concordance.md` · **Entered:** 202609251844

### Lexeme-development fallback

When a mission can't be completed as written, the contributor picks one lexeme or concept named in the issue, researches it against a citable source (Wikipedia preferred), and files a development note in `atelier/lexemes/`. An undefined term in the lore (a "great stag" nobody has described) becomes real content instead of a dead end.
**Source:** `docs/issue-system.md` · **Entered:** 202609251844
