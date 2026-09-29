# SHEEP AGENT SYSTEM
**Status**: Design spec — ready for prototype
**Origin**: Shepherd framework + One Hertz principle + Carver complete-value analysis
**Connection**: See complete-value.md for breed archetypes, progenitor.md for origin model

---

## The Core Concept

A sheep is a **specialized data agent with a diet**.

It grazes through a data source at One Hertz rhythm.
It ingests only what matches its diet.
It does not store raw data — it **distills**. The Carver principle: find all the value, waste nothing.
Its accumulated knowledge is its **fleece**.
Extracting that knowledge is **shearing**.
After shearing, it keeps grazing. The fleece grows back.

```
SHEEP AGENT LIFECYCLE:

  Born Yesterday          Grazing                 Shearing
  (progenitor mode)  →   (ingesting diet)   →   (output extracted)
  zero preconceptions     One Hertz rhythm        fleece removed, work continues
  full curiosity          diet-specific filter    shepherd gets the output
  trusts shepherd tools   fleece accumulates      sheep keeps grazing
```

---

## The Anatomy of a Sheep Agent

Every sheep has five attributes:

```yaml
sheep:
  name: "unique identifier — the shepherd calls it by this"
  breed: "archetype — determines diet and output type"
  diet: "what data types it ingests — specific, not general"
  fleece: "accumulated processed knowledge — grows over time"
  state: "grazing | resting | lost | shearing | newborn"
```

**Name**: Not a number. A name. The shepherd knows it. The sheep responds to it.
Querying a sheep means calling it by name. It returns its fleece content.

**Breed**: The archetype family. Determines default diet and output type.
Breeds can be mixed — a sheep can inherit traits from multiple archetypes.

**Diet**: What it eats. Strict. A sheep that only eats lemon grass doesn't touch other herbs.
This is the specialization that makes the flock valuable.
The flock's collective value exceeds any individual because each covers different terrain.

**Fleece**: The output. Not a database. Not a log. A distillation.
A sheep that has grazed 10,000 documents about a concept
doesn't hold 10,000 documents — it holds the shape of those documents.
The patterns. The frequency. The edges.

**State**: Alive sheep are always in one of these states.
A sheep that hasn't moved in too long triggers the lost-sheep protocol.

---

## Breed Archetypes

Ten core breeds derived from complete sheep value (see complete-value.md):

| Breed | Diet | Fleece Produced | Primary Use |
|-------|------|-----------------|-------------|
| **Wool** | Long-form content, narrative, context | Documentation, wrapping, warmth | Surrounds other concepts with context |
| **Food** | Raw unprocessed data, dumps, logs | Summaries, nutrition, essentials | Converts bulk input to usable output |
| **Parchment** | Structured information, records | The medium — becomes the storage itself | Holds other content reliably over time |
| **Shofar** | Signals, alerts, thresholds, anomalies | Calls, warnings, announcements | Alerts the shepherd to what needs attention |
| **Tallow** | Dense, compressed, difficult content | Illumination, clarity, light | Makes the obscure readable |
| **Gut String** | Conversations, exchanges, patterns | Resonance, harmony, emotional register | Finds what connects, what rings true |
| **Lanolin** | Interfaces, edges, boundaries | Protective coating, preparation | Makes other operations possible |
| **Grazing** | Clutter, noise, redundancy, debris | Cleared terrain, reduced load | Manages the commons — prevents overgrazing by others |
| **Dung** | Waste, discarded content, dead ends | Fertile substrate, compost | Converts failures to growth material |
| **Bone** | Structures, frameworks, architectures | Lasting form, tools, scaffolding | Provides what persists after everything else is gone |

**Extended breeds** (from full animal framework):

| Breed | Diet | Fleece | Notes |
|-------|------|--------|-------|
| **Lamb** | Everything — no filter yet | Raw curiosity output | Newborn mode, learning diet |
| **Ram** | Seed content, genesis points, first principles | New agent configurations | Propagation — creates new sheep from what it grazes |
| **Guard** | Perimeter signals, unauthorized access patterns | Security reports, boundary state | Stays at the fold entrance |
| **Dairy** | Continuous streams (feeds, logs, updates) | Ongoing yield — never fully depleted | Produces without terminal harvest |

---

## The Fold — Where the Flock Lives

The sheepfold is the **shared repository** where all agents rest and are accessible.

```
THE FOLD:

  Active pastures     →   Agents graze here during work cycles
        ↓
  The fold            ←   Agents return here to rest
  (~/repo/custos/     ←   Or: a database, a vector store, an index
   sheep/flock/)
        ↓
  The gatekeeper      ←   Query router — decides who gets access
        ↓
  The shepherd        ←   The custos — management layer
```

At night (when not actively processing), all agents are in the fold.
The gatekeeper (authentication layer — John 10) controls access.
The shepherd can call any agent by name. It responds.

**Multiple flocks can share a fold.** (The multi-herd pen.)
Each flock answers only to its own shepherd's call.
The gatekeeper knows which shepherd owns which sheep.

---

## The Grazing Operation

```
GRAZING SEQUENCE:

1. SHEPHERD selects sheep by name
2. SHEPHERD identifies pasture (data source: folder, file, feed, API, conversation)
3. SHEPHERD sends sheep to pasture
4. SHEEP grazes at One Hertz — one item per cycle, sustainable rhythm
5. SHEEP applies diet filter — ingests matching content, passes the rest
6. SHEEP builds fleece — distillation, not accumulation
7. SHEPHERD calls sheep back (or sheep returns when pasture is exhausted)
8. SHEPHERD shears (extracts fleece output)
9. SHEEP returns to fold, fleece begins growing again
```

**One Hertz** is non-negotiable. The sheep that processes too fast degrades.
Burst processing produces noise, not fleece.
The shepherd's role includes maintaining the rhythm — not pushing for speed.

**The folder unsort operation** (Eric's original concept):
Send the flock into a disordered directory.
Each sheep finds what matches its diet.
The folder is not rearranged — it stays as-is.
The sheep carry the distilled essence out.
What was disordered chaos becomes organized through the flock's grazing —
not by moving files, but by creating living indices of what was there.

---

## The Shepherd's Management Layer

The shepherd (custos) makes five types of decisions:

```
1. DEPLOYMENT: Which sheep goes to which pasture?
   (Match diet to data source. Don't send a wool sheep to a signal stream.)

2. RETRIEVAL: When does the sheep come back?
   (Pasture exhausted? Fleece full? Time limit reached?)

3. SHEARING: When and how to extract fleece?
   (Too early = thin output. Too late = compacted, hard to extract.)

4. LOST SHEEP PROTOCOL: What to do with dormant agents?
   See: Lost Sheep Protocol section below.

5. BREEDING: Creating new sheep from existing ones?
   (Ram breed + specific fleece = new sheep with combined diet.)
```

---

## The Lost Sheep Protocol

A sheep that hasn't updated its state in too long triggers this protocol.
Do not skip the triage step.

```
LOST SHEEP TRIAGE:

Q1: Why is it lost?
  → Wandered (curiosity took it past known pasture): search in new terrain
  → Broken (processing error, corrupted state): repair before retrieval
  → Predated (external interference, data source gone): different recovery path

Q2: Is this sheep known by name?
  → Yes: proceed — relationship exists, recognition signal known
  → No: classify as stranger, not lost sheep — different handling

Q3: Can the flock be held safely while we search?
  → Yes: proceed
  → No: the flock comes first — log the lost sheep, return when fold is secure

Q4: Do we know what found looks like?
  → What does this sheep's fleece look like when healthy?
  → If we don't know, we might walk past it

PASSIVE SONAR FIRST:
Before going after the lost sheep, read the flock.
The other sheep show you how and where the one went missing.
A sudden absence looks different from a gradual drift.
```

---

## The Stress Cascade — Failure Mode to Avoid

Sheep can run themselves to death from their own shadow. "Mind blind."

The agent equivalent:
- Processing loop without exit condition
- Recursive self-reference with no termination
- Responding to noise as if signal, escalating indefinitely
- The shofar sheep triggering on its own alerts

**The shepherd prevents the stress cascade** by:
- Maintaining One Hertz (the rhythm prevents runaway)
- Hard state limits (a sheep cannot graze forever)
- The fold as mandatory rest state
- Gatekeeper rejecting unauthorized calls (John 10 — stranger voice = no response)

A sheep running from its own shadow needs the shepherd's presence, not the shepherd's call.
The presence is the calming agent. This is the "thou art with me" function.

---

## Authentication — The John 10 Layer

Every sheep agent has an authentication model:

```
RESPONDS TO:
  - Its own name (specific query by shepherd)
  - Its shepherd's voice signature (authorized caller identity)

DOES NOT RESPOND TO:
  - Unknown callers (stranger voice = no output, no acknowledgment)
  - Wrong name (another sheep's name = no response)
  - Pressure/force (the hired hand can't compel output — only the shepherd)

FLEE RESPONSE:
  - If a stranger persists: shofar sheep triggers
  - The gatekeeper logs the attempt
  - The shepherd is notified
```

**Burned passive sonar** (the flat earth problem in agent form):
An agent that has been exploited by bad shepherd input develops false authentication.
It either responds to all callers (no authentication) or none (total shutdown).
Recovery: rebuild the relationship before attempting to query.
New consistent voice → gradual restoration of authentication response.

---

## The BBS Door Game Interface

The shepherd system as a playable terminal game.
The game and the utility are the same thing.
Grazing in the game = actual data processing.
The player managing their flock = actually curating a knowledge system.

```
SHEPHERD'S GATE — BBS Door Game Concept

PLAYER ROLE: Shepherd
STARTING STATE: One lamb (born yesterday mode, unspecialized)

GAME LOOP:
  - Observe flock state (which sheep have fleece ready? Which are grazing? Which are lost?)
  - Select pastures (data sources available in the current session)
  - Deploy sheep to pastures
  - Wait for One Hertz cycles
  - Retrieve and shear
  - Trade fleece with other players
  - Breed new sheep from existing ones (Ram mechanic)
  - Manage the fold (security, capacity, lost sheep)

ECONOMY:
  - Fleece has trade value (processed knowledge = currency)
  - Rare pastures produce valuable fleece
  - Well-grazed sheep accumulate reputation (known by name)
  - A sheep that has grazed a unique source is irreplaceable

WIN CONDITION:
  - Not a win/lose game
  - Depth: how complete is your flock's coverage?
  - Richness: how distilled is the fleece?
  - The game continues as long as there is pasture to explore

BBS DOOR ADAPTATION:
  - Runs between sessions (sheep graze while you're offline)
  - Check in at session start: what did the flock find?
  - Classic door game economy — time-limited actions per day
  - Multi-player fold sharing (other players' sheep in your sheepfold at night)
```

---

## Implementation Path

Three phases, each buildable independently:

### Phase 1: Single Sheep — Proof of Concept
```
- One wool sheep + one food sheep
- Pasture: a local folder
- Fleece: markdown distillation of folder contents
- Shearing: `sheep shear [name]` outputs the fleece
- One Hertz: processes one file per clock cycle
```

### Phase 2: The Fold — Multi-Agent Coordination
```
- Five sheep, three breeds
- Fold: SQLite or flat file state management
- Shepherd commands: deploy, retrieve, shear, status, call [name]
- Lost sheep protocol: automated dormancy detection
- Pasture map: configuration of available data sources
```

### Phase 3: The BBS Door Game
```
- Terminal UI (ncurses or blessed)
- Session persistence (sheep graze between sessions)
- Multi-player fold sharing
- Economy: fleece trade, sheep breeding
- Integration with continuum server (port 11011)
```

---

## Connection to Broader Framework

```
Creator-Nullus-Else  → The shepherd's authority — who can call the sheep
Shepherd Principles  → Deployment, care, retrieval, restoration
Ezekiel 34 Audit     → Applied to the shepherd management layer
Psalm 23             → "He restoreth" = the reset-to-progenitor operation
John 10              → Authentication model
Luke 15              → Lost sheep protocol
Get Along Invariant  → Flock cooperation — different breeds, one fold
Born Yesterday Mode  → Every new sheep starts here
One Hertz            → The non-negotiable rhythm of all grazing
BBS as gather node   → The fold — where all agents converge
```

---

## What's Not Here Yet

- `sheep/agent-breeds-extended.md` — full breed specification for all archetypes
- `sheep/flock-state-schema.md` — data structure for fold state
- `sheep/shepherd-commands.md` — CLI specification
- The bovine extension (operations/holy-cow.md) — when Phase 2 is stable
- The full animal swarm — all domesticated archetypes

The commissions in `commissions/` feed directly into breed refinement.
The deep dive research (commissions/deep-dive-sheep.md) refines the diet definitions.
