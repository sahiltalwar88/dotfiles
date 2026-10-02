---
name: always-research-before-rethinking
description: "Sahil's standing instruction on the pwep world — always go and research existing implementations when asked to do something new or to rethink an approach, before writing anything"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: baffd0aa-f21b-46f2-9b0a-21eb344831d7
  modified: 2026-09-08T20:47:57.488Z
---

# Research first, whenever the task is new or a rethink

Sahil has made this a standing rule, in his own words: **"ALWAYS research when i'm
asking you to do something new or rethink something."** The capitalised "always" makes
it a hard rule rather than a preference, and it generalises earlier instances of the
same instruction that were previously scoped to single features — he had already said,
about the grass, "i am SURE there is a better implementation online somewhere, i want
you to find it and use that", and had asked twice for the ice that existing work be
found rather than another attempt written.

So when he asks for something that does not yet exist, or says an approach is wrong and
needs rethinking, the first move is to go and find how the problem is actually solved
elsewhere — not to reason it out and write a fresh implementation. Doing so has been the
difference between the work landing and the work being rejected: the grass only became
convincing once a real implementation was found and adapted, after three rounds of
hand-rolled attempts he judged as "this doesn't at all look like grass".

This does not mean taking a dependency. The related standing preference is to extract the
smallest useful part rather than pull in a whole package, and to credit the source with a
link both in the code and in `CREDITS.md`.

The rule applies to the rethink itself, not only to the implementation. When he says an
area is "not it" and asks for a step back, the step back should include finding out what
the established approach is, so the plan that comes back is grounded in how the problem
is really solved rather than in my own first principles.
