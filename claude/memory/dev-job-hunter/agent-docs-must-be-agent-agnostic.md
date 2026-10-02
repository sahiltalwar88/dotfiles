---
name: agent-docs-must-be-agent-agnostic
description: "job-hunter agent-facing docs and skills must work for any agent/model, not just Claude"
metadata:
  node_type: memory
  pinned: false
  originSessionId: dbf4653a-eabb-4326-a1e3-52b530b15b43
  modified: 2026-09-29T23:07:47.280Z
---

In job-hunter, every agent-facing document (AGENTS.md, skills, playbooks) must work for any agent harness and model — Claude Code, Devin, Codex/OpenAI, Gemini CLI, and open models like GLM or Llama run through harnesses such as opencode or Cline. The user asked for this explicitly because the project's users run a mix of agents.

In practice: AGENTS.md is the single source of instructions. Claude Code reads AGENTS.md natively, so there is no CLAUDE.md (the user had it deleted as redundant); GEMINI.md contains only `@./AGENTS.md` because Gemini CLI does not read AGENTS.md by default. Skills live in `.claude/skills/` for Claude Code's auto-discovery but must be written as plain Markdown playbooks with no Claude-specific tool names, and AGENTS.md must list each skill with its path and when to use it, since other agents will not discover them on their own.
