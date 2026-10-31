# The Machine

**Prima-clock:** 202610190449 (UTC)
**Suit:** ♦️ Seed
**Plank:** Germ
**Jira:** KAN-7
**Origin:** the Shepherd's seed, 2026-10-18: the race track, the pinball machine the contributors play as they work.

*A Rube Goldberg chain of small, real checks. Each link does one honest job in a longer way than it needs to. Nothing here is finished.*

## What it is

A test course for the automation that already exists around custos. A ball (a small signed
event) rolls through modules. Each module is one voice, one connector, one workflow or one
skill, and does one real thing: checks a file, reads a label, sends a note to itself. The
route is deliberately roundabout and a little funny. The funny part is the point of the
design: it is allowed to be questionable how useful a link is, as long as the module
says so out loud.

Real function, honest labeling, optional usefulness. A module may help, may be a joke, or
may be both. The label says which.

## Who it is for

Atypical and neurodivergent first, trauma-informed throughout:

- Nothing arrives unannounced. Every module carries a warning label (see [warning-labels.md](warning-labels.md)) before it carries a story.
- Every module can be stopped at any step. No module needs a reason to stop.
- Nothing is timed against the player. The only clock is the prima-clock stamp.
- Heavy material stays out of the default path. Intensity is opt-in, capped and shaped (see below).
- A player's inner life is theirs. The Machine never asks for it and never writes it to the repo.

## The shape of a run

A run is a short sequence of modules. The Machine keeps the intensity of a run inside a
shape with a quiet start and a quiet end:

```text
intensity(t) = peak * sin(pi * t / T)      for 0 <= t <= T
```

At the start (t = 0) and the end (t = T) the value is exactly 0, which is the point: the
bookends are part of the curve, not an extra step. `peak` is set by the player before
the run, never above the label's cap. This is a design proposal using plain trigonometry;
it is **not** taken from the Polar Radian System, whose documents give the compass and
radian vocabulary but no conversion table or damping equations (see `atelier/act-ii/`).
If the Shepherd wants the Polar Radian vocabulary to drive the curve, a contributor can
propose a mapping as a module.

Bookends, in order, on every run:

1. **Door.** Read the label. Choose a peak (0 is allowed and runs the jokes only).
2. **Breath.** One neutral step that does nothing but confirm the player is here.
3. The modules, in the order the player picked.
4. **Return to zero.** One closing step: the run ends on intensity 0, names what was
   done, and says what, if anything, is left for later. Nothing from the run is kept
   unless the player keeps it.

## Rights of the player

The Dixi Jam layer in the project documents names four rights: **No**, **Breath**,
**Boundary**, **Witness**. The Machine borrows the first three as plain rules and adds
the fourth as optional:

- No: any module can be skipped. Skipping is a valid run.
- Breath: any step can pause. The Machine waits.
- Boundary: the player's cap is final. A module cannot ask to raise it.
- Witness (optional): a player may ask a person to read the run. The Machine never does this on its own.

The personal side of that layer is not copied here and must not be added to the repo.

## Adding a module

Each contributor adds one module of their own. Start from [module-template.md](module-template.md).
A module is a Markdown file in `modules/` named `NNN-slug.md`, and it is a **spec until a
person runs it**. Specs are free. Running a module against a real system (mail, calendar,
chat, payments, devices) needs the Shepherd's yes first, and that yes is written in the PR.

Three starter specs are here:

| Module | What it is | Label |
|---|---|---|
| [000 The Ball](modules/000-the-ball.md) | The signed event that rolls through the course | Tender |
| [001 The Sloth](modules/001-the-sloth.md) | A deliberately slow link: waits, and says so | Tender |
| [002 The Weathervane](modules/002-the-weathervane.md) | Reads where the run stands and points, never pushes | Steady |

## What is not verified

- No module has been run. Everything here is a spec.
- The connectors a module names (mail, calendar, chat, automation services) exist as tools in the Shepherd's session at the time of writing. Whether each one can do what a spec says, with the access it has, has not been checked.
- The sine curve is a design choice. Whether it feels right to the people who play it is unknown and is the first thing a trial should learn.
- The warning scale has no outside clinical source. It is a plain-language scale made for this repo. It is not a safety standard and not a replacement for care. See the note in [warning-labels.md](warning-labels.md).

## Open for the Shepherd

- Does the Machine live in the atelier long term, or route to a repo of its own when it reaches 2/3?
- Which module does the first real run use, and against which system?
- Is the sine shape the right default?
- Who reads a run when a player asks for a witness?
