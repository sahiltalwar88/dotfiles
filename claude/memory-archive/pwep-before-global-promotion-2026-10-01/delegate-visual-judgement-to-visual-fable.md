---
name: delegate-visual-judgement-to-visual-fable
description: "On the pwep world, hand tasks that need real visual or spatial judgement to the visual-fable subagent instead of reasoning about the look alone"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: bba46b59-816a-4dac-bb33-90bf89a946a2
  modified: 2026-09-08T23:47:12.057Z
---

# Farm visual and spatial work out to `visual-fable`

Sahil has reminded me directly: *"remember that you can farm out tasks requiring
advanced visual / spatial awareness to visual-fable."* He said this after a round
in which I spent a long stretch building an offline numerical metric for a
look-and-feel problem — why tree crowns read as an undifferentiated mass — and
shipped four URL knobs that he then looked at and found made no visible
difference at all. The measurement said the change was working; his eye said it
was not, and his eye was right.

The lesson is about which faculty a task needs. Arithmetic harnesses are good for
things that are genuinely countable — overdraw, triangle budgets, clearances,
whether two trees are the same height. They are a poor substitute for judgement
about how a frame *reads*: whether a crown looks like foliage, whether a shape is
believable, whether a change is an improvement rather than merely a difference.
For that second kind of question, dispatch `visual-fable`, whose profile exists
for exactly this — scene composition, camera choreography, shader and lighting
judgement.

This sits alongside the standing instruction to research existing
implementations before rethinking something. Research tells me what the
established technique is; `visual-fable` tells me whether what I built actually
looks right. Reaching for neither and reasoning about the picture alone is the
failure mode to avoid.

Note that a subagent cannot see screenshots pasted into the conversation — those
are not on disk. Point it at image files under
`~/.claude/projects/-home-sahil-dev-pwep-consulting-website/refs/`, or save the
frame first, so it has something real to look at.
