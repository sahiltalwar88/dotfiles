---
name: delegate-visual-judgment-to-visual-fable
description: Sahil wants work needing real visual or spatial judgment on the pwep world handed to the visual-fable subagent rather than done by reasoning about it in prose
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 3537332a-f570-4481-b363-7e16a37e7c53
  modified: 2026-09-08T23:55:55.667Z
---

# Hand visual and spatial judgment to visual-fable

Sahil has a `visual-fable` subagent defined for this project — "Three.js scene composition,
camera choreography, shader and lighting judgment" — and he has had to remind me it exists:
**"remember that you can farm out tasks requiring advanced visual / spatial awareness to
visual-fable."**

The reminder came after a run of rounds in which I reasoned about how the city would look
from prose and arithmetic, promised differences that turned out to be invisible, and spent
his review rounds discovering it. That is the failure mode the agent is there to prevent.

So when a task turns on how something will actually look or on where things sit in space —
whether a change will read at a given distance, how a camera should move, whether a
composition works, what a lighting or shader change will do to a frame — delegate it rather
than working it out in text. Give the agent the concrete numbers and any screenshots that
exist; its answer is a judgment call I should not be making by inference.

This does not extend to the surrounding engineering. Generating the geometry, measuring it
offline, wiring the knobs and verifying the build are ordinary work. It is specifically the
"does this look right, and where should it go" question that belongs with the visual agent.

Note the related standing point that his suggestions about which model or agent to use are
suggestions rather than orders — but this one he has now raised unprompted, which makes it
a preference worth following by default.
