---
name: one-knob-per-change-not-one-per-batch
description: "When several visual changes land together on the pwep world, Sahil wants each behind its own URL knob so he can test them independently and in combination"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 30f6bc51-1bd6-49a5-8648-8b020c0d6334
  modified: 2026-09-09T05:17:40.451Z
---

# Give each change its own knob, not one knob for the batch

On the Three.js world, Sahil already expects a URL knob for every visual change. The
refinement he stated when releasing a three-part round of work at once — textures,
environment reflection and glass translucency — is that they must go behind **different**
knobs: "do all 3 and put them behind different knobs so they can be tested independently
and together."

So a batch of N visual changes gets N knobs, never one combined switch. The reason follows
from how he reviews: he judges by eye in a browser, and if two changes ship on one flag he
cannot tell which one produced the effect he likes or dislikes, nor see whether they
interact. Separate knobs let him isolate each and also turn them all on together, which is
the comparison a single flag makes impossible.

This holds even when the changes were agreed as one task and even when he is away and
wants continuous progress — under that condition it matters more, not less, because the
whole batch arrives for review at once.
