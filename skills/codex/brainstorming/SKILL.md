---
name: brainstorming
description: Prepare an evidence-backed system-reality snapshot for a supplied project and run a decision-tracked architecture brainstorming session. Use when the user invokes brainstorming with a project path such as /brainstorming <path-to-project>.
---

# Project brainstorming

Accept one required argument: the project directory. Resolve it to an existing directory before changing anything. Do not modify source code, configuration, or unrelated repositories as part of preparation.

## Phase 1: Locate reality notes

Search the supplied project for a directory named `systemreality` case-insensitively. Prefer an existing project-owned folder. If none exists, create `<project>\docs\systemreality` (creating `docs` only if necessary).

Inspect the current Git commit if the directory is a Git worktree. Create a new Markdown snapshot named `<commit>-<YYYYMMDD>.md`, using the current commit identifier and local date. If there is no Git commit, use `no-commit-<YYYYMMDD>.md`. Do not overwrite an existing snapshot; add a short unique suffix if the exact name already exists.

## Phase 2: Build the system-reality snapshot when needed

Read applicable `AGENTS.md` files, project documentation, source structure, active configuration, interfaces, and relevant tests. Write a concise factual snapshot containing:

```markdown
# System reality

- Project: <path>
- Snapshot commit: <commit or no-commit>
- Snapshot date: <local date>
- Evidence scope: <directories/files inspected>

## Components that actually exist
## Files that implement them
## Real data flow
## Active interfaces and dependencies
## Tests that prove behavior
## Assumptions
### Verified
### Proposed
### Unknown
```

Distinguish `AGENTS.md` instructions from evidence about implementation. Never present a planned component as existing. Include file paths and test names when known. If a suitable current snapshot exists, use it rather than creating a duplicate unless it is clearly stale or the user asks for a refresh.

## Phase 3: Begin the brainstorming session

Tell the user that the reality briefing is ready, then follow this protocol:

- Distinguish brainstorming, questions, options, recommendations, and decisions.
- Do not treat a proposal as accepted unless the user accepts it or the conversation clearly agrees to proceed.
- When an important point is finalized, say exactly:

```text
DECISION CHECKPOINT
Decision:
[the precise choice]
Reason:
[why it was chosen]
Implementation changes:
[concrete code, architecture, test, documentation, configuration, or operations changes]
Open questions:
[anything unresolved]
End decision checkpoint
```

- Mark earlier decisions as superseded when the group changes direction.
- For current-system questions, distinguish verified facts, briefing facts, proposed behavior, and unknowns. Do not infer implementation from architecture discussion.
- Periodically refresh the record with confirmed decisions, superseded decisions, implementation changes, and unresolved questions.

At the end, summarize confirmed decisions and implementation changes without silently turning suggestions into requirements. Do not implement project changes in this skill.
