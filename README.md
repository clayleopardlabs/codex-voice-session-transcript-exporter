# Codex Voice session exporter

This small Windows tool turns a local Codex Voice session into a Markdown file.

It is local only. It does not call a model or send data to the internet.

## Use it

After a Voice meeting, double-click:

```text
Start-CodexVoiceExport.cmd
```

The tool finds the newest Codex session, writes a dated Markdown file in `outputs`, and opens it. It never overwrites an older export.

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

## Meeting workflow

1. Start the meeting with a frontier-level model. Ask it to separate brainstorming from decisions.
2. When you agree on an important point, ask for this checkpoint:

   ```text
   DECISION CHECKPOINT
   Decision:
   Reason:
   Implementation changes:
   Open questions:
   End decision checkpoint
   ```

3. Every 20–30 minutes, ask for a short list of confirmed decisions, changed decisions, implementation changes, and open questions. This helps when the meeting is long.
4. End the meeting and run the exporter.
5. Give the Markdown file to a small local model in LM Studio. Ask it to extract the final decisions and implementation checklist. Do not ask it to invent new designs.
6. Give the reviewed checklist to a smarter coding agent. That agent checks the current project and makes the approved changes.

The frontier model does the hard reasoning. The exporter keeps the record. The local model takes the minutes. The coding agent implements the reviewed result.
