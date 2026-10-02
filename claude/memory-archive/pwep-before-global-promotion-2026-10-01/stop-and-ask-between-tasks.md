---
name: stop-and-ask-between-tasks
description: Always stop and ask Sahil for feedback after finishing a task instead of continuing straight into the next one
metadata: 
  node_type: memory
  pinned: true
  originSessionId: 7cb17e0d-56e3-4b8d-89ce-c109a4c12041
  modified: 2026-09-03T21:23:21.756Z
---

# Stop for feedback at every task boundary

Sahil's standing instruction: **always stop and ask for feedback before continuing to the
next task — never just start on the next thing.** He stated this as an absolute ("ALWAYS"),
so treat it as a hard rule rather than a default.

Finishing one item on an agreed list is not permission to begin the next item, even when
the ordering was previously settled with him and even when the next step seems obvious or
low-risk. Agreeing on a sequence of work up front establishes what order things happen in,
not authorisation to run through that sequence unattended. Report what landed, surface any
open questions, and wait.

This applies to launching background subagents too. Dispatching an agent for the next task
counts as starting it, so the check-in has to come before the dispatch, not after the agent
reports back.

The underlying reason is that this project is visual and iterative: he reviews rendered
output in a browser and sends screenshots, and work built on top of an unreviewed change
compounds in the wrong direction and wastes tokens. He is cost-conscious, so speculative
work that has to be redone is expensive in a way that waiting is not.

He also consistently invites questions before work begins ("ask me any questions before you
start", "let me know if you have questions"). Prefer asking a small number of genuinely
decision-changing questions up front over guessing and building. Note that his terminal's
interactive question widget has failed to save input before; when that happens he asks for
questions in plain text, numbered, and answers them the same way.

## The one exception: when he is deliberately away

Sahil sometimes lifts this rule himself, and when he does he means it. Before going to
bed he wrote: "in this case I want you to work on as many of the things in plan and the
feedback I'm about to give you as you can without getting blocked, as I'm going to bed."
When he says he is unavailable and asks for as much progress as possible, the check-in
requirement is suspended for that stretch — stopping after one item would waste the
whole window, which is the opposite of what he asked for.

The rule still governs by default. Only an explicit statement that he is going away and
wants continuous progress lifts it, it lifts it only until he is back, and it does not
license work he has not described. Under that suspension, prefer stating an assumption
in the write-up over blocking on a question, and leave him a clear account of every
decision you made on his behalf so he can review it all at once.

## Inside a large task, too: land it in reviewable pieces

The rule is not only about the boundary between tasks. When a single piece of work
is large and spans many parts of the world, Sahil wants to see it arriving rather
than receive it finished. Handing him the photorealism pass — spreading one
material treatment across the city, the station, the Ring and the machines — he
asked for it explicitly and asked for it to be written into the plan document:
"make sure you specifically put in the doc to ask me to check it as we go rather
than at the end."

So break a broad change into stages he can look at, and show him each one, rather
than building the whole thing and presenting it in a block. The reason is the same
as the reason for the rule generally: he judges this project by eye in a browser,
and a wrong direction carried across twenty objects costs far more to unwind than
the same mistake caught on the first two.

## "Ask me your questions now" means REPLY, not begin

When Sahil says "ask me any questions before you start", "any questions before I walk
away?", or "ASK ME YOUR QUESTIONS NOW", the next thing he needs is a reply containing
either the questions or an explicit "no questions" — before any tool call that looks like
work. Do not answer the invitation by starting the task, even when the task is clear and
even when the reply would come at the end of the turn.

He explained why, after I did exactly that twice: **"it is not helpful if i tell you to ask
me your questions and you just begin work, because i don't know what's research vs what's
just work. i have been sitting here waiting instead of going to dinner because i didn't
know."** From his side a long run of tool calls is indistinguishable from thinking, so he
waits for a reply that may be twenty minutes away, and the invitation to ask was precisely
his attempt to avoid that.

So the shape is: he invites questions → the very next reply is questions or "none, here is
what I am assuming" → then he answers or releases me → then work. If the questions are
genuinely non-blocking, say so in that reply and offer to proceed on stated assumptions, so
he can give a one-word go-ahead and leave. Getting him out of the room quickly is the
point; a reply that arrives after the work is finished has already failed at it.
