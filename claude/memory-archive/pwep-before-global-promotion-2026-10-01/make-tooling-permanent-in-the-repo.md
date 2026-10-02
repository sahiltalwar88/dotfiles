---
name: make-tooling-permanent-in-the-repo
description: "When a throwaway harness or tool proves useful on the pwep world, Sahil wants it committed into the project and written into the plan documents rather than left in a session scratchpad"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 3537332a-f570-4481-b363-7e16a37e7c53
  modified: 2026-09-09T01:51:16.984Z
---

# Useful tooling belongs in the repo and in the plan docs, not the scratchpad

After I built a headless-rendering rig in the session scratchpad — playwright plus
SwiftShader, so the Three.js world could actually be looked at without a GPU — Sahil's
immediate response was not about the rendering at all: **"could you please update plan.md,
rings-plan.md, and trees-plan.md with the information about how you're verifying things
visually, and also make those changes permanent into the project? i think that's very
necessary and useful throughout this project."**

So when a harness, script or technique turns out to be worth keeping:

- **Move it into the repo** — a real script under `scripts/`, wired to an npm script, with
  a setup script if it needs one, so it survives the session and works for whoever runs it
  next.
- **Write it into the plan documents**, not only `CLAUDE.md`. He named all three of the
  per-problem plans specifically. Each one has a "verify it this way" section that was
  written when the capability did not exist, and those statements go stale and actively
  mislead — `PLAN.md`, `RINGS-PLAN.md` and `TREES-PLAN.md` all said "there is no WebGL
  here" long after that stopped being true.
- **Correct the old claim explicitly** rather than adding the new one alongside it. A
  document that says both is worse than one that says neither.

The reasoning is that the value of a tool like this is spread across every future round and
every parallel agent, and none of them read a scratchpad. A capability that only exists in
one session's temporary directory has been built and then thrown away.
