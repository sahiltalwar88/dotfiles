---
name: prefer-real-models-over-img2threejs
description: On the pwep world, build a recognisable real-world object by downloading a real third-party model and baking it with scripts/craft-bake.mjs — never by reconstructing it procedurally with the img2threejs pipeline, which Sahil judged not very good and abandoned
metadata:
    pinned: false
---

# Bake a real model; do not reconstruct one procedurally

The pwep world has two routes for getting a recognisable real-world object —
a spaceship, a car, an aircraft — into the scene:

1. **Download a real third-party model** (Sketchfab and similar) and bake it
   into compact vertex data with `scripts/craft-bake.mjs`, which stands the
   model nose-down −Z, cuts it with meshoptimizer, clusters its textures into
   a handful of solid paints and writes ~40 KB of base64 into
   `src/world/ship-<name>-baked.ts`. Nothing from `reference images/` ships.
2. **Reconstruct it procedurally in code** from reference views, which is what
   the `img2threejs` skill does. That produced `models/roci/createRociModel.ts`
   — 93 named parts, 1,520 triangles, about 300 KB of source.

Sahil has decided between them. The Rocinante now flying is the downloaded
Sketchfab model; the img2threejs reconstruction was abandoned. In his words:

> "we're using the sketchfab roci now, we trashed the other one - that's why i
> don't want to use that pipeline; it's not very good"

So when something in the world has to read as a specific real object, go and
find a real model of it and bake it. Do not offer the procedural
reconstruction as a route, and do not fall back to it quietly when a download
turns out to be awkward — the result of that route has already been judged and
thrown away once. If the download is genuinely blocked, that is a thing to
raise rather than a reason to hand-roll.

This sits alongside his standing preference for boring proven tools over new
code: the bake pipeline already exists and is committed, and the hand-rolled
route is several hundred kilobytes of code that has to be maintained and that
he did not like the look of.
