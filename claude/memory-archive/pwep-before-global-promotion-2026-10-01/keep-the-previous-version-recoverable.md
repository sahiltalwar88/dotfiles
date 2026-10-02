---
name: keep-the-previous-version-recoverable
description: "When iterating on a pwep world asset Sahil has already seen, keep the previous version easy to switch back to, because a later pass often regresses part of what was already good"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: f6ca4ca9-80dc-4c77-9d36-12e92db5604d
  modified: 2026-09-18T02:18:48.740Z
---

# Keep the version he last saw easy to go back to

Sahil reviews the pwep world by eye, one pass at a time, and a pass that fixes the fault
he reported often makes something else worse. When that happened on the Sherlock Holmes
statue — a pass that fixed the boxy colour boundaries also lost the tie and waistcoat and
washed out the palette — he asked for another pass and added: **"save the prior state too
so it's easy to go back to by the way, cuz that was better in terms of color"**.

So when iterating on an asset he has already looked at, preserve the previous state in a
form that can be restored in one step: keep the generated file under a versioned name,
keep the bake or build settings that produced it, and say in the report exactly how to
switch back. Do not rely on the working tree alone, because these assets are regenerated
in place by bake scripts and the previous bytes are gone as soon as the next bake runs;
and do not rely on an uncommitted git state, since other sessions share this repo.

The underlying reason is that each of his review rounds is expensive — he is looking at
rendered frames and deciding by eye — so the ability to say "the earlier colour, with the
newer geometry" without rebuilding from scratch preserves the value of rounds already
spent.
