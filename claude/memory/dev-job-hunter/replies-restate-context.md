---
name: replies-restate-context
description: "Every reply and question must restate its context — the user reads replies hours later, across many agents"
metadata:
  node_type: memory
  pinned: true
  originSessionId: 5bd2fb1a-6bb7-4569-8867-f4b966f2be3f
  modified: 2026-09-30T18:39:59.766Z
---

The user often reads a reply hours after sending the prompt, runs many agents at once, and so context-switches constantly. A reply that assumes they remember the conversation is unusable.

Whenever I ask a question or refer back to something, I restate, in that same spot:
- what the thing is;
- where it lives (file, setting, or step);
- its current state or value;
- why it matters.

I never lean on shorthand I coined earlier ("Q3", "option b", "it") without saying what it means.

A reply that covers several items gives each item its own labelled part, and each part stands on its own.

Why: the user said: "it's sometimes hours between my prompt and my review of your reply, plus I'm running a lot of agents so I have to context switch a lot, plus you're responding to multiple things." Concretely, the question "just for the test, or everyone's default?", followed by "set it only in the third test's config", left them unable to tell what was being asked. The same rule is saved globally in `~/.claude/CLAUDE.md`.
