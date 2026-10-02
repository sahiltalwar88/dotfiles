---
name: commit-half-done-work-labelled-partial
description: "When work in the pwep repo is half-migrated and belongs to another agent, Sahil wants it committed and labelled PARTIAL rather than reverted"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 5f251619-ed2a-45c4-9310-dded698473ad
  modified: 2026-09-19T20:27:15.503Z
---

# A half-done migration gets committed and labelled, not reverted

When I had started a cross-cutting change in `pwep-consulting-website` that
turned out to belong to another agent running at the same time, Sahil's
instruction was explicit and went against the obvious instinct:

> "Do not revert it — half-migrated is worse than either state."

His reasoning is that reverting a partial migration destroys real work and
leaves nobody with a record of what was attempted, while finishing it means two
agents writing the same files. Committing it, clearly marked, is the only
option that loses nothing.

What he asked the commit to contain, and what to do next:

- Commit **exactly** what exists, by explicit path. Finish nothing further.
- Say plainly in the message that it is **PARTIAL**, and name precisely what is
  still unconverted — in that case `src/styles/world.css` and the `MOODS` keys
  in `src/audio/music.ts` still held their own copies of the zone list, so the
  drift problem the change was meant to solve was not actually solved.
- Name which agent or track owns finishing it.
- Then leave those directories alone for the rest of the session.

The general shape: when scope turns out to be someone else's, the deliverable
becomes an honest, self-describing checkpoint rather than either a revert or a
completion. It is worth stating the remaining gap in concrete file names, since
a vague "partially done" gives the next person nothing to act on.

While writing such a commit, verify the claims rather than repeating them. When
he described the leftover CSS as "13 `body[data-zone=...]` rules" the real count
was 10, and a doc comment in the new file referenced a test that did not exist
yet — both worth correcting in the commit body rather than propagating.
