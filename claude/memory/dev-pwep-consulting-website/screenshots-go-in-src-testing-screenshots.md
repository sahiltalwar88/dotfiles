---
name: screenshots-go-in-testing-screenshots
description: "Headless captures on the pwep world now belong in testing-screenshots/ at the repo root, not public/shots, because anything under public/ is copied into the production build"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 2d01ad48-93e3-4537-a877-986a99730159
  modified: 2026-09-14T20:02:59.374Z
---

# Captures go in `testing-screenshots/` at the repo root, not `public/shots`

Write headless screenshots and comparison sheets into **`testing-screenshots/`** at the repo root, served at `http://localhost:4321/testing-screenshots/<name>.png`. (He first described it as `src/testing-screenshots`; the directory actually landed at the root, and CLAUDE.md now documents it correctly.) Sahil
moved them there on 2026-09-14:

> "another session is moving public/shots so that it doesn't get sent to dist now, please
> don't touch that ... alright, now it's at src/testing-screenshots. you can write in there
> instead of public/shots if you need to"

The reason is the one that makes it stick: **anything under `public/` is copied verbatim
into `dist/` by Astro**, so every debug capture was being shipped to production. The
directory had grown to hundreds of megabyte-scale PNGs of the city, which is dead weight in
a deploy of a portfolio site.

`CLAUDE.md` and `PLAN.md` still say to write into `public/shots/` and to open the result at
`http://localhost:4321/shots/<name>.png`. **Those instructions are stale.** Check where the
directory actually is before writing captures, and check how it is served before quoting a
URL back to him — the serving path may no longer be `/shots/`, and a URL that 404s is worse
than no URL, because he has said that delivering an image through the agent tooling does
not reach him and a served URL is the only thing that does.

The underlying lesson generalises beyond this one directory: on this project, generated
review artefacts must live somewhere that is NOT part of the shipped build. If a future
capture tool or harness needs an output location, prefer a gitignored directory outside
`public/` and confirm the serving arrangement rather than assuming it.
