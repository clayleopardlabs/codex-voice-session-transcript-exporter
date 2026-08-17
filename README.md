# Codex Voice session exporter

This tool turns a local Codex Voice session into a Markdown file.

It’s local only. It doesn’t call a model or send data online.


## Meeting workflow

1. Start the brainstorming skill:

   ```text
   $brainstorming <project>
   ```

   In OpenCode, use `/brainstorming <project>`.

   e.g. /brainstorming bigtittygothgirlholigraphicgirlfriend project

 When you come to a decision on something say so.
 It summarizes the decision.

2. Run the exporter when the meeting ends.
  
   After a meeting, run:

```text
Start-CodexVoiceExport.cmd
```

It’ll find the newest session, save a dated Markdown file, and open it.

You can also use PowerShell:

```powershell
.\Export-CodexVoiceSession.ps1 -OutputPath '.\outputs\session.md'
```

3. Give the Markdown file to a local model to extract the decisions and task list.

#### Prompt for meeting summarizer model aka minute taking unpaid intern

    Your purpose is to taking a transcript of a meeting and generating meeting minutes which consist of a summary of the decisions reached and a task list in simple english. 

    Discern generic brainstorming from the final decisions that were arrived at during the meeting and filter out system noise.

    You will receive the transcript as your first message. respond with the meeting minutes and nothing else

   
4. Give the reviewed task list to the coding agent.


