---
name: test-urls-must-be-localhost
description: "When telling Sahil how to try a new pwep knob, always give the localhost dev-server URL — never sahiltalwar.com, which never has the new work because nothing is ever pushed from here"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 1a5f1179-2648-4713-b7cb-7a273b973c0d
  modified: 2026-09-20T05:06:50.033Z
---

# A "try this" URL is always localhost, never sahiltalwar.com

Sahil habitually reviews the world on his live domain — the screenshots he sends
are usually captioned `sahiltalwar.com/?perf` — so it is easy to hand him a test
URL in that same shape. That URL can never work for anything built in a session
here, because the standing rule in this repo is to commit freely and **never
push**. The deployed site is therefore always behind, and a knob added today does
not exist there at all.

The failure is not subtle for him and it looks like a broken feature rather than a
wrong URL. `flags.ts` reads the query strictly, so an unregistered name produces a
red panel saying `unknown parameter "fogseam" — did you mean "fognear"?`. From his
side that reads as "the thing you just told me you built does not exist", and the
first thing he does is ask what went wrong. It cost a round trip after the
city-ground fog seam work: the report ended with "first test:
`sahiltalwar.com/?perf&fogseam=1`", which was guaranteed to be refused.

So every suggested test URL in a report points at the local dev server. Locally the
root path serves the PERSONAL world (`PUBLIC_SITE` is unset in a local build), so
the direct translation of his usual URL is:

    http://localhost:4321/?perf&<newknob>=1

Captures may be taken against whatever `shot:server` is already up on 4322, but
4321 is the one his browser should open, because that is the port whose
`testing-screenshots/` directory is served too.

If a change genuinely needs to be seen on the live site, that is a deploy, and a
deploy is his call — say so and let him decide rather than quietly suggesting the
live URL.
