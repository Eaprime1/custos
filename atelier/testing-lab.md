# The Testing Lab — atelier seed

*nursery entry, filed 202606200005 — nothing here is finished*

## The Idea

Underwriters Laboratories listed, but not Underwriters Laboratories run. A
testing lab for custos, inspired by the UL model of independent
verification before something ships — but self-administered, because in
Certified, but not run by the certifying body. A
testing lab for custos, inspired by independent stress-testing models
for certification before something ships — but self-administered, because in
the Navigo perspective we are already the ones creating and monitoring
what we build. A full development testing process, scoped to what
actually makes sense to test in-house rather than imported wholesale from
an external-certification model that assumes the builder and the verifier
are different parties.

Scope is broad on purpose: code, documents, HTML, workflows — anything
that enters the fold and needs a place to be checked before (or instead
of) trusting it on faith. Not one tool. A location — a lab — that the
growing list of test-shaped work can converge on.

## Why now

PR #42 (`finalize-pr.yml`) needed a real test before anyone could trust
it: a small PR, an open review thread to check the refusal path, then a
resolved thread to check the happy path. That test was done ad hoc,
assembled by hand for this one occasion. The realization underneath it:
this won't be the last thing we need to test this way, and there's
nowhere yet that this kind of testing *lives*. The test itself is the
evidence that the lab needs to exist — not a hypothetical future need.

## Where it sits

Self-administered, Navigo-perspective testing — not a recreation of
external UL-style certification. We hold our own accountability here
external certification-style stress testing. We hold our own accountability here
(the same shepherd-accountability custos already does for everything
that enters). Per `atelier/README.md`, this starts as a nursery entry:
unnamed, unscoped, routed out to a proper home once a working pattern
emerges.

## Open threads (not yet decided)

- **Where it lives.** A `lab/` directory? A branch per
  `branch-tracker/branches.md`'s ♦️ Diamond pattern, developing toward its
  own destination repo? Not yet chosen.
- **What it tests, concretely.** Workflow files (like `finalize-pr.yml`),
  quest completion checks, lore consistency, generated HTML/docs — likely
  all of these eventually, but the first pattern should probably start
  with one category rather than all at once.
- **Relationship to existing checks.** `tools/scan_lexeme.sh` and the
  DeepSource/Codacy analyzer grid already do some testing. Is the lab a
  home for *new* test types these don't cover (workflow behavior,
  multi-step scenarios), or does it eventually gather the existing checks
  under one roof too?
- **The growing list.** As more gets automated, the lab's scope adapts —
  this entry is the first draft of a pattern meant to be built upon, not
  a finished spec.

---

*Filed by Claude, prima-clock 202606200005. Not commissioned, not scoped,
not ready — that's the point of atelier. Enjoy the journey.*
