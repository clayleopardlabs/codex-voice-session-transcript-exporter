# Project Brainstorming

Use the supplied project path from `$ARGUMENTS`.

1. Resolve the argument to an existing project directory. If it is missing or invalid, report the exact problem and stop.
2. Search the project for a directory named `systemreality`, case-insensitively. If none exists, create `<project>\docs\systemreality`, creating `docs` only if needed.
3. Inspect applicable `AGENTS.md` files, the current Git commit, project documentation, source structure, active configuration, interfaces, dependencies, and relevant tests. Do not modify source code or unrelated files.
4. If creating a snapshot, write `<commit>-<YYYYMMDD>.md` in the chosen `systemreality` folder, using `no-commit-<YYYYMMDD>.md` when no Git commit exists. Never overwrite an existing snapshot; add a unique suffix if needed.
5. Cover components that actually exist, implementing files, real data flow, active interfaces and dependencies, tests proving behavior, and assumptions separated into verified, proposed, and unknown. Treat `AGENTS.md` as stable agent instructions, not proof that an implementation exists.
6. Begin brainstorming with this protocol:

```text
Distinguish brainstorming, questions, options, recommendations, and decisions. Do not treat proposals as decisions unless the user accepts them.

DECISION CHECKPOINT
Decision:
Reason:
Implementation changes:
Open questions:
End decision checkpoint
```

Use the checkpoint whenever an important point is finalized. Mark superseded decisions explicitly. For current behavior, distinguish verified facts from proposed behavior and unknowns. Periodically summarize confirmed decisions, superseded decisions, implementation changes, and unresolved questions.

Do not implement project changes as part of this command. End with a concise decision and implementation record for the next agent.
