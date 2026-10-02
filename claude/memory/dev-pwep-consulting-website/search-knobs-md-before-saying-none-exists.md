---
name: search-knobs-md-before-saying-none-exists
description: "Never tell Sahil a pwep knob does not exist without grepping KNOBS.md and the knobs/ registry first — he remembers the ones he asked for, and he will make you verify"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 1a5f1179-2648-4713-b7cb-7a273b973c0d
  modified: 2026-09-20T06:30:15.281Z
---

# Grep the registry before claiming a knob does not exist

When Sahil asks which knob controls something in the world, the answer must come
from a search of `KNOBS.md` and `src/world/knobs/*.ts`, never from what I happen
to have read in the current file. There are well over four hundred knobs and he
has asked for most of them himself, so his recall of one existing is better
evidence than my not having seen it.

This went wrong on the mountain's fog. He asked which knob raises the height of
the fog around the mountain. I had just been reading `observatory.ts`, saw that
the *mist's* waterline was a hard-coded 62, and told him no height knob existed —
then added one. He replied:

> "you are mistaken, it DOES exist. it's summithifog or summitfog or something
> like that - please verify"

He was right. `?summitfogtop` (range 10-300, default 300) is exactly a waterline
height in world units, with `?summitfogfade` for how fast it falls off above that
line. I had conflated two different height terms in the same shader — the mist's
gate and the fog's gate — and answered about the one I had open.

The specific trap is that a shader can carry several height terms that all look
like "the height of the fog", and only some are exposed. So the answer to "which
knob does X" is a grep, and when two terms both plausibly match, name both and
say which one governs the thing he is pointing at. A half-remembered name from
him ("summithifog or summitfog or something") is a strong signal to search on the
stem rather than to correct him.
