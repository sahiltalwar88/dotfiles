---
name: headless-captures-one-at-a-time
description: "pwep headless captures (npm run shot / shot:page) — about 900px wide at most, strictly one at a time across all sessions and subagents, never chained with a build; read CLAUDE.md's rendered-frame section first"
metadata:
  node_type: memory
  pinned: true
  originSessionId: 23c2423f-14ef-4c9d-8e00-24097292b528
  modified: 2026-10-02T03:27:31.308Z
---

# Headless captures: about 900px, one at a time

This merges six earlier notes about the screenshot harness, two of which had gone stale.

**Read CLAUDE.md's "Looking at the rendered frame" section before capturing.** The
harness moved from SwiftShader on the CPU (about one frame a second) to the real RTX
3070 Ti through WSL2's D3D12 path, and the advice inverted when it did: Sahil's earlier
"use the smallest resolution you can" was about CPU render time, and on the GPU a
900x560 frame costs less than 480x300 did. Old notes telling you to shoot at 480x300
are obsolete.

**What still binds is host RAM, not the GPU.** The box is shared by many Claude
sessions with little headroom, and a headless Chromium is the heaviest thing anyone
runs here. Sahil's IDE crashed while a session ran four captures back to back at
1854x1340, and again when three `visual-fable` subagents each ran captures at once
("something one of you did killed the system repeatedly"). Exit code 137 is the
OOM killer, not a failing command. So:

- Keep the viewport around 700-900px wide. Take his exact buffer size only for one
  deliberate frame, and say why.
- Never run two captures at once, and never chain a capture with `astro build`.
  `shoot.cjs` takes a cross-session lock; respect it rather than `--nolock`.
- Several subagents at once are fine — he said so explicitly — but their captures
  must not overlap. When delegating, cap how many captures each may take and tell
  them to serialise.
- Take the fewest frames that settle the question, and check `free -g` first.
