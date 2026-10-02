---
name: dont-go-silent-while-waiting
description: "While background agents or renders are in flight on the pwep world, never end the turn silently — Sahil reads a quiet pause as having stopped"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 29ae9fee-e603-4d13-a426-f13d659a3572
  modified: 2026-09-16T03:11:25.994Z
---

# Waiting quietly looks like stopping

When work is genuinely in flight — background subagents researching, headless captures
rendering, a long build — Sahil does not want the turn to end on a status note while I wait
for the notification. He has pulled me up on it more than once in the same session:
"checking in, still going? you stopped again". The "again" is the part that matters; from
his side an idle turn and an abandoned task look identical, and he sits there wondering
which one it is.

So while something is running, either keep doing useful work that does not collide with the
running task (reading code the subagent is not reading, inspecting a frame that has already
landed, preparing the next step), or say explicitly what is running, what it is waiting on,
and that I will continue when it lands. Checking on it with a cheap command and reporting
the real state — "two captures done, the third is queued behind another session's render" —
is better than silence.

This does NOT conflict with the standing rule to stop and ask for feedback at task
boundaries. That rule is about not *starting the next task* without his say-so, and it still
holds absolutely. This is about the middle of a task I am already doing: a pause there is
not a check-in, it just looks like a stall.

The underlying reason is the same one behind his other process rules: he is often waiting to
do something else, and he cannot tell research from work from a hang unless I tell him.
