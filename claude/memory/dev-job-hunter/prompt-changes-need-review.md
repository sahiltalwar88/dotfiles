---
name: prompt-changes-need-review
description: job-hunter LLM prompts are heavily engineered; show every prompt change as a diff and A/B it before adopting
metadata:
  node_type: memory
  pinned: false
  originSessionId: ad7481b4-8ef2-4bbb-8afe-807d24dfbe79
  modified: 2026-09-28T18:38:47.639Z
---

The job-hunter pipeline's LLM prompts (the `_config/*-protocol.md` files and the prompt builders in `pipeline/steps/`) have been heavily engineered, and the user is wary of regressions from edits to them. Whenever a change touches prompt text — even a wording cleanup, deduplication, or moving text between the system prompt and the user message — show the user the exact change (a diff, or the full section with changes marked) and get agreement before treating it as adopted.

Back prompt changes with a live A/B against the old prompt over several JDs and repeated runs (grades, verdicts, output tokens), not just unit tests. Borderline requirements flip between DIRECT_HIT/ADDRESSED/PARTIAL on small prompt perturbations, so a change that looks neutral can move a job across the grade threshold.
