---
name: ask-for-his-url-params
description: "When a screenshot Sahil sends cannot be reproduced from the pwep world's defaults, ask him for the URL parameters rather than reverse-engineering the camera from the image"
metadata: 
  node_type: memory
  pinned: true
  originSessionId: b4e97861-ff06-480e-92dc-eac3a9e12591
  modified: 2026-09-12T23:32:26.080Z
---

# Ask for the URL when you cannot reproduce his frame

Sahil reviews the `pwep-consulting-website` world by scrolling it in a browser with URL
knobs set, and the screenshots he sends are from whatever state his browser is in — often a
scroll position and a combination of knobs that the defaults do not reproduce. When a
screenshot does not match what the headless harness renders, **ask him for the URL and
scroll position**. He said so directly:

> "next time just ask me for my url params if you're not sure how to reproduce my camera"

This came up after he marked a red box on a screenshot and asked for the trees inside it to
be made taller. The frame had a white sky and full-bright city, nothing like the default
night scene, so it could not be matched from the defaults. Instead of asking, I spent
several headless captures at different scroll positions trying to find the matching camera,
then added a lens readout to the `?perf` panel to recover it. The engineering was sound and
worth keeping, but the whole detour was avoidable: one question would have produced the
answer immediately, and each capture costs real time on a shared GPU.

The general shape of the mistake is treating a missing fact as something to be derived when
the person who has it is in the conversation and responsive. Facts about the code are mine
to find; facts about **what he did in his browser** are his, and only he has them.

A practical corollary, still worth doing: the `?perf` panel now prints a `lens at (...)
facing (...) fov N` row, and `scripts/frame-trees.ts` takes `--cam` / `--dir` / `--fov` /
`--aspect` / `--depth` / `--x` / `--y`. So once he supplies a URL, a box drawn on any frame
can be turned into a list of tree seeds and world coordinates. Ask for the URL first, then
use the tooling.
