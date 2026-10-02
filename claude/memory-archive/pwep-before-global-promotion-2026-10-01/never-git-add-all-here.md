---
name: never-git-add-all-here
description: "Other Claude sessions work in the pwep-consulting-website repo at the same time, so stage only the files you changed by explicit path — never git add -A or git add ."
metadata: 
  node_type: memory
  pinned: false
  originSessionId: baffd0aa-f21b-46f2-9b0a-21eb344831d7
  modified: 2026-09-08T22:55:38.045Z
---

# Stage by path. Never `git add -A` in this repo.

Sahil runs several Claude sessions against `pwep-consulting-website` concurrently —
he splits large problems into their own plan documents and gives each one its own
session, so a city session and a rings session can be editing the same working tree
while a general session is also running. His instruction, after catching it:
**"make sure you only commit your work, there are other sessions working in this
repo."**

`git add -A` and `git add .` stage everything in the tree, including files another
session has just written and has not committed yet. When that happened, five
consecutive commits of mine swallowed a parallel session's new `src/world/citymass.ts`
and its edits to `city.ts` and `CITY-PLAN.md`, all under commit messages that
described something else entirely. Nothing was lost, but the history became
misleading and the other session's work was attributed to changes it had nothing to
do with.

So: **name every path explicitly**, e.g.
`git add src/world/land.ts src/world/flags.ts PLAN.md`. Before committing, run
`git status --short` and confirm every staged path is one you actually edited this
turn. If a file you did not touch appears as modified, leave it alone.

Watch `src/world/flags.ts` in particular. Every session adds URL knobs there, so it
is the one file two sessions genuinely both want to edit, and staging it commits
whatever the other session had in flight.

**Do not try to untangle it afterwards by rewriting history.** A parallel session is
working from those same commits, and rebasing or amending shared history under it
would break its tree. Report what happened, leave the history alone, and stage
properly from then on.
