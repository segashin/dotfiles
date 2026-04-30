---
name: diary
description: Record a daily diary entry of session work in diary/YYYY-MM-DD.md at the git repo root
disable-model-invocation: true
argument-hint: [optional focus or topic hint]
---

Write a diary entry summarizing what was done in this Claude Code session, so the user can reload context in future sessions.

## Steps

1. Resolve the diary path:
   - `git rev-parse --show-toplevel` to get the repo root
   - `date +%Y-%m-%d` for today's date
   - Target: `<repo-root>/diary/YYYY-MM-DD.md`
   - Create `<repo-root>/diary/` if it doesn't exist
2. Read the target file if it exists — you will MERGE into it, not append a second entry.
3. Skim one prior entry (e.g. the most recent file in `diary/`) to match tone and section structure.
4. Reflect on this session from the conversation history: decisions, what was built, files changed, gotchas, deferred items. Don't invent — only write what actually happened.
5. Cross-check against the working tree (optional but recommended):
   - `git log --since=midnight --pretty=format:'%h %s'` — what landed in git today
   - `git status --short` — what's still uncommitted
6. Write the file: `Edit` if it exists, `Write` if new. Follow the format below.

## File format

- **H1**: `# YYYY-MM-DD — <one-line topic>` describing the day's theme
- **Summary**: a `>` blockquote (1–3 sentences) under the H1 — what the day accomplished and why it matters
- **Sections** (include only those that apply, in this order):
  - `## Decisions` — choices made + alternatives rejected + short reason
  - `## Architecture added` — new components/charts/services brought online
  - `## Repo changes` — with `### Added` / `### Modified` / `### Removed` subsections listing concrete paths
  - `## Workflow` — new procedures or commands the user should follow going forward
  - `## Gotchas learned` — surprises, root causes, debugging detours worth remembering
  - `## Todo remaining` — items deferred to a future session

Tone: terse, present tense; backtick paths and identifiers; fenced code blocks for commands. The reader is the user weeks from now trying to reload context — capture *why*, not just *what*.

## Merging into an existing file

If today's file already exists, the result must read as ONE coherent diary for the whole day — not a log of two sessions. So:

- **Update the H1 topic** if the new work meaningfully extends the day's theme (e.g. "TLS pipeline" → "TLS pipeline + storage layer")
- **Extend the summary** blockquote to mention the new strand
- **Fold new content into existing sections** — new bullets under `## Decisions`, new subsections under `## Architecture added`, additional paths under `### Added`/`### Modified`. Do not create a second `## Decisions` heading
- **Resolve TODOs**: if today's session completed an item from `## Todo remaining`, remove it from that list and (if notable) reflect it in the relevant section above
- Preserve the original ordering/voice of existing content; only rewrite a paragraph if today's work changes its meaning

## User input

Optional topic/focus hint: $ARGUMENTS

If provided, prioritize that strand in the summary and section ordering. Otherwise infer focus from the session.
