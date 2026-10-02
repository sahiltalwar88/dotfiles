---
name: systematize-every-correction
description: "Every time Sahil corrects me, propose the strongest durable mechanism that would stop the mistake recurring — a check, permission rule, hook, generated doc or tool — not just a memory note"
metadata:
  node_type: memory
  pinned: true
  originSessionId: 23c2423f-14ef-4c9d-8e00-24097292b528
  modified: 2026-10-02T03:00:35.014Z
---

# Turn every correction into a proposed mechanism

Sahil's standing instruction: whenever he corrects me, I should think about how best
to systematize that correction and propose something concrete to him, so the lesson
does not get lost or depend on a future session happening to read a note.

The reasoning comes from the "trust pyramid" idea he adopted from @poteto's talk on
running many agents: a memory or a rule in a prompt is the weakest guard, because an
agent can skip reading it. Stronger, in rising order, are a skill or command, a lint or
check that fails, and a codebase or permission change that makes the mistake impossible.

So with each correction:

1. Fix the thing he pointed at.
2. Save the memory if it is durable (that is still required).
3. In the same reply, propose the strongest cheap mechanism that would have caught it:
   a `permissions.deny`/`ask` rule, a pre-commit or `--check` script, a generated doc
   with a staleness check, a warning printed by an existing tool, or a mod/command.
   One line: what it is, where it would live, and roughly how long it takes.
4. Build it only when he says yes — proposing is the default, not building.

If no mechanism fits (a pure taste call), say so in a few words rather than forcing one.
