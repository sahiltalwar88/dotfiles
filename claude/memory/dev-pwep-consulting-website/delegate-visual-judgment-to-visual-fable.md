---
name: delegate-visual-judgment-to-visual-fable
description: "On the pwep world, hand questions of how a frame looks or where things sit in space to the visual-fable subagent rather than reasoning about them in prose or offline metrics"
metadata:
  node_type: memory
  pinned: false
  originSessionId: 23c2423f-14ef-4c9d-8e00-24097292b528
  modified: 2026-10-02T03:27:36.523Z
---

# Hand visual and spatial judgment to visual-fable

Sahil has had to remind me that the project has a `visual-fable` subagent for "Three.js
scene composition, camera choreography, shader and lighting judgment":

> "remember that you can farm out tasks requiring advanced visual / spatial awareness
> to visual-fable."

Both reminders followed the same failure. Once I reasoned about how the city would look
from prose and arithmetic and promised differences that turned out to be invisible. Once
I built an offline numerical metric for why tree crowns read as an undifferentiated mass
and shipped four knobs that made no visible difference: the metric said the change worked,
his eye said it did not, and his eye was right.

So the split is by faculty. Countable things — overdraw, triangle budgets, clearances,
heights — suit harnesses and engineer agents. Whether a frame *reads* — does a crown look
like foliage, will a change show at that distance, does a composition or camera move work,
what a lighting or shader change does to the picture — goes to `visual-fable`, with the
concrete numbers and any screenshots that exist. The surrounding engineering (generating
geometry, measuring, wiring knobs) stays with cheaper agents; fable is the most expensive
tier and is not the default.
