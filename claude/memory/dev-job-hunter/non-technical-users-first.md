---
name: non-technical-users-first
description: "job-hunter's setup and docs must serve non-technical users — ask before walking through a step, and don't move them around the terminal"
metadata:
  node_type: memory
  pinned: false
  originSessionId: 5bd2fb1a-6bb7-4569-8867-f4b966f2be3f
  modified: 2026-09-30T05:16:44.020Z
---

job-hunter is meant to be usable by non-technical people with AI help, and the user judges every setup, README, and skill change by that standard.

In practice that means:

- **Ask, then walk through only if needed.** For each prerequisite (a GitHub account, Git, Python, an AI coding CLI, signing in), the agent asks whether the user already has it, and walks them through it only if they don't. Don't lecture people through steps they've already done.
- **Don't change where the user is in the terminal** unless there's a real penalty for staying put. Non-technical users get lost when commands move them between directories. Anything the agent runs on its own behalf, such as a sign-in check run from outside the repo, goes in a subshell so the user's location doesn't change.
- **Give current, sourced directions.** For installing or signing in to a provider's CLI, the agent should read the provider's official page, give the user the instructions in its own words, and include the link. Short embedded steps serve only as a fallback for agents without web access.
- **Name things plainly.** For example, the README heading reads "API keys (probably only if you use Codex)", not a general "keys" section.

Why: the user said the project is "intended for non-technical people to be able to do, and it's easy for them to get lost or confused with all terminal commands."
