---
name: archive-rungs-need-visible-change
description: "A pwep-website-archive rung needs something visual to show in the index's wipe comparator — when a release lands, ask Sahil whether it qualifies rather than inspecting or assuming"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 6dfd5b7b-85ff-424a-94ad-297c6ec78c2a
  modified: 2026-09-22T07:58:41.697Z
---

# A version-archive rung needs something to show in the wipe comparator — ask, don't judge

The version archive (`../pwep-website-archive`, served at
`archive.sahiltalwar.com/vN`) holds frozen working copies of the two sites at each
big step, and its index page sets each rung against the one before it in a
draggable wipe comparator. `AGENTS.md` says a commit becomes a rung when it is
tagged, "not on every merge", but it did not originally say what makes a step big.

Sahil's criterion: **a rung needs something visual to show in that wipe
comparison.** When he said "we just released, please update the website archive", I
identified the new `main` merge and started freezing it as v6; he stopped it with
"no don't do that, this was only performance and not graphics." A release that is
performance work, test fixes, tooling, share cards or refactoring produces two
adjacent rungs that render identically, which defeats the index's whole purpose.

**Do not try to work out whether a release qualifies — ask him.** He was explicit:
"you don't need to visually inspect for changes, just ask me." So when a release
lands and the archive comes up, the first move is a question, not a diff, a capture
or a freeze. This is also why it matters: freezing a rung tags a commit, builds it
in a worktree, commits several MB of finished bytes to the archive repo, needs ten
headless captures, and moves the `IN PRODUCTION` badge on the index page.
