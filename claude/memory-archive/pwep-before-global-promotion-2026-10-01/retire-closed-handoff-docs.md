---
name: retire-closed-handoff-docs
description: "When every item in a pwep handoff document is resolved, fold the round into HISTORY.md as high-level bullets and delete the handoff file rather than leaving it in the repo"
metadata:
  node_type: memory
  pinned: false
  originSessionId: 0ead1af7-b55a-4736-af2f-7460356c6eda
  modified: 2026-09-23T22:14:23.944Z
---

# A finished handoff gets folded into HISTORY.md and deleted

When the last open item in a `HANDOFF-*.md` document is resolved, Sahil wants the
round summarised into `HISTORY.md` and the handoff file **deleted**, not left in
the repo annotated as done. He asked for this directly once the Observatory round
closed: "let's move that finished handoff into history and delete the file, if
we're done."

This matters because the alternative is what previous sessions did: leave the
handoff in place and append corrections to it. That produced a document whose
top half asserted a cause that had already been disproved further down, and a
later session read the top half and spent hours re-testing a dead theory. A
closed handoff is not a record, it is a trap.

`CLAUDE.md` already says `HISTORY.md` holds the closed rounds and superseded
plans; the part worth remembering is that the handoff file itself goes away, and
that the summary written into `HISTORY.md` must respect that file's own house
style — one or two lines a round, the *reasoning* rather than the fix, and no
measurements, file paths or commit hashes. Grep for references to the file before
deleting it.
