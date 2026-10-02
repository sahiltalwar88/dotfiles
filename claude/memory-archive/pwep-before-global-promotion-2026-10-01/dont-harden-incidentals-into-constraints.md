---
name: dont-harden-incidentals-into-constraints
description: "When briefing a design subagent on the pwep world, don't turn current implementation facts into hard constraints — Sahil would rather do extra work than narrow the design space"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: b9d27580-221c-4b5e-980b-fa4078df6843
  modified: 2026-09-19T20:09:55.292Z
---

# Don't harden incidental facts into constraints in a brief

When writing a brief for a design subagent — `visual-fable` especially — the
temptation is to write down the current shape of the system as a requirement.
Sahil pushes back on this. Briefing fable on the version-archive index page, I
wrote "one static page, hand-written HTML and CSS, no framework, no build step",
because the archive's hosting project was going to upload files with no build
command. Both halves were my inference, not his requirement, and he rejected
them:

> "hmmmmmmmmm we should loosen the constraints. worst case i can just store the
> necessary dependencies in the repo and commit them so that we can build with
> them and manually freeze it that way, so let's loosen that up. also i wouldn't
> restrict it to one page; if for some reason it thinks more than one is better,
> i would leave that door open."

The trade he is making is explicit: he will absorb real extra work — vendoring
dependencies, running a build by hand, freezing output manually — rather than
have the design space narrowed before the designer has seen the problem. A
constraint that exists only because of how the plumbing currently happens to work
is not worth the ideas it forecloses.

So when writing a brief, separate the two kinds of statement. **Genuinely hard**
constraints stay: what the thing must run on, the audience, how people arrive,
accessibility, phone width. **Incidental** ones — page count, framework, build
step, file layout, image counts and formats — go in as available context or as
"nothing is pre-committed", never as rules. When in doubt about which kind a
constraint is, ask whether violating it breaks something or merely costs Sahil
some work. If it only costs work, it is not a constraint.
