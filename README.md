# Codex Voice session exporter

This small Windows tool turns a local Codex Voice session into a Markdown file.

It’s local only. It doesn’t call a model or send your transcript to the internet.

## Export a session

After a Voice meeting, double-click:

```text
Start-CodexVoiceExport.cmd
```

It’ll find the newest Codex session, write a dated Markdown file in `outputs`, and open it. It won’t overwrite an older export.

You can also run it in PowerShell:

```powershell
.\Export-CodexVoiceSession.ps1 -OutputPath '.\outputs\session.md'
```

To export one known session:

```powershell
.\Export-CodexVoiceSession.ps1 -SessionPath 'C:\Users\Omen\.codex\sessions\...jsonl' -OutputPath '.\outputs\session.md'
```

Run the built-in test:

```powershell
.\Export-CodexVoiceSession.ps1 -SelfTest
```

## The meeting workflow

1. Before the meeting, run the brainstorming skill for the project. It creates or reuses the `systemreality` briefing so the frontier model can reason from the current system without rereading the whole project.

   In Codex desktop, use:

   ```text
   $brainstorming B:\Projects\your-project\
   ```

   In OpenCode, use:

   ```text
   /brainstorming B:\Projects\your-project\
   ```

   The skill checks the project, writes the reality snapshot when needed, and then starts the decision-tracked brainstorming session.

2. Start the meeting with a frontier-level model. Ask it to separate brainstorming from decisions.
3. When you agree on an important point, ask for this:

   ```text
   DECISION CHECKPOINT
   Decision:
   Reason:
   Implementation changes:
   Open questions:
   End decision checkpoint
   ```

4. Every 20–30 minutes, ask for a short list of confirmed decisions, changed decisions, implementation changes, and open questions. This’ll help when the meeting gets long.
5. End the meeting and run the exporter.
6. Give the Markdown file to a small local model in LM Studio. Ask it to extract the final decisions and an implementation checklist. Don’t ask it to invent new designs.
7. Give the reviewed checklist to a smarter coding agent. It’ll check the current project and make the approved changes.

The frontier model does the hard reasoning. The exporter keeps the record. The local model takes the minutes. The coding agent implements the reviewed result.

## Brainstorming skills

This repository also includes the skills used to prepare a project and start the meeting.

### Codex desktop skill

Copy `skills\codex\brainstorming\SKILL.md` to:

```text
C:\Users\Omen\.codex\skills\brainstorming\SKILL.md
```

Then use the skill with the project path:

```text
$brainstorming B:\Projects\your-project\
```

### OpenCode command

Copy `skills\opencode\brainstorming.md` to:

```text
C:\Users\Omen\.config\opencode\commands\brainstorming.md
```

Then use:

```text
/brainstorming B:\Projects\your-project\
```

The skill looks for a `systemreality` folder. If it can’t find one, it creates `docs\systemreality` and writes a dated snapshot named from the current Git commit. The snapshot records the components, files, data flow, active interfaces, dependencies, tests, and verified, proposed, and unknown assumptions.

The skill won’t treat a proposal as a decision. During the meeting, it’ll use the decision checkpoint format above and mark old decisions as superseded when needed.
