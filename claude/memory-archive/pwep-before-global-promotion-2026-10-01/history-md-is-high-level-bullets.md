---
name: history-md-is-high-level-bullets
description: "On the pwep world, HISTORY.md is meant to be a short, high-level, reverse-chronological bullet list of what was done — not the technical spec it had grown into"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: b4e97861-ff06-480e-92dc-eac3a9e12591
  modified: 2026-09-13T17:03:29.089Z
---

# HISTORY.md is a summary, not an archive

`HISTORY.md` in `pwep-consulting-website` holds the closed rounds of work. Successive
sessions had been appending their full working notes to it — measurements, causes, file and
line references, commit hashes, tables of findings — until it reached about 2,200 lines.

Sahil does not want that. Asked to consolidate the plan documents into it, he set the
target explicitly:

> "i want to reduce history down to ~100 lines or less INCLUDING all the things we'll be
> moving in there from the other plan docs - i want it to be a very high level set of
> bullets about what we did, not a technical spec"

## The line count is an indication of altitude, not a target

Asked whether the 100 lines was literal, he said not to take it that way — the number was
his way of conveying how high-level he wanted the bullets, and he would rather I judged the
altitude than counted lines. He gave the contrast himself:

> rather than "we adjusted values x to y, a to b, c to d, to achieve <technical goals 1, 2,
> 3>; it didn't work, so we tried e to f................." , go with something like
> "Implemented bloom filters to soften the light and make it more realistic", "Updated the
> city to have a grid for more realism"

So each bullet names the change and the human reason for it, in one sentence. No values, no
sequence of attempts, no file references. He also wants the history ordered **roughly
reverse chronologically**, newest work first, so that opening the file shows the current
state of the world rather than its earliest rounds.

## Abandoned plans stay, marked as abandoned

Work that was planned and then deliberately dropped is not deleted from the history. He
wants it kept as a high-level bullet with an explicit note that the decision was **not** to
do it, so a later session does not rediscover the idea and re-propose it.

## The reference material is the exception — err on the side of keeping it

The same brevity does NOT apply to the reference half of `PLAN.md` (project context, the
commands, how the knob and screenshot harnesses work, working agreements, art direction).
Asked whether to trim it, he said to keep it, and to cut only what is outdated or
needlessly detailed, and only where I am sure:

> "i'd rather have a little more context than necessary than too little"

The distinction is that history is a record of the past, which rots and which nobody needs
in detail, whereas the reference half is instructions for doing the work now, where a
missing detail costs a session real time.

## Why the brevity matters for history specifically

Detail in a document rots silently: the cross-site join recipe was stated in comments in two
files and had drifted through at least three rounds without anyone noticing, and a "the
trees are staged by seed" claim stayed true-sounding long after the seeds had stopped
existing. A short history cannot rot in that way because it does not assert anything
checkable; the checkable claims live in `scripts/` checks that fail out loud.

Note the contrast with a genuine instruction in the other direction: `CLAUDE.md` says the
reasoning in `HISTORY.md` "is worth reading when a fault is not where it looks like it
should be". Keep the *why* of a round — one clause is usually enough — and drop the
measurements that supported it.
