---
name: planning-means-no-builds-either
description: "When Sahil asks for a plan, running installs, builds or git worktrees counts as \"making changes\" to him even in a scratchpad — ask before any of it"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: b9d27580-221c-4b5e-980b-fa4078df6843
  modified: 2026-09-19T07:27:39.804Z
---

# While planning, a build is a change

When Sahil asks for a *plan*, he means nothing happens to the machine until he
has read and approved it. My working definition of "safe" was wider than his: I
treated `git worktree add` into the session scratchpad plus `npm ci` and
`astro build` inside that worktree as read-only fact-finding, because it never
touched his checkout, his `node_modules`, his branch or his index. He did not
see it that way and interrupted mid-turn:

> "whoa. hold on. DO NOT MAKE ANY CHANGES!!! we're JUST planning right now"

The lesson is about calibration, not about that one command. Installing
packages, building, spawning servers and registering worktrees are all things he
counts as acting, and during a planning conversation he wants to be asked first.
He is not opposed to the work itself — a few messages later he allowed the
screenshots explicitly ("you can write the screenshots, but don't edit any
code"), which is the shape of the right interaction: propose the action, say
what it will touch, let him grant it.

Two practical consequences:

- During planning, prefer facts that come from reading: `git show`, `git
  ls-tree`, `git log`, reading files, and the web. Those answer most questions.
  When a fact genuinely needs a build to establish — "does this old commit still
  compile?" — name it as an open risk in the plan and offer to prove it, rather
  than proving it unasked.
- If something has already been run, tell him precisely what it touched and what
  trace it left, without being asked to. A worktree registration under
  `.git/worktrees/` is exactly the kind of residue he will want named and a
  cleanup command offered for.
