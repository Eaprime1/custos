# zero_prime_one — the reality layer (seed)

`suit: ♦️ Diamond, germ` · `prima-clock: 202610210110 (filed 202610210247 UTC)` · `plank: Germ, a brief to build from, not a spec` · all decisions are the Shepherd's

**What this is:** the protective parts of the Primoris material, stripped of narrative and Rube Goldberg, reduced to what each one actually is. Then `zero_prime_one` as the loop that holds them. Personal accounts are deliberately not copied here.

**Sources:** project documents on the Primoris framework, the Return to Zero exports, and the Emergence Arc refinement workflow.

---

## 1. What each piece actually is

| In the material | In reality | Measurable? | Verdict |
|---|---|---|---|
| Sphincter Protocol (constricted / dilating / patent / spasm) | A four-value **state label**: pressure high, opening, settled, shut down | By self-report yes; by sensor only as a *suggestion* | **Keep.** Eric sets the label. A sensor may propose, never decide. |
| Return to Zero (4 phases) | A **response sequence**: stop the demands, quiet the surroundings, hand the holding to other people, restart gently | Each step is an action a phone or a person can do | **Keep.** This is the core. |
| Triadic pact (human, AI, animal) | A **consent-based support circle**: you, your phone, your people (and dog) | Not a measurement | **Keep.** Human keeps sole authority and can decline any part. |
| Trigger: explicit veto | "Stop / no / I cannot", plus a non-verbal version | Yes (a button) | **Keep, and add the one-tap.** The material itself says speech is lost under overwhelm. |
| Trigger: somatic | Stillness or shaking seen by a sensor | Partly (accelerometer; heart rate only with a wearable) | **Keep as optional, later.** Needs his own calibration. |
| Trigger: service-animal cues | A person reading the dog | Not by AI | **Keep as a human channel.** Do not parse the dog with software. |
| Trigger: "semantic inflation" | Software judging his word choice | No | **Drop, or opt-in only.** Too many false alarms and it reads him. |
| Ka pressure (TKP = 0.35 gravity + 0.30 EMF + 0.20 synergy + 0.15 affinity) | A weighted sum of four things no sensor reads; the weights have no source | **No** | **Drop.** Replace with real inputs (time, motion, a tap). |
| Marbling metric: "resilience score updated, used to tighten future thresholds" | A score of *him* that changes his own settings | It would be invented | **Drop.** It breaks "never measures you". Thresholds change only when he changes them. |
| Testimonium / chain-of-custody log | A **private log** of what happened and what helped | Yes | **Keep, minimal.** Timestamp, state, what helped. No narration required. He can delete it. |
| Fecal truth | Plain rule: a failure is information, not blame | n/a | **Keep as a principle.** |
| The Machine / pinball / Loom | Entertainment and orientation layers | n/a | **Separate.** Not part of this. |

## 2. zero_prime_one as the loop

The material gives the seven-stage Emergence Arc: void, aught, plex, naught, **zero** ("Return to Zero / noise reduction"), uni, **one** ("fully crystallized identity"), then the Prime Foundation (primes 2, 3, 5, 7; three is the triad). It also gives the Return to Zero phases. Read together, the reality layer is:

| Slot | Meaning in the material | Meaning in reality (my reading) |
|---|---|---|
| **ZERO** | stage 5: noise reduction, the foundation | **The quiet baseline you return to.** Demands off, noise down. Always reachable. |
| **PRIME** | the first foundation; three; the triad | **The first small action and the other people.** One step, and someone in the circle knows. |
| **ONE** | stage 7: a settled identity | **Back in motion as yourself.** Re-engaged on your terms. |

This is a proposal. The material names the stages but gives no operational definition of `zero_prime_one`; I am not claiming it does.

**One entry has the same shape every time** (three interchangeable slots, as the Planck-Prime thread asked):

```yaml
event: scheduled loud sound (e.g. a noon siren)   # predictable
kind: predictable        # predictable | unpredictable
before:  soft pre-cue 60s ahead   # haptic plus one plain line, not a sound
zero:    [ear protection or ANC on, stand somewhere stable, notifications off]   # his list
prime:   [a named person in view or told]                                          # his list
one:     "back" tap, or auto-clear after N minutes; log timestamp only
```

Two kinds of event need different designs:

- **Predictable** (a daily siren): no sensor needed. A scheduled quiet pre-cue and a prepared `zero` is the whole answer, and it is the cheapest and most reliable thing here.
- **Unpredictable:** a sensor can only *suggest*. The phone asks "are you ok?" with one tap. No tap within a time Eric sets, and only if he has agreed in advance, it messages one named person. That is the "sponsor".

## 3. What is buildable on a Pixel 8 with Termux (unverified, not tested)

| Piece | Feasible? | Note |
|---|---|---|
| Scheduled pre-cue | Yes | Notification and vibration from a scheduled job. A plain phone alarm does the same with no code. |
| Stillness / shaking from the phone's motion sensor | Plausible | Termux can read the accelerometer. Shaking shows as energy in roughly the 3-12 Hz band. Needs his own baseline. Sitting, sleeping and driving will look like stillness. |
| Heart rate | **Not from the phone** | Pixel 8 has no heart-rate sensor. Needs a wearable. |
| Dampening an outdoor sound | **Not from the phone** | Needs noise-cancelling earbuds or ear protection. The phone can only prompt or switch them on. |
| Message a named person | Plausible | Termux:API can send a text, with permission. |
| Staying alive in the background | **The real risk** | Android stops background apps to save battery. This decides whether any sensor idea works. |

## 4. Rules the build keeps

1. Eric has sole authority. Every sensor and every message is opt-in and can be switched off visibly.
2. Data stays on his device. No cloud, no sharing with any AI unless he chooses.
3. No scores, no streaks, no "failure" copy. A false alarm costs nothing: cues start soft.
4. A cue must not itself startle: haptic or text first, never a loud sound.
5. Thresholds and the time before a message goes out are set by him and change only when he changes them.
6. The sponsor has their own consent and a short card Eric writes: what helps, what to avoid, who else to call.
7. This is a support tool, not a medical device and not a replacement for professional care. If startle or freeze responses are an ongoing difficulty, someone who works with them may help tune it.

## 5. Smallest first step

No sensors. A scheduled soft pre-cue for the predictable event, plus a one-tap "not ok" that texts one named person who has agreed. Use it for two weeks. The taps and what helped become his own calibration data for any sensor later.

## 6. Gate vocabulary (Eric's, held at germ)

Three triads Eric named, plus two parts he linked to the sphincter. They turn out to be one idea: **controlled passage**. Held as seeds, not developed.

| Triad / part | What it is in engineering | Where it fits |
|---|---|---|
| **zero, prime, one** | the loop in section 2 | the whole sequence |
| **and, or, not** | the three basic logic rules | *when* a cue fires, e.g. event AND NOT already ready |
| **yes, no, maybe** | a three-state answer (not a forced binary) | the check-in tap; "maybe" is a real answer, never an error |
| **collector, emitter, base** | the three legs of a transistor: a *small signal at the base gates a large flow* between the other two | the pre-cue. A tiny buzz gates how the big event lands. This is the same thing as bracing early |
| **aperture** | an opening whose size sets how much passes | the sphincter states are aperture states (constricted, dilating, patent) |
| **isolation transformer** | passes a signal across a gap with no direct connection, and blocks surges | the support circle: information crosses, the shock does not |

What is real here: all three parts are genuine, ordinary components, and "a small control signal gates a large flow" is exactly what a pre-cue does. What is **not** yet shown: the geometry and math Eric links to the sphincter (shape, aperture ratios, any equations). I have not seen them, so none are claimed. Bring them when ready.

## 7. Open for the Shepherd

1. What support gear is already in hand (ear protection, earbuds, a wearable)? Sensors wait for a device that carries them.
2. Who is the first person in the circle, and have they said yes?
3. Which cue is tolerable: a buzz, a screen line, or both?

*Hold, don't fill. Nothing here is built, installed or sent. ∞pace∞*
