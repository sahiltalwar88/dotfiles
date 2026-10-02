---
name: one-continuous-traveller
description: The vehicles across the pwep world are one man's continuous journey, not separate props placed per zone
metadata:
  pinned: false
---

# The world follows one traveller, not five props

The `/personal` route's waypoints each contain a vehicle: a bike on the Road, a car in
the City, a plane at the Observatory, a rocket at the Archive, and the station and
spaceship in Orbit and on the consulting route. **These are not decorations placed per
zone. They are one man — Sahil — making one continuous journey, and the viewer is
following him through the whole world.**

Sahil has had to state this twice, which means it is easy to get wrong by building each
zone in isolation. First: "if we're following my journey, we should see the bike turn
into the car turn into the rocket, etc - we're following me through this space." Then,
after a round where each vehicle was correctly placed but independently: "the biker
doesn't turn into the car, which doesn't turn into the plane, which doesn't turn into the
rocket - they just kinda float in out of nowhere."

So placing a vehicle correctly inside its own zone is not enough and never satisfies him.
What he is asking for is **continuity across the zone boundary**: the vehicle must appear
to become the next one rather than fading out while a different object independently fades
in somewhere else in frame. That points at a single persistent traveller object that
swaps its form at boundaries while its screen position and motion stay continuous, rather
than one prop per zone group each with its own reveal gate.

The corollary for any future actor in this world: before adding a figure or a vehicle,
ask what it is in the story of the journey. A "random person standing outside the
observatory" with no legible activity reads as a bug to him even when the geometry is
fine — he asked for the rock climber to be given back the rock he was climbing, or else
deleted outright, rather than left standing there unexplained.
