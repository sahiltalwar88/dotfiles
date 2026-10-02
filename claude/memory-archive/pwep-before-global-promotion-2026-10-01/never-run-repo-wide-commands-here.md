---
name: never-run-repo-wide-commands-here
description: "On pwep-consulting-website always assume other Claude sessions are editing the same checkout right now, and never run a command whose effect is repo-wide"
metadata: 
  node_type: memory
  pinned: true
  originSessionId: c496d0bc-4d45-4ca6-a751-8771910ac320
  modified: 2026-09-18T23:11:44.155Z
---

# Assume other sessions are working, and never act repo-wide

Sahil runs several Claude sessions against the `pwep-consulting-website` checkout
at the same time — commonly one on the city, one on the statues, one on the sky —
and they all have uncommitted work in the working tree simultaneously. His
standing instruction, after I ran `git stash` to compare a build against HEAD:

> "always assume many sessions are working and never do global actions that could
> impact other sessions"

`git stash` reverted **every** uncommitted file in the checkout, not just mine,
for the seconds before I popped it. Nothing was lost that time, but any of the
other sessions could have written a file into that window and had its edit
clobbered or conflicted. The same applies to `git checkout -- .`, `git reset
--hard`, `git clean`, `git add -A` or `git add .`, reverting a file you did not
change, `npm install` and anything else that rewrites `node_modules`, and killing
processes by name rather than by the specific pid you started.

The rule is not "be careful with destructive commands". It is narrower and
stricter: **a command is only allowed if its blast radius is the files you
yourself changed.** Stage by explicit path. When a shared file such as a knob
registry or a generated page carries someone else's lines too, stage only your
own by rebuilding the index blob from `HEAD` plus your edit
(`git show HEAD:<path>`, apply your change to that copy, `git hash-object -w`,
`git update-index --cacheinfo`), leaving their work untouched in the working tree.

When the thing you actually need is a comparison against a clean tree, the repo
already has the safe tool for it: `scripts/prove-refactor.sh` builds a separate
worktree of `HEAD`, copies in other sessions' files, and runs the harnesses
against both — without touching the checkout anyone is typing into. Reach for
that, never for stash.
