---
name: linkedin-backfill-tiny-configs-only
description: "Only ever run a LinkedIn backfill with a tiny test config (about 2 parallel jobs), never with a real/full search config"
metadata:
  node_type: memory
  pinned: true
  originSessionId: 85033945-0a98-45e3-8731-d6df062e9705
  modified: 2026-09-30T05:04:17.343Z
---

When testing job-scraper's LinkedIn backfill — the **LinkedIn Backfill (Parallel)** workflow (`linkedin_backfill.yml`), the LinkedIn Watcher with `backfill=true`, or `python scrape_jobs.py --linkedin-backfill` / `--linkedin-backfill-partition` locally — only run it with a **tiny config**: one search term, one location (e.g. `search_terms.linkedin: ["Data Analyst"]`, `locations.linkedin: [Remote]`, empty `linkedin_partitions.states` and `high_volume.locations`), which makes about 2 parallel jobs. Never run it with a real or example search config (the maintainer's makes 172 + 252 jobs; Scott Coffin's example about 22 jobs and ~470 runner minutes, and its 30-day single-job variant ran 6+ hours).

Why: the user called the full backfill "MASSIVE" after I ran it in end-to-end tests, and said to use tiny configs so we don't send hundreds or thousands of unnecessary LinkedIn queries (rate limits, runner minutes, and Actions cost on private repos). Before any run, confirm the size offline with `python scrape_jobs.py --linkedin-emit-matrix [--phase high]` (no network calls) and state the job count. Tiny-config test runs on a test repo are fine to do; anything larger needs the user's explicit go-ahead.
