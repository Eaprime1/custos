# atelier/lexemes: lexeme development notes

`prima-clock: 202609251844`

A term used but never defined is a door nobody has opened. Each note here opens one: it takes a lexeme or concept named somewhere in custos, grounds it in a citable source, and asks what it could mean *here*.

This is also the **fallback path** for any mission that can't be done as written (`docs/issue-system.md` §6).

Notes here are seeds, not canon. The Shepherd decides what graduates to `world/concordance.md` or into lore.

## Shape of a note

File: `atelier/lexemes/<slug>.md`, one term per file.

```markdown
# <term>

prima-clock: YYYYMMDDHHMM
source: <URL — Wikipedia preferred; any citable source>
found-in: <issue #N, or the file where the term appears undefined>
fallback-for: <issue #N, if this note was taken as a mission fallback — else omit>

## What the source says
Three to six sentences, in your own words, faithful to the source.

## What it could do in custos
How the source meaning could shape the term here. Offer possibilities; don't
declare canon. Mark anything speculative as proposal.

## Open questions
One to three questions the Shepherd would need to answer to make it canon.

## Sense check
- Does this answer what was asked?
- Would a stranger follow it?
- Did I invent history? (any "this happened" claim has an anchor or is marked proposal)
```

## Completion check

```bash
f=$(git diff --name-only --diff-filter=A origin/main -- 'atelier/lexemes/*.md' | head -1); \
  test -n "$f" && grep -qi "^source:" "$f" && grep -qi "^## sense check" "$f" && echo "lexeme note ready: $f"
```
