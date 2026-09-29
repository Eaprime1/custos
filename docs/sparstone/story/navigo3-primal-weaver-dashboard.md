---
voice: Primal Weaver Dashboard sketch
filed: 202607110639
source: pasted document, session span 202607100322–202607111550
status: verbatim, unmerged with other poles
---

# Primal Weaver Dashboard

A BBS-inspired UI is the perfect aesthetic for this. It strips away modern, distracting design flourishes and forces a focus on raw data, text, and structure—exactly what you want for a rigorous constraint tool. It also inherently feels a bit like digging through an archaic archive or terminal, which fits the gritty, coal-fired tone of your world.

Here is a structural layout for the **Primal Weaver Dashboard**, designed as a retro terminal interface.

### 1. The Home/Login Screen (Terminal View)

This is the main dashboard landing page. It immediately grounds you in the current constraints before you even write a single word.

```
=====================================================================
||  SYS.NAME: PRIMAL_WEAVER // NODE: SPARSTONE_01                  ||
||  OP: E. PACE // STATUS: ONLINE                                  ||
=====================================================================

> SYSTEM CHECK... OK.
> SYNCING LUNAR CALENDAR... OK.
> CALCULATING TRIADIC ENTANGLEMENT... OK.

[ CURRENT SYSTEM STATUS ]
LUNAR PHASE:         Waning Crescent (22% Illumination)
ACTIVE CONSTRAINT:   Subtractive Editing / Lore Deepening
TRIADIC ALIGNMENT:   Environment-Dominant (Phase II)
GENERATIVITY INDEX:  0.84 (Stable)

---------------------------------------------------------------------
[ MAIN MENU ]

  [1] - ROADMAP: View Upcoming Lunar/Triadic Schedule
  [2] - COMPOSE: Initialize Writing Session (Under Current Constraints)
  [3] - TRACKER: Organism-Environment-Generativity Matrix
  [4] - LEXICON: Access Sparstone & Root-Word Database
  [Q] - DISCONNECT / LOGOUT

ENTER SELECTION: _
```

### 2. Module Breakdown: How the Menus Function

If you were to press [1], [2], or [3], here is how the data would be structured in those specific views:

#### [1] The Roadmap (Lunar/Triadic Schedule)

A forward-looking calendar that dictates *what* kind of work you are allowed to do based on the moon.

* **New Moon to First Quarter:** Generativity Focus (Brainstorming, drafting raw scenes, character creation).
* **Full Moon:** Peak Output (High word-count days, climax scenes, organism-dominant actions).
* **Waning Moon:** Subtractive Phase (Editing, refining the Lexicon, resolving plot threads, environment-dominant descriptions).

#### [2] Compose (The Writing Constraint Engine)

This is where the magic happens. Before you write, the system locks you into your parameters.

* **Prompt:** Displays a specific focus based on the Triadic Alignment (e.g., *"Focus on the Environment: Describe the sparstone architecture holding back the elements."*)
* **Constraint Warning:** *"LUNAR PHASE RESTRICTION: Keep sentences short and fragmented. Word count limit: 500."*

#### [3] Tracker (O-E-G Matrix)

A data visualization screen (rendered in retro ASCII-style bars or simple tables) showing how balanced your worldbuilding is over the last 30 days.

* **Organism:** ||||||||||||| (Character actions/dialogue)
* **Environment:** ||||||||||||||||||| (Worldbuilding/Sparstone lore)
* **Generativity:** ||||||| (New concepts introduced)
* *System alert:* Alerts you if you are skewing too heavily into Environment and ignoring Character (Organism).

### Moving Forward

To make this dashboard functional, we need to mathematically define the rules.

**Which specific constraint should we map out first: How the eight phases of the moon directly alter your writing prompts, or how the "Triadic Alignment" calculates whether a scene should focus on Organism, Environment, or Generativity?**

---

*Editorial note (filed 202607110639): this is the concrete design sketch referenced in `status.md` under "What this status file is not." `status.md` is the simple version — a hand-maintained markdown table — built instead of this fuller terminal UI, deliberately, so the nerve center exists now and can grow toward something like this later rather than waiting on it.*
