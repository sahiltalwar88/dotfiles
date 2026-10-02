---
name: never-claim-a-change-is-free-unmeasured
description: "Never tell Sahil a pwep world change costs nothing unless you have measured it; he checks, and an architectural argument like \"it is one draw call\" is not a measurement"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: c496d0bc-4d45-4ca6-a751-8771910ac320
  modified: 2026-09-18T05:56:50.940Z
---

# Never call a change free unless you have measured it

On the pwep world Sahil makes adoption decisions conditional on cost. When told
the denser leaf option was cheap because the leaf field is "one draw call and one
program, so the cost is fill rate", he answered: *"you're saying s2 is the same
render cost as the default? if so, holy shit, YES let's make that the default …
but are you really sure there's no extra render cost to that??"*

He was right to ask. The honest answer was that it cost **8.7% more leaf
triangles**, and I had reasoned from architecture rather than counting anything.
"One draw call" says a change will not add draw calls. It says nothing at all
about triangle count, fill rate, build time or frame time, and using it as a
stand-in for those is the mistake.

So: before telling him a change is free, count the thing that would grow. Offline
harnesses that build the real zones give exact geometry counts in seconds, with no
GPU and no screenshot — there is no excuse for an estimate. If a number genuinely
cannot be had from here (frame time on his 3070 Ti is the standing example, since
a headless rasteriser says nothing about it), say it is unmeasured and name what
he would have to read off his own `?perf` panel, rather than implying it is
nothing.

The wider habit this belongs to is his standing one on this project: put the
number on the glass before forming the hypothesis. A cost claim is a hypothesis.

## The corollary that made the same round worse

Because the cost claim went unmeasured, so did the *effect*. When the individual
knobs were finally counted one at a time, two of the three he had asked to adopt
turned out to be no-ops — one was already the default, and the other changed only
a zone he had not been looking at. Measuring per knob, not per batch, is what
caught it, and it is the same discipline the project already applies to visual
A/Bs: test every knob alone before crediting it with anything.

## Attributing a real number to the wrong thing counts as the same mistake

The `?perf` panel's `grass`, `leaf` and `tris` lines are WORLD totals summed across
every zone, not the zone on screen. Reading "1.28M leaf cards, 240k grass blades"
off the panel while looking at the Observatory and telling him those belonged to
the Observatory was wrong twice over: the Observatory has no grass at all
(`makeGrass` is called only from the city's planting and the Road's forest), and
its forest is one of four in that leaf total. He spotted it immediately — "what
grass is there in the observatory? i don't see any AT ALL, so that is very
concerning" — because a number that large in a place he can see is empty implies
the engine is building something invisible.

So a performance number quoted to him needs its SOURCE checked as well as its
value: which object, which zone, summed over what. Grep the call sites before
naming the thing that owns the cost.
