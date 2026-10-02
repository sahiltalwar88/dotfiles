---
name: candidate-evidence-rules
description: "The owner's standing rules for how their experience counts against job requirements (production, personal projects, degree fields, recency)"
metadata:
  node_type: memory
  pinned: false
  originSessionId: 7787d068-c8d7-4f0c-a92b-d743f853b3b9
  modified: 2026-09-30T05:01:56.812Z
---

When judging the job-hunter owner's experience against job requirements (grade-jd verdicts, resume tailoring, veracity), the owner has set these rules:

- **A personal project never counts as production experience.** "In production" means shipped in a product. It is still evidence of skills.
- **Adopting AI tools in an engineering team's own process (an AI-assisted SDLC) is not shipping AI-native workflows in a product.**
- **A degree counts as any broader field it belongs to.** Computer Science counts as Engineering for any job the owner would apply to; the same holds in general (e.g. Sociology counts as a Science).
- **Don't invent recency requirements.** Older hands-on experience counts unless the job description explicitly asks for current or recent experience.
- **Grade by the requirement's named elements.** All evidenced → met; some → partial; none → GAP. Loosely related experience that matches none of the named elements (general LLM use against "model training, RAG, AI platforms") is still a GAP. An element whose evidence is unknown (e.g. where a solution is deployed) counts as not evidenced.
- **Judge each requirement only against its own text.** Don't import qualifiers such as "customer-facing" from the role description or from other requirements.

Why: the owner corrected these in a Sept 2026 review of grade-jd variance. The model had counted a personal pipeline as production AI work, marked a CS degree down against a JD that listed Engineering, and penalized requirements for recency and "not customer-facing" when the JD asked for neither.

How to apply: use these whenever writing or reviewing grading or tailoring prompts, or when judging a verdict's correctness in evals. Changes to prompts still need a diff and an A/B (see the prompt-changes-need-review memory).
