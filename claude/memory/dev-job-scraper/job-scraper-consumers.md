---
name: job-scraper-consumers
description: "job-scraper has two consumers, job-hunter (open source) and job-hunter-closed (private copy with the user's personal info)"
metadata:
  node_type: memory
  pinned: false
  originSessionId: 9ba1c1af-0d8a-45d9-957d-c0c88f2fea31
  modified: 2026-09-30T17:37:22.235Z
---

job-scraper's data is used by two sister repos in the parent folder (`~/dev`): **job-hunter**, which is open source, and **job-hunter-closed**, the same project but containing the user's personal information, so it is kept closed source. The user's live pipeline (the `job-hunter-pipeline` systemd unit) runs from job-hunter-closed.

Why it matters: a change to job-scraper's output, file layout, or import-time behaviour (for example, `fetch_jds.py` imports `scrape_jobs.py`) can affect both consumers. When reporting what job-hunter needs to change, say which of the two repos it applies to, and never copy personal details from job-hunter-closed into job-hunter or job-scraper.
