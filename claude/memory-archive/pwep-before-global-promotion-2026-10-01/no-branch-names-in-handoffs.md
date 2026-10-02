---
name: no-branch-names-in-handoffs
description: Do not name a git branch in pwep-consulting-website handoff or plan documents — they go stale and send the next session to the wrong place; say to use the current branch instead
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 4471d77f-ae54-4385-b89d-35d2a4ad77f6
  modified: 2026-09-23T06:02:05.638Z
---

# Handoff documents must not name a branch

A handoff in this repo told the next session to work on `world-rounds-12-onwards`
while the checkout had long since moved to `world-round-14`. I raised the mismatch
before starting, and Sahil's answer was:

> "ah - the handoff is old. go with the current branch, and remove that from the
> handoff please - don't specify the branch in case it continues to persist as an
> issue."

So: when writing or editing a handoff, plan or brief for another session, **do not
write a branch name into it.** Branches on this project turn over faster than the
documents that reference them, and a stale name is worse than no name — it reads as
authoritative and quietly sends the work to the wrong place, or costs a round trip
to resolve, which is what happened here.

Write "the current branch" instead. Instructions that genuinely matter and do not go
stale — never push, stage only your own files by explicit path, never `git add -A` —
stay in the document as they are.

The same reasoning applies to anything else in a handoff that the checkout can move
underneath: prefer describing how to find the current state over transcribing what it
was on the day the document was written.
