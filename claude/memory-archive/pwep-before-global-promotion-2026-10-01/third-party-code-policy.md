---
name: third-party-code-policy
description: "Sahil is happy for the pwep world to use third-party implementations, but wants the smallest thing that works — extract the relevant part rather than take a whole dependency, and flag anything heavy instead of deciding alone"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: dc79ea8b-0e76-4e4e-a078-d0c32aeeabad
  modified: 2026-09-08T17:43:29.695Z
---

# Use other people's code, but take the smallest piece of it

On the pwep world I had been hand-rolling everything procedurally — trees, ships, grass —
and each attempt came back wrong. Sahil's reaction was not "try harder", it was to point
me at prior art: **"feel free to research online, i'm sure someone has already built this
and you can likely just take that."** When I then researched the *method* and wrote my own
implementation anyway, he noticed and asked directly: **"did you research online, or did
you just make another attempt?"** Researching the technique and then hand-rolling it is
not what he is asking for.

His policy when asked outright, and it is a standing one rather than a one-off:

> "absolutely, use those as long as they don't tank performance and aren't huge. if they
> ARE huge or tank performance, if they're open source, try to use the relevant portion
> without taking the entire dependency; otherwise just flag it for me"

So the order of preference is: take the working implementation; if it is heavy, lift only
the part that is needed, keeping its licence and attribution; if neither is possible,
bring the decision back to him rather than quietly writing a worse version from scratch.

The two constraints in that sentence are the ones he actually cares about — bundle size
and frame rate — which is the same standing trade recorded elsewhere: on this project a
technique that costs frames is not worth the look. Note also that "credible" is his bar
for these things: asked how much budget grass could have, he answered "do whichever method
is going to get us to a credible rendition of grass without ending up with a huge
performance hit", which is a result to hit rather than a technique to pick.

## This is the DEFAULT for every visual feature, not a note about one of them

The failure mode is narrower than it looks and I have fallen into it after being
corrected. Told to find a real implementation for the grass, I did — and the grass came
back "amazing". In the same round I then hand-rolled the tree foliage and the ice
asteroids from scratch, and both came back rejected in the next message, each with the
same instruction attached again: **"look for existing work online to use if you haven't
already"**, said once for the trees and once for the ice.

So the instruction is not scoped to the feature he happened to be looking at when he gave
it. Before building ANY new visual element in this world — foliage, rock, water, cloth,
glass, fire, a material treatment — the first step is to go and find how it is actually
done and take that. Writing it myself is the fallback after that search fails, not the
starting point, and "I know roughly how this technique works" is exactly the thought that
produces the version he rejects.

A concrete example of what the difference looks like: my leaves were opaque solid diamonds
scattered in a ball around each foliage cluster, and they read as debris floating near the
tree. Every real implementation uses alpha-masked leaf-cluster cards placed at branch
tips, oriented along the branch, with normals blended toward the crown's centre so the
canopy shades as a rounded mass. Those three details are not things you arrive at by
reasoning from first principles; they are what you get by reading someone's code.

## Credit every source, with links

Standing instruction, given after the grass shipped: **"make sure you credit all sources
with links, including grass."** So attribution is not just the licence header that a
permissive licence legally requires — he wants the source named and LINKED, for everything
borrowed, and he wants it kept up to date retroactively when something new is added.

Put the link where it survives: in the source file next to the borrowed code, and in a
credits file at the repository root so it can be read without opening the code. Name what
was taken and what was only read and rejected, because the second is as useful to the next
reader as the first.
