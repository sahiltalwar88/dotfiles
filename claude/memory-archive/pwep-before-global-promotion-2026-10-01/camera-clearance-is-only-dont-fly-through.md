---
name: camera-clearance-is-only-dont-fly-through
description: "The pwep city's density must be uniform everywhere including beside the camera path — the only clearance rule is that the camera must not fly through a building"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 2d01ad48-93e3-4537-a877-986a99730159
  modified: 2026-09-13T18:12:35.956Z
---

# The only clearance rule is "do not fly through a building"

The city in the pwep world should be **the same density everywhere**, including directly
beside the camera's flight path. There is no sparse band, no thinned-out corridor and no
special treatment of the side of the frame the text sits on.

Sahil's words, correcting me when I assumed he wanted the left side kept low-density:

> "i don't want low density on the left, it should be exactly same density as the rest of
> the city - my only preference is that we don't fly THROUGH buildings. but big buildings
> flying immediately to the side and passing directly over low buildings are totally
> acceptable"

So the constraint is a hard geometric one — no intersection between the camera and any
building — and nothing softer. A tower whose face passes a few units from the lens is
good, not a problem to be fixed. Flying directly over the roof of a low building is good.
Both of those read as speed and scale, which is what the shot wants.

This matters because the project has repeatedly over-applied clearance. There is a
building-exclusion corridor carved along the camera spline, and a long history of work
(`?corridorfill` and the rest) trying to put buildings *back* into the empty band it
creates beside the highway. His verdict on the result was that the area around the highway
reads as "lots of open empty spaces". The corridor was solving a problem he does not have
at a cost he does not want: the fix direction is to make the exclusion as tight as the
geometry truly requires, not to generate filler for a gap that should never have been cut.

A related note from the same message: he wants **giant decals on big unobstructed building
faces**, and asked for five — three on the right of frame, two on the left. He gave the
same 3-right/2-left split for the five statues, and for the same reason: the camera flies
low on the left, so left-hand objects are more easily obstructed and fewer of them survive.
When placing anything that must be SEEN, weight it to the right of frame.
