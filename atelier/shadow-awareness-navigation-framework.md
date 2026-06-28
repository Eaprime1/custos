# Shadow Awareness Navigation Framework — nursery seed

Source: Linear issues QRU-9 ("Setup Local Dev Environment - Project
Foundation") and QRU-13 ("Code: Setup Project Structure & Git Repository"),
both still in Todo under the Qrunexusiam team's "Shadow Awareness
Navigation Framework" project.

This is pre-turn liminal content. The framework's real destination is its
own repo — not a directory grown out inside custos. It sits here only so
it has somewhere to develop before that repo exists, the same way anything
else lands in the atelier before it has a name that's ready to ship.

## What the Linear issues actually ask for

QRU-9 and QRU-13 both describe the same shape, QRU-13 with more detail:

- `/docs` — frameworks
- `/data` — shadow logs (JSON/CSV)
- `/scripts` — automation
- `/templates` — reusable shadow work templates
- `/integrations` — platform connectors
- `/research` (QRU-9 only)
- Initial files: README, FRAMEWORK, CHANGELOG, ETHICS (QRU-9)
- Git init, with a `.gitignore` specifically called out to protect
  personal material (QRU-13)

That last point is load-bearing, not boilerplate: `/data` is described as
holding shadow logs, which is personal material by nature. Nothing
resembling an actual shadow log belongs in this seed, or in custos at all,
until the framework has its own repo with its own access controls.

## Why this isn't being built as a real directory tree yet

Building `/docs /data /scripts /templates /integrations` inside custos
would plant a separate repo's structure inside this one's nursery and
make it look finished before it has a name that's ready. The atelier's own
rule is the opposite: nothing here is finished, that's the point. What
this seed holds instead is the *intent* — so when the destination repo is
ready to receive it, it isn't starting from a blank Linear issue.

## Open before this moves anywhere

- Destination repo name and its place in `branch-tracker/branches.md`
  once it exists.
- Whether ETHICS (named explicitly in QRU-9) gets drafted before or after
  the directory structure — given the personal-material concern in
  QRU-13's `.gitignore` note, ETHICS first seems safer.
- How "the nullification" (PR #38's pass) relates to this — unresolved
  whether other merged PRs have been folded into that pass yet. Not
  decided here.
