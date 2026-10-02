---
name: other-sessions-share-this-repo
description: "Other Claude sessions work in the pwep-consulting-website repo at the same time, so never overwrite their edits and never commit files you did not change"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 3537332a-f570-4481-b363-7e16a37e7c53
  modified: 2026-09-14T21:30:01.020Z
---

# Other sessions are editing this repo concurrently

Sahil runs more than one session against `pwep-consulting-website` at a time. He said so
directly: "the important thing to note is that there are other sessions working in the
repo, so be mindful that you don't overwrite changes or commit things you didn't do."

The practical consequences:

- **Never `git add -A`, `git add .`, or `git commit -a`.** Stage only the specific files
  this session actually edited, by path. A working tree with unfamiliar modifications in it
  is the normal state, not a mess to be tidied up.
- **Re-read a file before editing it** if any meaningful time has passed since the last
  read, rather than trusting a copy held in context. Another session may have rewritten it
  underneath, and a whole-file `Write` based on a stale copy silently destroys their work.
- **Do not revert, clean, stash, or check out** changes you do not recognise, and do not
  "fix" unrelated modifications you notice in passing. Leave them alone and, if they
  actually block the task, say so rather than resolving it unilaterally.
- Prefer targeted `Edit` calls over full-file rewrites in shared files for the same reason.

The git status snapshot at the start of a session is only a snapshot; treat any diff you did
not personally produce as somebody else's in-flight work.

## Staging by file is not enough — stage by HUNK

On 2026-09-14 Sahil corrected this again, more pointedly: "i do want you to be cleaner with
your commits in general - several times you've committed things done by other sessions, make
sure you're careful to only commit your work."

Staging by explicit path had not been enough, because the shared files — `flags.ts`,
`personal.ts`, `city.ts`, `KNOBS.md`, `probe-knobs.ts` — routinely carry another session's
uncommitted hunks alongside this session's. `git add <file>` then commits both. It happened
repeatedly in one run: a subagent's "checkpoint" commit swept up pending work on three files,
a `flags.ts` commit carried other sessions' knob registrations, and a `personal.ts` commit
nearly took a `keyLight` hunk that was not ours.

So before every commit on a shared file:

- Run `git diff <file>` and read every hunk. Commit only the hunks this session wrote.
- When a file mixes ours and theirs, stage a filtered patch (`git diff <file>` → keep our
  hunks → `git apply --cached`) rather than the whole file. `git add -p` is interactive and
  unavailable here.
- Tell every subagent the same thing explicitly, and name the foreign hunks you already know
  about, because subagents repeat the mistake too.
- Only commit another session's file when Sahil explicitly says to, and say in the commit
  message whose work it is.
