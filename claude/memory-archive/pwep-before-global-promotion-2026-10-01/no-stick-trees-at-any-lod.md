---
name: no-stick-trees-at-any-lod
description: "On the pwep world, a level of detail must never degrade a tree to a bare armature or a single cone — keep a minimal leafy silhouette and a few leaf cards even far from the camera"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: ddd7af3a-c3d4-43ff-b9c6-17f4c071a804
  modified: 2026-09-21T02:29:38.363Z
---

# Cheaper trees, never bare trees

When cutting cost in the `pwep-consulting-website` forests, Sahil's standing
instruction is that no level of detail may leave a tree reading as a stick:

> "no more stick trees - is there a way to make a tree out of, say, 10 triangles
> instead of 1 cone? let's shoot for that kind of approach - maybe the equivalent
> of roadleaf / streetleaf / obs leaf is .1 when the trees are outside the high
> detail zone"

Two distinct failure modes had produced that look, and both are the sort of thing
a performance pass reaches for first. The far tier drew a single five-segment cone
with no trunk — a spike with no waist. The mid tier drew a thirteen-frond armature
with no leaf cards at all — a bare skeleton. Each was defensible as "a few percent
of a screen pixel", and each was visible enough that he objected.

The shape of his preference: he would rather spend a handful of triangles than let
a silhouette stop reading as the thing it represents. Ten triangles instead of one
cone is cheap; a tenth of the near tier's card density on distant trees is cheap.
Spend that, and take the saving from the count and the reach of the expensive tier
instead — the leafed radius and its cap, which is where the cost actually lives.
Cutting the leafed band from 70 to 49 units halved the Road's cards, and a fifth of
the Observatory's card density cut that forest by 79%, while adding cards back to
the mid tier cost almost nothing by comparison.

The general rule for any LOD work here: reduce DENSITY and REACH, not the
existence of the feature. A thing that disappears or turns into a primitive is a
worse trade than the same thing at lower fidelity, even far away.
