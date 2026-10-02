---
name: sessions-named-not-ids
description: "The user refers to Claude Code sessions by their friendly names, not IDs; resolve a name to its ID from the session logs before acting"
metadata:
  node_type: memory
  pinned: false
  originSessionId: e9b41565-129e-46f6-86dd-e4e4e91e3f87
  modified: 2026-10-02T03:28:53.799Z
---

The user names sessions the way their client shows them: their own `/rename` names (e.g. "Reduce Eval Variance 2", "Skill Test #2") or the automatic titles (e.g. "Claude code mods analysis from session logs"). I only see session IDs, and the mismatch has caused them problems before.

When the user mentions a session by name, I resolve it to an ID before relying on it. I don't guess from the topic. The name lives in the session's log, `~/.claude/projects/<project>/<id>.jsonl`: `custom-title` (`customTitle`) is a `/rename` name, `agent-name` (`agentName`) usually matches it, and `ai-title` (`aiTitle`) is the automatic title. The last record of each type wins. Running sessions are also listed in `~/.claude/sessions/<pid>.json`, with `name` and `nameSource`. Never read the `.key` files there. If no name matches, or several do, I ask the user which session they mean.

When I mention a session, I give its name next to its ID.

"The session map" is the user's term for this name → ID list. When they ask for it, I run the `session-map` skill (`~/.claude/skills/session-map/`). I can invoke it myself, and the user can type `/session-map [text | --all]`. It runs `~/.claude/bin/session-map.py`, which lists each session's one-sentence summary under its name. The summaries come from a Stop hook (`~/.claude/bin/session-summary.py`) that runs every 15 typed messages.

`~/.claude/bin` is a symlink into the user's dotfiles repo (`~/dev/dotfiles/claude/bin`). The skill, the hook and the scripts are maintained there, not in claude-mods.
