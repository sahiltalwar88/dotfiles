---
name: hardcode-it-rather-than-another-rule
description: "When a procedural rule has repeatedly failed to fix a specific thing Sahil can see in the pwep world, he wants it hardcoded rather than another attempt at the rule"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: bba46b59-816a-4dac-bb33-90bf89a946a2
  modified: 2026-09-09T23:32:27.103Z
---

# When a rule keeps missing, hardcode the fix

Sahil's instruction after the fourth failed attempt at making two particular pine
trees look different from each other: **"we STILL need to make the two pines right in
front of the camera different heights. hardcode it if you need to at this point, but
fix it."**

The lesson is about when to stop generalising. The pwep world is largely procedural —
forests, cities, rings are all generated — and the instinct when something looks wrong
is to improve the generator. That is right the first time and wrong the fourth. Once a
rule has been rewritten several times and the thing he is pointing at is still wrong,
he would rather have the specific thing fixed by name than see another rule. He is
judging one composed frame, and a generator that is correct on average can still be
wrong in the only shot that matters.

So: prefer an explicit, named override applied after the procedural passes, keyed to
something stable (an object's own seed, not its index), documented with what it is
compensating for. Say plainly in the code that it is staging rather than a fix to the
generator, so the next reader does not "clean it up" back into the failure.

Two things make this land well rather than badly:

- Give him a way to identify the thing he is describing. He points at objects by where
  they appear in the frame — "the broadleaf in the center", "the two on the left side
  of the road" — and nothing connected that to the generated object list until a small
  harness printed each tree's seed alongside its screen position. Build that tool; the
  override is then a two-line change instead of a guess.
- Check what he is actually judging before writing the rule at all. The pines had been
  "fixed" four times by making their WORLD heights differ, while what made them read as
  twins was that their crowns landed at the same height ON SCREEN — the further tree
  was also the taller one and perspective cancelled the difference. Measure the
  quantity he can see.
