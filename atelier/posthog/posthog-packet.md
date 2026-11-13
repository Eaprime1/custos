# PostHog Packet: Novissimum Seed for the 22nd Iteration

Prima-clock: 202611032212
Suit: ♦️ (proposed) · Plank: 1/3 (proposed) · Iteration: 21 → 22 novissimum · Chain of custody: OPEN
Carrier: moav/posthog_moav_intake_packet001.json
Status: DRAFT for owner review. Exported from a Claude Doc (rev 34); the doc stays the working copy until this PR is settled.

Nov 3, 2026 · @Eric Pace

## Routing request to Custos

Eric proposes a new branch on eaprime1/custos as the home for all PostHog management work; Custos has not yet confirmed it, so this section is the request.

This packet is a seed in the novissimum, the structured collapse of the 21st Iteration into seeds for the 22nd. It is proposed at 1/3 PLANK (work/germ); Eric sets the real state.

**What Custos is asked to answer**

1. Is a branch on eaprime1/custos the right location, or does Custos route PostHog work somewhere else?
2. Branch name. Working proposal: `posthog`, with connector and skill work in subfolders.
3. Should the branch be built so it can later be extracted into its own repository under eaprime1, if it outgrows Custos?
4. Which notices go where on arrival: Linear for seeds and branch tracking, Slack for dispatches, GitHub for the commits themselves.
5. When does a formal custody entry apply? Proposal: only when the packet reaches 3/3 PLANK, not at intake.

## Three perspectives

The packet is written from three perspectives, and the concept "posthog" is the three working together. This is my reading of Eric's framing; correct it if it differs.

| Perspective | What it is | What it sees | What it contributes | What it owes the others |
| --- | --- | --- | --- | --- |
| Navigo\_Claude | The builder and tool in this session | This conversation, loaded skills, connected apps, files in the workspace | Structure, drafting, naming, honest checks on what is known versus guessed | Say so when guessing or pattern-completing; say when content cannot be seen |
| Eric | The human ad-hoc server, connecting everything he can reach | Other platforms, other conversations, real-world limits, what exists where | Access, judgment, content gathered from many places, final decisions | Paste or upload what Claude cannot see; set the plank state |
| PostHog | A data contributor, not an agent with views of its own | Only what has been sent to it: events, sessions, traces, logs | Measurements, replays, cost and usage traces, alerts | Nothing it was not given; it is silent wherever nothing is instrumented |

## Sign-in pattern: PostHog version

Eric and Claude sign in as navigo\_claude and add details after a hyphen, using five fields. This is the PostHog sign-in version, and it is for internal tracking only.

**Internal only.** Public content is attributed to the Voices of Navigo and carries no individual names, human or AI. The sign-in belongs in metadata (a Jira field, a commit note, a doc property), never in the body of the work. This packet is internal, so it names Eric and Claude for tracking.

| Field | Examples | What it answers | In the short sign-in? |
| --- | --- | --- | --- |
| Voice | navigo\_claude, navigo\_gemini | Which AI is working. Follows who is speaking, not where the content is stored | Yes |
| Perspective | custos, custos\_posthog | What the work is for: the system, then the conversation when useful | Yes |
| Place | Google Drive, Jira, GitHub | Where the content lives | Only when it matters |
| Device | phone (primapixel) | What it was done from | Only when it matters |
| App | Claude app, Code, browser | Which interface was used | Only when it matters |

The short form is navigo\_claude-custos\_posthog: voice plus perspective. Each field can also become an event property in the phase 3 schema.

**Rules, kept small so the pattern can grow**

- Use the base name alone until a detail is needed.
- Details follow one hyphen; underscores join words inside a detail.
- The voice follows who is working. Gemini on Drive content is a default, not a rule: if Claude edits a Drive doc, the voice stays navigo\_claude and the place is Drive.
- Place, device and app are recorded in notes or metadata, and only when they matter.
- The same sign-in is used wherever the work is recorded, so it stays together instead of splitting by platform.

**Relation to the Jira version**

- This version is written from Eric's description of the Jira unexusi pattern; the Jira version itself has not been read.
- Where the two differ, the difference starts a review that updates both and keeps the best of each.
- When the review finishes, PostHog either adopts the new system version (recommended) or keeps this version as is.
- Filing it in this packet changes nothing in other locations. Updating Jira first is also possible, but the packet route is quicker because Custos's reply will carry the new version back.

**Open questions for Eric**

1. What does "primapixel (new structure)" refer to? I read it as the phone's name inside the new structure.
2. Seed this as a plain note for the next Iteration first, with characters added after it has been used a few times?
3. Who runs the review of the two versions: Custos, Eric, or both?

## What PostHog can do

PostHog covers ten areas through the plugin's skills and the connected PostHog command tool. Both are confirmed to exist here, but no command has been run yet, so nothing is known about the account's real data.

| Area | What it does | Basis |
| --- | --- | --- |
| Product analytics | Events, insights, dashboards, queries, cohorts, metric investigation | Command list and skill names |
| Session replay | Find and watch sessions, scan recordings, debug missing ones | Command list and skill names |
| Experiments and flags | A/B tests, rollouts, flag cleanup | Command list and skill names |
| Error tracking | Instrument, triage, group, suppress noisy errors | Command list and skill names |
| Logs | Instrument, investigate, alert on logs | Command list and skill names |
| LLM analytics | Traces, costs, clusters, evaluations, prompts, datasets | Command list and skill names |
| Data warehouse | External sources, modeling, sync repair | Command list and skill names |
| Endpoints and apps | Queries as API endpoints, canvases, notebooks | Command list and skill names |
| Surveys and signals | In-product surveys, scouts that watch data | Command list and skill names |
| Automation and delivery | Workflows, subscriptions, alerts, CDP functions, batch exports | Command list only |

Descriptions are inferred from names. Each skill's real steps are read when it is first used.

## PostHog as a contributor

PostHog contributes evidence, never decisions: it reports what happened in whatever sends it events, and Eric and Claude decide what it means.

**Job description**

- Measure how the project's tools and pages are actually used, once something emits events.
- Record the cost and traces of AI work, starting with Claude Code sessions.
- Raise alerts when a monitored system breaks, if Custos chooses to feed it logs.
- Keep replayable evidence, so a claim about usage can be re-checked rather than remembered.

**Limits**

- It is silent wherever nothing is instrumented.
- It knows nothing of Carbonites, planks or suits unless they are modeled as event names and properties.
- It has no judgment; any "PostHog says" statement is a query result with a date.

**Entry into custody**

Proposal: PostHog findings arrive like any external stream return, each carrying the query that produced it and the date it was run. A finding without its query is not filed as fact.

## Out-of-the-box ideas

The strongest idea is to make the Of Aces system itself the event taxonomy, so PostHog measures what the project already believes about itself. All of these are untested ideas; each needs something to emit events first.

| Idea | What it does | Needs first |
| --- | --- | --- |
| Suits and planks as event properties | Tag every event with suit and plank state; a funnel from germ to 3/3 PLANK shows where concepts stall | An agreed event schema, then a small emitter |
| Seed movement from Linear | A Zapier or webhook step reports each seed state change to PostHog | A tested bridge from Linear to PostHog |
| Carbonite drift log | Record each carbonite return from cold storage and how far it differs from the master | A place where returns are already recorded |
| Human connector log | Count who served each request: Claude, Eric, another platform. Shows where Eric is the single point of failure | Eric choosing to log his own routing; consent is his |
| Momentum measures | Time from ask to first usable output, per session, as a signal for flow and for stalls | Claude Code ingestion switched on |
| Consortium comparison | Same prompt across platforms, one trace each, compared on cost and outcome | A workflow that runs through an API Eric controls |
| Launch wake board | A dashboard of which concepts have found a place after Primal launches | Concepts tracked as seeds in one place |
| Scouts as watchers | PostHog scouts watch the data and surface anything odd, like a Custos lookout | Enough events for anything to stand out |

## Proposed branch structure

```
eaprime1/custos
└── posthog   (branch name proposed)
    ├── connectors/   how PostHog links to Linear, Slack, GitHub, Zapier
    ├── skills/       notes on the PostHog plugin skills as used here
    ├── plugins/      plugin setup and status notes
    ├── packets/      this packet, and later PostHog returns
    └── systems/      event schema, sign-in pattern, taxonomy
```

The branch holds five folders; this packet lives in packets/, which is also where later PostHog returns would land.

## Plan

The plan runs in five phases, each ending at a gate that must pass before the next starts. No dates are set; The custos chooses the pace.

1. **Land the packet.** Send the routing request, create the branch, file this packet in packets/. Gate: Custos has answered the five questions.
2. **Switch on Claude Code ingestion.** Use the plugin's setup and status skills. Eric supplies the PostHog project key himself. Gate: sessions are visible in LLM analytics.
3. **Draft the event schema.** Suit, plank, source, and who served the request, written into systems/. Gate: Custos approves it.
4. **Connect one bridge.** Pick a single source, such as Linear seed changes, and send a handful of test events. Gate: those events can be queried back.
5. **Read what the data says.** Build the first dashboard and mark each idea kept, parked or dropped in the Application Ideas spreadsheet. Gate: every idea has a status.

**How success is judged**

- Claude Code sessions appear in PostHog with cost and trace data.
- One funnel from germ to 3/3 PLANK can be read without explanation.
- Every PostHog-derived claim in the project carries its query and run date.

## Caveats and open questions

This is a plan for a working structure, not yet a business plan: no costs, revenue or audience are defined, and the packet is only as strong as the instrumentation behind it.

**Caveats**

- PostHog pricing and the account's plan were not checked, so the cost of any idea is unknown.
- Most ideas depend on things not seen here: a consortium workflow with an API, deployed pages with real visitors, Custos logs.
- Content from other conversations, Drive and GitHub is not in this packet; it was written from this conversation only.
- Claude Code ingestion sends session data to PostHog. Check what it captures before enabling it, since sessions can hold private project content.
- Phase 3 can swallow effort. Measuring the project risks becoming the project, so one bridge and a few events come before any dashboard.

**Open questions**

1. Does a PostHog project already exist, and on which plan?
2. Where are the Primoris and THE pages deployed, if anywhere?
3. Should suits and planks be used literally as event properties, or translated into plain names first?
4. Which other conversations should be searched and folded into this packet before it moves past 1/3 PLANK?
