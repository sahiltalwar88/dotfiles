---
name: bike-route-lane-position
description: "On the pwep world, the cyclist's lateral wander down the road is not a composed line Sahil cares about — the only requirement is that he stays in the middle third of the road"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: b4e97861-ff06-480e-92dc-eac3a9e12591
  modified: 2026-09-12T05:18:58.668Z
---

# The bike route's lane position is not sacred

In `src/world/sites/personal.ts`, the `roadRun` function carries a comment claiming that
the authored route's lateral wander down the tarmac is deliberate:

> "keep its x and z — the lateral wander down the lane is composed, not incidental, and
> snapping to the road's centreline would throw it away"

**That comment overstates Sahil's actual requirement, and a future session should not treat
it as a constraint.** Asked directly how much freedom there was to move route points while
smoothing a kink, he said:

> "the aim is for the biker to be in the middle third of the road at all times. i don't
> have a precise path in mind, so some variance is completely fine."

So the acceptance test for the bike's path along the tarmac is simply that his lateral
offset from the road centreline stays within the middle third. The road is built with
`makeRoad(road, 7, ...)`, so the full width is 7 units and the middle third means an offset
of no more than about 1.17 units either side of the centreline. Anything inside that is
free to change in service of a smoother path.

He also scoped where this matters: only the **road section** of the `/personal` route needs
attention. He has reviewed the rest of the journey — the highway deck, the flight and the
climb to space — and considers it good, and there are **deliberate** bends later in
`/consulting` that must not be "fixed". Do not sweep or smooth the whole route on the
assumption that every kink is a fault.

The general lesson is the one that generalises: a confident-sounding comment in this
codebase records a previous session's belief about what Sahil wanted, and is worth checking
against him rather than obeying. Here the comment would have blocked the simplest fix for
no reason he actually held.
