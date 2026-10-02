---
name: natural-detail-needs-far-more-density
description: "On the pwep world, Sahil's correction to natural detail — grass, foliage — is almost always \"smaller and far more of it\"; my density estimates have been consistently far too low"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: dc79ea8b-0e76-4e4e-a078-d0c32aeeabad
  modified: 2026-09-08T18:32:20.096Z
---

# When it does not look natural, the answer is usually more of it, smaller

Twice now on the pwep world Sahil has corrected a natural-detail pass in the same
direction, and both times my own estimate was far too conservative.

On the grass, after seeing 45,000 blades he said **"i think 100K is the right
number"** — more than double what I had judged sufficient, and he added that he
was "blown away by how little impact all this has on the performance".

On the tree foliage, after a rebuild he still said it did not look like a tree:
**"i think the leaves are too big and there aren't enough of them, and they don't
cover the wood at all - you can only see glimpses of trunks and branches in
trees, not see most of the branch and trunk with a only couple of leaves in the
way."**

That last sentence is the general rule, and it is worth holding onto beyond
trees: in real vegetation the DETAIL OCCLUDES THE STRUCTURE. You see fragments of
trunk and branch through a mass of leaves, not a clearly drawn skeleton with some
leaves resting on it. Any foliage where the wood reads clearly is too sparse,
however good the individual leaf is.

So when building this kind of thing, start from a density that feels excessive
and a element size that feels too small, then measure the cost rather than
guessing at it. This project has plenty of GPU headroom on his machine and one
draw call covers any instance count; the thing that actually costs is build time,
which is measurable and which he will trade for a better look. Erring sparse has
cost two review rounds; erring dense has cost none.

He also reviews these by putting a real photograph beside the render — a
broadleaf in a field, a stand of pines — so the comparison being made is against
a photograph, not against a stylised ideal.
