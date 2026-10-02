---
name: blocked-overnight-means-pause-not-fallback
description: "When Sahil is away and a task hits a blocker that affects quality (a login, a key, a missing source), pause that task and write it up rather than building a lesser fallback"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 8dd4795b-f9d4-4d95-b216-1e1c2e3a8c3b
  modified: 2026-09-15T06:28:35.783Z
---

# Blocked while he is away: pause, do not fall back

When Sahil leaves an autonomous run going and a task is blocked on something only he can
provide, such as an account login, an API key or his choice of source, the right move is to
**pause that task and write up exactly where it stopped**. Do not route round the blocker
with a cheaper or lower-quality substitute just to have something to show in the morning.

He said so when asked whether an overnight statue-modelling run should fall back to the next
option if his preferred model source was blocked: "pause, i will come back and fix it in the
morning - don't build something suboptimal just because i'm not here."

The reason is that on the pwep world a suboptimal build is not free progress. He reviews
everything by eye, work built on the wrong foundation has to be unwound, and he is
cost-conscious about wasted tokens and GPU time. A clear account of the blocker costs him one
minute to clear. A substitute build costs a review cycle and then gets thrown away.

This does not mean stopping the whole run. Work that is the same whichever way the blocker is
resolved, such as an import pipeline that every candidate source feeds into, is still worth
doing. What gets paused is work whose quality depends on the missing input.

This fits with the "prefer stating an assumption over blocking" guidance for away-runs. That
guidance covers small decisions that can be undone. A choice that decides how good the result
is belongs to him, even while he is away.
