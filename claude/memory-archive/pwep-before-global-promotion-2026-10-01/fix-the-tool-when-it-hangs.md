---
name: fix-the-tool-when-it-hangs
description: "When a command in Sahil's terminal hangs or dies silently, change the tool so it cannot happen again rather than re-running it"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: ece0b9b5-ede8-4bc8-bd56-45495efbb6a9
  modified: 2026-09-16T03:02:58.357Z
---

# A tool that hangs or fails silently is a bug in the tool

Sahil watches the command line while work runs, and a command that goes red with no output
tells him nothing and looks like the session has stalled. When that happened with the
headless capture script on the pwep world he did not ask for a retry — he asked for the tool
to change: "your npm run shot seems to either have failed, or succeeded but after too long -
the command is showing red and you're not doing anything. change something about how you use
npm run shot so that this stops happening please."

So the response to an intermittent tool failure is to make the failure impossible or at
least legible: a watchdog that prints which stage it timed out in and exits with a clear
message, a retry around a known transient cause, and removal of the contention that caused
it. In this case three things were fixed at once — a `--budget` watchdog with the stage
named, a cross-session lock file so only one capture uses the GPU at a time, and a retry
when another session's file save reloads the page mid-capture and destroys the execution
context.

The general rule: he treats the harness as part of the product. Time spent making a tool
report its own failures honestly is worth more than another attempt at the same command,
and silent failure modes are the ones that have repeatedly cost this project whole rounds.
