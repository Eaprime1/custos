# .custos — Linear Domain Notice

custos already runs a custody practice for GitHub (PRs, issues, branches, the
convergence hub). This file opens the same practice for Linear, as a peer
domain rather than a subset of the GitHub one. Linear gets its own custos
attention because it now has its own backlog, its own contributors, and its
own drift risk if left unattended.

## Linear structure, as of 202606242126

Team: **Qrunexusiam** (the only team in the workspace).

Projects:
- **Shadow Awareness Navigation Framework** — original project. Issues
  QRU-9, QRU-13, QRU-3 sit in Todo, unstarted. See
  `atelier/shadow-awareness-navigation-framework.md` for the nursery seed
  pulled from QRU-9/QRU-13.
- **Primoris** — created this session
  (`https://linear.app/qrunexusiam/project/primoris-a57a98e91c34`). 16
  backlog issues (QRU-15 through QRU-30) that previously had no project
  were grouped here; they shared a theme but weren't a real Linear Project
  object until now.

## GitHub ↔ Linear relationship

QRU-3 ("Connect your tools") is Linear's own default onboarding issue for
wiring up the GitHub integration, Slack, etc. — it is still unstarted, so
there is **no automated sync** between Linear and GitHub yet. Right now the
connection between the two is manual: a human (or an AI session working on
the Shepherd's behalf) reads both sides and carries context across. Treat
that as the current state, not a gap to silently patch — turning on
Linear's GitHub integration is a decision for the Shepherd to make
explicitly, not something to wire up unannounced.

## Contributor arrivals

Three new GitHub handles showed up since the last time anyone looked:

- **SKYJAMES777** — opened PR #131 (merged, fixed issue #129) and PR #132
  (closed as redundant; #129 was already resolved by #131 by the time #132
  was reviewed).
- **kabbersokhi-boop** — claimed bounty #130, opened PR #133
  ("Develop partner perspective into a concrete proposal"). Open, reviewed,
  approved. Not yet merged — merge is left to the Shepherd.
- **Rachaelisa** — claimed bounty #130 first (comment posted 202606230138),
  but never opened a PR. Her claim is now stale: kabbersokhi-boop's PR #133
  already addresses the issue. Needs a response — see
  `.claude/follow-up-first-contribution.md`.

One returning name, not new: **Ojas2095** also commented claiming #130;
this is the same handle from PR #38's original contributor pair
(`@dannyward630`/`@Ojas2095`), re-engaging on a different issue. Worth
noting, not worth treating as a fresh arrival.

None of the four are GitHub repository collaborators yet — all contact so
far has been through forked PRs and issue comments, not an invite.

## Next stage for PRs

Tracking what each contributor PR still needs before it's actually landed,
not just merged:

| PR | State | Next stage |
|----|-------|------------|
| #131 | merged | done |
| #132 | closed (redundant) | done |
| #133 | open, approved | Shepherd merge decision; if merged, PR #133's own body names the concrete follow-up — a second PR adding a `partner_state:` block (`charge_received`, `friction_named`, `next_stance`) to `turns/AAR.md` |
| #130 (bounty, via Rachaelisa's stale claim) | open | needs a comment redirecting her — #133 already closes the issue's threads |

## What this session does not have access to

Per the Shepherd's own caution: don't imply access that doesn't exist.
Confirmed *not* connected — Google Drive content, the Ubuntu laptop
("mandlebrot"), email, Google Chat, physical printing. Nothing in this
note assumes otherwise.

## Parked, not started

Named so they aren't lost, not built because they aren't scoped yet: the
threshold joker's appearance, the Jacks of all trades, a cameo of the
terminus (unnamed), the navigo AI-peer-to-peer concept and entity status
for tools like Linear, project-wide navigo notifications, pandora
containers/modules, reintegrating the Ubuntu laptop into the device mix.
Each needs its own scoping pass before it becomes atelier content.

Separately: the Shepherd wants a note that custos is currently the
pinnacle location for this work on the Claude platform, and that he wants
to take that project back. That's an operator-side action on
claude.ai/code, not something actionable from inside this repo — flagging
it here so it isn't dropped.
