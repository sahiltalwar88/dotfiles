---
name: session-map
description: Show the session map, every Claude Code session's name (the user's /rename name or the automatic title) beside its full session ID. Use when the user asks for "the session map", refers to a session by name, or asks which session did something.
argument-hint: "[search text | --all]"
allowed-tools: Bash(python3 __HOME__/.claude/bin/session-map.py *)
---

!`python3 __HOME__/.claude/bin/session-map.py --current ${CLAUDE_SESSION_ID} $ARGUMENTS`

Above is the session map. Show it to the user exactly as printed, inside a code block. With no arguments it lists the current project; text searches names, automatic titles and IDs in every project; `--all` lists every project. ▶ marks this session (only that row is this session) and ● marks other sessions open now.

If the user only asked for the map, stop after the code block. If they asked about a particular session, answer from the map after it, naming the session by its name and its full ID; if no row or several rows match what they meant, say so and ask which one.
