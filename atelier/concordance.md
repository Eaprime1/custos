# Concordance — atelier seed

*nursery entry, filed 202606192040 — nothing here is finished*

## The Idea

A living glossary for custos's own lexemes — Lumenar, Hodie, Atelier, Sovran,
prima-clock, THEE/YOD/EMBER, MOAV, the suits, and whatever the Flock coins
next. Not a dictionary written once and forgotten: a concordance that updates
as part of the PR rhythm, so a new term doesn't outrun its own definition.

## Why now

Custos already mints lexemes faster than it tracks them. The Lumenar and
J-21 (PR #38) are the first formally reviewed examples — checked by hand
against the issue thread for collisions before being welcomed in. That
worked once, with two terms and one bounty. It will not scale by hand. A
concordance is the dictionary catching up to a practice that's already
underway.

## Where it sits

eaprime1 named the pattern this should follow: **Hodie is the pinnacle
workshop concept** — every workshop-type tool (icon manager, the
still-to-be-located Chinese-character manager, this concordance) is a
*type of* Hodie. **Atelier is the prima — the seed-stage before a workshop
exists.** This entry is that seed: an unnamed pattern, not yet a tool,
filed here so it has somewhere to grow from rather than living only in a
to-do document.

When it has a working pattern — even a rough one — it routes out of
atelier toward whatever becomes its Hodie-type home.

## First case for the methods side (filed 202606230135)

A live example of the "methods and processes" half of the scope question
above, before the concordance itself exists: `claude-code-action` accepts
both `claude_code_oauth_token` (subscription billing) and `anthropic_api_key`
(pay-per-use API credit billing) on the same step. When both are set, the
API key silently wins and gets billed — there's no warning, and the two
auth paths produce visually identical setup logs right up until the SDK
call itself fails. eaprime1 changed the API key several times trying to
fix a "Credit balance is too low" error before the actual pattern
(api_key takes precedence over oauth_token when both are present) was
traced through a full job log. That's exactly the kind of process
knowledge this concordance was proposed to hold — costly to rediscover,
cheap to write down once. First candidate entry once this file becomes a
real concordance: **"claude-code-action auth precedence"** → api_key over
oauth_token, fixed for `claude-code-review.yml` by commenting out the
api_key input (see that workflow's git history, commit titled "Switch
claude-code-review to OAuth-only billing").

A second pending entry, not yet nameable: a small set of lexemes that
drifted in meaning across many "polish and proceed" review passes — see
`atelier/ouroboros-wobble.md`'s "Lived example" section. The terms
themselves still need to be supplied by eaprime1 from prior conversation
transcripts before they can be entered here.

## Open threads (not yet decided)

- **Scope of the first pass.** Lexemes only (Lumenar, Hodie, Atelier, Ka,
  Plexus, Resonance...), or also methods and processes (prima-clock
  stamps, MOAV carriers, the suit system)? Eric's framing — "our unique
  lexemes and methods and processes" — points at both eventually, but the
  first seed is probably lexeme-only. Methods already have `CLAUDE.md` as
  their concordance.
- **Update mechanism.** Does a PR introducing a new term get a
  bot/script check — a sibling to `scan_lexeme.sh`, but flagging new
  coinages instead of unfilled placeholders — or does Sentinel review
  catch it by hand, the way the Lumenar check was done on PR #38?
- **Sibling tools.** An icon manager and a Chinese-character manager are
  mentioned as existing or wanted, locations not yet known. Once found,
  these and the concordance are likely the same family of Hodie-type
  tools (structured lookup/reference systems) and might share one pattern
  rather than each being built from scratch.
- **The conversion-interaction idea.** A related but separate notion
  surfaced alongside this one: a custos-side interaction where external
  contributors can convert a submission into custos's preferred file
  type (the generalized form of the `.docx`/`.md` question from PR #40).
  Eric placed this "in the terminus, THEE Lumenar" — a THEE-triad-style
  intake step living at the Lumenar (the exchange zone where a
  contributor's work meets custos's preferences), not a hard requirement
  imposed on contributors. Worth its own atelier seed rather than folding
  in here — format conversion and term-tracking solve different problems,
  even though both surfaced in the same conversation.

## A thought to add

THEE already exists as "the listening practice for capturing fragments
before they have names" (`CLAUDE.md`). A concordance is almost the
inverse motion — capturing a fragment *after* it has a name, so the name
doesn't get lost. The two could be siblings: THEE catches the unnamed,
the concordance keeps the named.

---

*Filed by Claude, prima-clock 202606192040. Not commissioned, not scoped,
not ready — that's the point of atelier.*
