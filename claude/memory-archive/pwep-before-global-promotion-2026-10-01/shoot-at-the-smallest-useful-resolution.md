---
name: shoot-at-the-smallest-useful-resolution
description: "When capturing frames of the pwep world with the headless screenshot harness, use the smallest viewport that still shows the change being judged"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: bba46b59-816a-4dac-bb33-90bf89a946a2
  modified: 2026-09-09T04:22:23.161Z
---

# Shoot at the smallest resolution that still shows the change

Sahil's instruction on the headless screenshot harness (`npm run shot`, documented in
`CLAUDE.md`): *"make sure to use the smallest resolution at which you will be able to see
your changes, since as you said the renderer is in contention."*

The harness renders the real shaders through ANGLE's SwiftShader on the CPU, so cost scales
with pixel count and a single `/personal` frame can take ten minutes or more. Several of
Sahil's Claude sessions share one machine and often run captures at the same time, so the
renderer is frequently contended and a careless viewport choice costs everyone wall-clock
time, not just the session that made it.

The rule is to pick the viewport from **what is being judged**, not from what looks nice:

- A global tonal change — an ambient fill level, an exposure or contrast shift, whether a
  crown reads lighter or darker — is legible at a few hundred pixels across.
- A change to the SIZE OF PARTS — how fine the needles in a leaf mask are, whether a
  silhouette is ragged or smooth — needs enough pixels landing on the object itself, which
  in practice meant roughly 200 pixels of crown height for the tree work.

A good technique that gets both: capture a modest frame and then crop into the region of
interest and upscale it with PIL, lifting the exposure so dark foliage is actually
inspectable. That reads far better than rendering a large frame, and costs seconds instead
of minutes.

Write captures into `public/shots/`, which the dev server exposes at
`http://localhost:4321/shots/<name>.png`, so Sahil can open the same frame. Sending him an
image file through the agent tooling does not reach him; a served URL does.
