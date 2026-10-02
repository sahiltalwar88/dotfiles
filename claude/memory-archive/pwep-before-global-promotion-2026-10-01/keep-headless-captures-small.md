---
name: keep-headless-captures-small
description: "Headless SwiftShader captures on the pwep world are a shared, contended resource across Sahil's concurrent sessions, so use the smallest viewport that still answers the question"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 3537332a-f570-4481-b363-7e16a37e7c53
  modified: 2026-09-09T04:09:02.652Z
---

# Capture at the smallest resolution that answers the question

The headless-Chromium rig (`npm run shot`) renders through SwiftShader on the CPU, and
Sahil usually has two or three sessions working in this repo at once. His instruction:
**"use the smallest resolution you can get a meaningful answer on your changes with - there
is contention on swiftshader since there are 2 other sessions using it."**

So treat rendering time as a shared budget rather than a private one. Practically:

- Default to something like 480x300 or 560x360. Go larger only when the question genuinely
  needs the pixels — reading fine facade detail, say — and then take one frame, not a set.
- Take the fewest frames that settle the question. A capture takes minutes at roughly one
  frame per second, and the `--settle` wait for a zone cross-fade is over a minute on its
  own, so a casual sweep of six scroll positions is a long occupation of a shared CPU.
- When delegating to subagents, pass this constraint on explicitly and cap how many
  captures each one may take. Several agents each deciding independently to render a few
  large frames is how the machine gets saturated.

The underlying point is the same one behind his cost-consciousness generally: the expensive
resource should be spent on the frames that actually decide something.
