---
name: perf-panel-is-for-agents
description: "The pwep world's ?perf panel exists mainly for agents to read, and Sahil's job is to locate a row an agent names — so row keys must stay stable and findable"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 3032c14a-c5f7-4485-8d13-356d6821e542
  modified: 2026-09-21T04:00:53.400Z
---

# The `?perf` panel is written for agents, and Sahil has to find rows in it

When asked to make the `?perf` panel more human-readable, Sahil clarified the actual
problem:

> "this is primarily for agents, not me, but when an agent tells me to look at the
> 'worst' value in the 'build' row, i have no idea where to look right now."

So the panel is not a dashboard he reads for pleasure or insight. It is a surface that
**agents read in bulk**, and that he uses to **resolve a reference an agent gave him** —
"the worst value in the build row". The design goal is findability of a named row, not
readable prose.

Two consequences follow, and they pull in opposite directions from ordinary
"make it friendlier" work:

- **Row keys are an interface.** The label at the start of each line (`build`, `warm`,
  `sync`, `draws`, `grass`, `mass`, `city`, `post`, `fx`, `url`) is the name an agent
  will speak to him. Renaming one silently breaks every instruction any agent gives
  about it. Group, indent and decorate around those keys; do not rename them. The
  cryptic *fields inside* a row (`footY`, `topCos`, `vig`, `buf`) are fair game to
  expand, because nobody refers to a row by its third field.
- **Which rows are hidden matters.** Several of the most-cited rows, `build` and `warm`
  among them, only appear under `?perf=full`. If an agent names a row he cannot see at
  all, the panel should make it obvious that the row exists behind a longer URL rather
  than appearing to be missing.

He also constrained the layout: the panel is capped at 48 characters wide and roughly
the viewport's height, and he does not want renames that push a line into wrapping or
off the bottom. Lines that fit in one row of the panel are part of what makes a row
findable.
