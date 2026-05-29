# Quest 000: THEE — The Door

**Status:** OPEN on fork  
**Blocks:** all other quests  
**Type:** initiation

---

## The Unknown Arrives

You have forked this template. The concept does not exist yet.

THEE asks: **The what?**

---

## Objective

Name this concept. Give it its first mark. Open the door.

## Steps

1. Open `prima.yaml`
2. Set `concept.name` — what is this world called?
3. Set `concept.tagline` — one sentence that says what this world is
4. Open `world/lore.md` — write the first line of this world
5. Run: `bash tools/thee.sh "this concept is [your answer]"`
6. Run: `bash tools/yod.sh "[smallest true first action]"`

## Completion Check

```bash
grep -q 'name: "My Prima Terminal"' prima.yaml \
  && echo "INCOMPLETE — name not set" \
  || echo "Quest 000 complete — THEE opened the door"
```

## What Opens Next

Once `prima.yaml` has a name and `world/lore.md` has a first line:

- Quest 001: Awakening becomes available
- The intake layer activates
- Your concept has a door

---

*THEE opens. YOD marks. EMBER warms.*
