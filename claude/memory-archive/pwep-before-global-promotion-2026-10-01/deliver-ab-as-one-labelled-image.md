---
name: deliver-ab-as-one-labelled-image
description: "Sahil cannot judge an A/B given as two separate screenshot URLs; deliver a single labelled side-by-side (or stacked) image, cropped and zoomed to where the change is"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 30f6bc51-1bd6-49a5-8648-8b020c0d6334
  modified: 2026-09-09T15:37:21.333Z
---

# An A/B has to arrive as ONE labelled image

When comparing two renders of the pwep world, do not hand Sahil two URLs and ask him to
flip between them. He told me plainly: **"i actually see no difference between bare-0 and
bare1, i have no idea which one has textures. am i missing something?"** — and separately,
of a whole round of changes, **"i'm not quite sure if your changes applied."**

Two full-frame screenshots at different URLs are close to unusable for judging a subtle
difference. He has to open two tabs, switch between them from memory, and hold a whole
900x560 city in his head to spot a change that may occupy a few per cent of the pixels.
Even when the difference is real and measurable, that delivery hides it.

So compose the comparison for him:

- **One image**, the two variants stacked or side by side, with a visible separator.
- **Labels burned into the image** saying which is which — not just the filename, because
  the filename is not visible once he is looking at the picture.
- **Cropped to where the change actually is**, and scaled up. A near facade at 4x tells him
  more than two full frames.
- Say in the reply what he should be looking for and roughly where, in plain words.

The same applies to knob state. A change that is default-off looks identical to a change
that did not land, so make it visible that the knob took effect — put the active feature
flags on the `?perf` panel rather than expecting him to trust the URL he typed.

The underlying reason is the one that governs this whole project: he judges by eye, and a
difference he cannot see is a difference that does not exist yet. Measurements in the reply
do not substitute for making it visible.
