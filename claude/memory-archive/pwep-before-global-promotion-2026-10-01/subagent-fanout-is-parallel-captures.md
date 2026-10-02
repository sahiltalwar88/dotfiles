---
name: subagent-fanout-is-parallel-captures
description: "On pwep-consulting-website Sahil is happy for several subagents to run at once — the thing that kills his machine is several of them running headless captures at the same time, so serialise the captures, not the agents"
metadata:
  node_type: memory
  pinned: false
  originSessionId: e9992ae1-c104-4373-b637-f5b53db31550
  modified: 2026-09-23T20:24:18.299Z
---

# Run as many subagents as you like; just never let their captures overlap

On 2026-09-23 Sahil asked me to hand a batch of visual faults to fable, saying
"in multiple subagent sessions if you prefer". I launched three `visual-fable`
agents at once and each independently ran headless Chromium captures of the world,
on a box already shared with several other Claude sessions. He came back with:

> something one of you did killed the system repeatedly. i doubled the available
> memory and swap, but please be careful with how fast you're consuming resources.

My first reaction was to decide that agents must run one at a time. He corrected
that directly:

> to be clear you are welcome to spawn several subagents at once, i just don't
> want them all doing captures at once if that's what kills the ide

So the constraint is on the CAPTURES, not on the agents. Parallel subagents are
welcome and are often the point of delegating; what must not overlap is headless
Chromium rendering the world, because each capture is a full browser plus the
scene and several at once exhaust the machine.

Asking each agent in its brief to check `pgrep` before capturing is not a real
defence, because several agents can pass that check inside the same window. The
durable answer is to make the capture tool itself hold an exclusive lock, so
concurrent runs queue instead of piling up, no matter how many agents are going.
That way the rule survives any future fan-out without depending on every brief
repeating it.

The wider lesson is that a resource rule about a tool applies to every path that
reaches the tool, including paths where a subagent is holding the handle — and
that the fix belongs in the tool rather than in the instructions around it.
