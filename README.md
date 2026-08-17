# Codex Voice session exporter

This tool turns a local Codex Voice session into a Markdown file.

It’s local only. It doesn’t call a model or send data online.

## Use it

After a meeting, run:

```text
Start-CodexVoiceExport.cmd
```

It’ll find the newest session, save a dated Markdown file, and open it.

You can also use PowerShell:

```powershell
.\Export-CodexVoiceSession.ps1 -OutputPath '.\outputs\session.md'
```

Run the test with:

```powershell
.\Export-CodexVoiceSession.ps1 -SelfTest
```

## Meeting workflow

1. Start the brainstorming skill:

   ```text
   $brainstorming <project-path>
   ```

   In OpenCode, use `/brainstorming <project-path>`.

2. Ask the meeting model to separate ideas from decisions.
3. When you make a decision, use:

   ```text
   DECISION CHECKPOINT
   Decision:
   Reason:
   Implementation changes:
   Open questions:
   End decision checkpoint
   ```

4. Repeat a short decision review during long meetings.
5. Run the exporter when the meeting ends.
6. Give the Markdown file to a local model to extract the decisions and task list.
7. Give the reviewed task list to the coding agent.

The repository includes the Codex skill and OpenCode command in `skills`.
