---
name: cheapest-model-that-is-actually-up-to-it
description: "Sahil's standing rule for picking a subagent model — the cheapest one that is genuinely sufficient, because under-powering a task wastes more tokens and far more time than over-paying does"
metadata:
  node_type: memory
  pinned: false
  originSessionId: 219b04d1-07d5-462c-b471-c7cbd683c7e2
  modified: 2026-09-23T20:36:13.905Z
---

# Pick the cheapest model that is actually up to the job

Sahil spends his tokens sparingly and wants that reflected in which subagent is
spawned for a piece of work. His rule, in his own words:

> "i use my tokens sparingly as much as possible, so i would like to use the
> cheapest model which is sufficiently advanced for the job at hand (but not one
> that's not up to the task - that ends up being more wasteful, both in tokens
> and more importantly in time)."

The rule has two halves and the second one matters more. Reaching for the
expensive model by default wastes money; reaching for one that cannot do the job
wastes a whole round trip, and **time is the scarcer resource to him**. So the
question to ask is not "what is cheapest" but "what is the cheapest thing that
will get this right first time".

The prices that make the decision concrete, per million tokens, input/output:
Haiku 4.5 $1/$5, Sonnet 5 $2/$10, Opus $4/$20, Fable 5.1 $10/$50. Fable is about
two and a half times Opus and five times Sonnet, which is why it is the wrong
default and belongs only on questions whose answer is a judgement about how
something looks.

The split that came out of this, and which now lives in `.claude/agents/` and
`.devin/agents/` on pwep-consulting-website: `visual-fable` for taste — whether
something reads, which framing is better, what is wrong with a frame;
`engineer-opus` for work that has to be right and has to be verified — pipelines
and tooling, geometry and shader maths, diagnosis when the cause is unknown,
licences, changes spanning several files; `writer-sol` and `writer-luna` for
copy; `mechanic-glm` for bulk mechanical edits.

Two corollaries worth keeping, because they cut cost without cutting capability:

- **If a question can be answered by a number, no agent needs to look at a
  picture.** An offline probe costs a second and is exact; a headless capture on
  his machine costs two to eight minutes of a shared, memory-starved box.
- **Research agents that only read files and search the web are safe to run in
  parallel**, and parallelism is the cheapest way to buy time. Agents that take
  screenshots are not — those must be run one at a time.
