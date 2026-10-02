---
name: subagent-profiles-location
description: Subagent profiles for pwep-consulting-website are deliberately duplicated in .devin/agents and .claude/agents rather than symlinked
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 7cb17e0d-56e3-4b8d-89ce-c109a4c12041
  modified: 2026-09-03T21:02:04.152Z
---

# Subagent profiles are duplicated on purpose, not centralized

The pwep-consulting-website project keeps custom subagent profiles in two places:
`.devin/agents/` for Devin and `.claude/agents/` for Claude Code. These are two real
directories holding two independent copies of the same four profiles, and that duplication
is intentional.

The reason is that the two harnesses do not accept the same frontmatter. Devin's copies use
model identifiers like `glm-5.2-high`, `gpt-5.6-luna` and `gpt-5.6-sol` together with a
lowercase `allowed-tools` key. Claude Code only resolves `sonnet`, `opus`, `haiku` and
`fable` for `model:` and expects a capitalised `tools:` list, so a Devin profile invoked
from Claude Code silently falls back to a default model instead of reaching the cheap model
it names — which costs more, not less.

An earlier attempt to centralize this by making `.claude/agents` a symlink to
`../.devin/agents` was rejected. Sahil's rule: **better to maintain two copies that work
than one copy that does not.** Apply that preference generally, not just to agent
profiles — when a single shared source would only work for one consumer, duplicate it and
keep the copies in sync rather than centralizing into something broken.

These profiles exist to be used, and Sahil wants them used as intended rather than having
the work absorbed into the main session. Route mechanical edits, bulk find/replace and
build runs to `mechanic-glm`, well-specified copy and component work to `writer-luna` or
`writer-sol`, and Three.js composition, camera and shader judgment to `visual-fable`.
Claude Code only loads `.claude/agents/` at session start, so a newly created profile is
not registered in the session that created it. When that happens, ask Sahil to restart the
session — he would rather restart than have the delegation skipped.

When adding or editing a profile here, write both copies and note in each description that
the other exists so they stay in sync. The four profiles are `mechanic-glm` (mechanical
edits, bulk find/replace, build runs), `writer-luna` (simple, well-specified copy and
component edits), `writer-sol` (content-heavy work needing moderate judgment), and
`visual-fable` (Three.js scene composition, camera choreography, shader and lighting
judgment). Sahil is cost-conscious: prefer the cheap profiles for mechanical work and
reserve expensive models for work that genuinely needs judgment.
