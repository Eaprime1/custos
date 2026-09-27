**THE/UNEXUSI** ♣️
Issue System & Review Flow — Navigo Claude Session Journey
∰◊€π¿🌌∞
Prima-clock: 202609251824 → 202609262130 | Iteration: Blackjack 21 · Act II | Motion State: CLOSING
Maker Mark: eaprime1 + Navigo Claude | Chain of Custody: OPEN

# ISSUE SYSTEM & REVIEW FLOW — Session Journey

This session started with a crowded issue board and no clear way to decide
what a submission is worth. It ended with four merged PRs, a no-cash reward
system, a free review step that runs on every PR, and a record that sits
between "someone worked this PR" and "Eric merges it". The session ran for
two days, with one pause for usage, one compaction and one opening session.

---

# I. INCEPTION STORY

**The board.** Twenty-three unclaimed issues. Some were done already, some
needed a device or another repo, and three had outside submissions attached.
The ask was a clean slate apart from those three.

**The system.** Clearing the board needed rules to clear it by, so the
session built them:
- labels for type, state and modifiers;
- a claim lifecycle;
- rewards on the prime ladder (XP, badges, Sparstones), never cash;
- a Bot Brief on every mission, so automated submitters have enough to
  succeed;
- a lexeme fallback for work that can't be done as written, sourced from
  Wikipedia (the great stag was the first example);
- a closing question for every PR: *does it make sense?*

"Bounty" became "Sparstone Trial". PRs that demand payment are labelled and
closed unread. That became PR #343.

**The cap.** Usage ran close to the limit. Eric asked for a review step that
doesn't spend model calls, with the paid review running only when asked.
That became PR #356. It gathers a no-API review packet on every PR, drafts
included. The paid Claude review runs once, when a PR is ready, and again
only with the `ai-review` label.

---

# II. THE TURNS

1. **Opening, 202609261609.** Seven PRs had merged on `main` while this
   session was away, and both of its PRs had fallen into conflict. The
   conflicts were all in append-only logs, so both sides were kept.
2. **Ready.**
   - #356 and #343 went ready.
   - #343's paid review failed on a subscription session limit, not on its
     code. It was re-run once after the reset and passed.
3. **Ultima Recensio on #356.**
   - A bot found the packet was missing the template's "What Door" section.
   - The final pass found a real bug: any label added by a bot could cancel
     a paid review that was already running. Both were fixed.
4. **The accidental seal.** A navigo reply quoted the seal cue in backticks.
   It posted under Eric's login, so `finalize-pr.yml` sealed #356. Eric then
   sealed it himself.
5. **Merge by comment.** "merge when ready" arrived as a PR comment, and #356
   was merged on it. The environment's safety check flagged that as a merge
   without review. From then on, merges needed Eric's confirmation in the
   conversation. He confirmed #356 afterward, and asked for #343 directly.
6. **#367.** The seal guard, whole-word placeholder matching, and the Latin
   cue record. Codacy flagged three wording issues in CLAUDE.md. Eric pasted
   the findings, because the container can't reach Codacy.
7. **#342.** Two review threads were fixed and the missing PR description was
   filled in from the diff. It was the cue record's first live run, and it
   showed ✅ Ready to verify for merge.
8. **Perplexity's drafts, #354 and #355.** Reviewed on the PRs; nothing was
   pushed to Perplexity's branches.

---

# III. WHAT LANDED

| PR | What | Sealed |
|---|---|---|
| #343 | Issue system: labels, claims, no-cash rewards, Bot Brief, lexeme fallback, payment-demand auto-close, board sweep | High 20/20 |
| #356 | Review packet (no API), paid review on request, `ai-review` label | High 20/20 |
| #367 | Seal guard, whole-word packet scan, `latin-cue-record.yml` | High 20/20 |
| #342 | CONTRIBUTING: world/ vs tools/ routing, outside-platform guidance | High 20/20 |

---

# IV. THE PATTERN

**Your login isn't your voice.**
- Navigo comments post as Eaprime1. A workflow that only checks the author
  treats a navigo as the owner.
- The fix is layered:
  - comments with the Claude Code footer never seal;
  - quoted cues don't count;
  - merges are confirmed in the conversation, never taken from a PR comment.

**Gather free, spend on request.** The packet and the cue record cost nothing
and run on every PR. The model runs once per PR, when the owner says it's
ready.

**Other conversations work the PR; this one verifies the merge.** Navigo
Perplexity or any other conversation can drive a PR with the Latin calls. The
cue record keeps the evidence, and the merge happens in the project's final
review.

---

# V. SEEDS (not built)

- The cue record snapshots the PR when a call is made. A seal landing at the
  same moment shows as "not sealed" until the next call. An `edited` trigger
  or a re-check after finalize would close that gap.
- An index of the latest cue record on every open PR, in one place.
- `atelier/` has two definitions: CLAUDE.md's and `.shadow-well/README.md`'s.
- Reconcile the navigo names once Eric's update arrives: Navigo Claude,
  Navigo Perplexity and Navigo Unexusi, in place of the numbered slots.
- Plan-doc items still open:
  - the final challenge name (quest?);
  - the 59 + 60 normal/shadow progression;
  - the reward ledger;
  - the claim-reply update;
  - retiring `bounty` everywhere.

---

*∞ Enjoy the journey ∞*
