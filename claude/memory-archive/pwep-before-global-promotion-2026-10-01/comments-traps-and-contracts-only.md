---
name: comments-traps-and-contracts-only
description: "On pwep-consulting-website, code comments must be minimal and plain — keep only traps and contracts; never write history, quotes, measurements or narrative into code comments"
metadata: 
  node_type: memory
  pinned: true
  originSessionId: d6db339d-2c8e-450b-a88e-7f0c18f0eca0
  modified: 2026-09-15T20:06:25.611Z
---

# Code comments: traps and contracts only, in basic language

Sahil found that about 44% of the pwep-consulting-website source was comments —
long essays beside constants recording rounds of review, his own quotes,
measurements and "it used to be" history — and rejected the practice outright:
"why the FUCK are there so many comments? that's honestly insane - are those REALLY
needed?" He had the whole codebase's comments cut back to only what is truly
needed. Previous sessions (including mine) had written those essays deliberately,
believing "the reasoning lives beside the number"; he does not want that.

The rule he chose: keep a comment only when the code alone would mislead —

- a non-obvious constraint whose violation breaks something silently (random draw
  order, shader cache keys, module load order, a value tied to another file);
- a cross-file contract ("read by X", "must match Y");
- units, ranges, and a knob's range ends and default (knob doc comments generate
  `KNOBS.md`, so they stay, short);
- licences and tool directives.

Delete history, dates, round references, quotes, measurement logs, narrative, and
anything that restates what the code says. Git history holds the story; `HISTORY.md`
holds the high-level record.

Style for any comment that remains: blunt, directive, basic words (jargon only where
it cuts words), no filler, no hedging, one line where possible. When dispatching a
writer subagent for comment or copy work, he asked for Sonnet rather than Haiku.
