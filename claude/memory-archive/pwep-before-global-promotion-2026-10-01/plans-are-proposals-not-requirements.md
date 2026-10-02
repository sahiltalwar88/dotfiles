---
name: plans-are-proposals-not-requirements
description: "On the pwep world, a PLAN document is a previous session's proposal, not Sahil's requirement — when the plan conflicts with his actual goal, re-derive options from the goal and propose afresh"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: b4e97861-ff06-480e-92dc-eac3a9e12591
  modified: 2026-09-12T04:50:28.470Z
---

# The plan documents are proposals, not requirements

The `*-PLAN.md` files in `pwep-consulting-website` (`RIDER-ROAD-PLAN.md`, `CITY-PLAN.md`,
`TREES-PLAN.md`, `PLANET-PLAN.md` and the rest) are written by a previous Claude session at
the end of a long round. They record what that session measured and what it intended to do
next. They are **not** Sahil's specification, and he does not consider himself bound by
them.

When handed `RIDER-ROAD-PLAN.md`, I grilled him on a contradiction in its task 1: the plan
prescribed both a 43-degree knee bend and a toe-down shoe that reaches the road, and the
arithmetic showed those two are mutually exclusive. His reply set the general rule:

> "to clarify, i asked for nothing in particular other than 'i want him to plant his foot
> in order to come to a halt' — the plan was written in response to that. so if we need to
> adjust it because there are mistakes, that is absolutely fine, so i would suggest that
> you take a step back and re-evaluate all options to suit the actual goal and then propose
> them to me."

So when a plan's prescribed mechanism turns out to be wrong, unnecessary, or merely one of
several options, the correct move is to go back to the one-line goal the plan was written
to serve, re-derive the option set from scratch, and put the options to him. Do not
implement a prescription that the measurements contradict just because a document says so,
and do not treat "the plan says X" as having settled anything with him.

The plan's **measurements** are still valuable and worth trusting — they were taken with
real tools that are committed in `scripts/`. It is the plan's **conclusions and chosen
approach** that are provisional. Read a plan for its numbers and its history of what was
already ruled out, then decide the approach yourself and check it with him.

A practical consequence: the actual goal is usually a short, plain sentence buried in the
plan's "what he sees" line or recoverable by asking. Find that sentence first. In this case
the whole of a detailed section on shoe geometry existed to serve "I want him to plant his
foot in order to come to a halt", and re-deriving from that sentence produced a better
answer — leaning the bike, which is what a stopping cyclist actually does — that the plan
had never considered.
