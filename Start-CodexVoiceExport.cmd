@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "ROOT=%~dp0"
set "EXPORTER=%ROOT%Export-CodexVoiceSession.ps1"
set "OUTPUTS=%ROOT%outputs"

if not exist "%EXPORTER%" (
  echo ERROR: Exporter not found: "%EXPORTER%"
  pause
  exit /b 1
)
if not exist "%OUTPUTS%" mkdir "%OUTPUTS%"
if errorlevel 1 (
  echo ERROR: Could not create the outputs folder: "%OUTPUTS%"
  pause
  exit /b 1
)

for /f "usebackq delims=" %%T in (`powershell.exe -NoProfile -Command "[DateTime]::Now.ToString('yyyyMMdd-HHmmss')"`) do set "STAMP=%%T"
if not defined STAMP (
  echo ERROR: Could not create a timestamp for the output filename.
  pause
  exit /b 1
)

set "OUT=%OUTPUTS%\codex-voice-session-%STAMP%.md"
set /a INDEX=1
:next_name
if exist "%OUT%" (
  set "OUT=%OUTPUTS%\codex-voice-session-%STAMP%-%INDEX%.md"
  set /a INDEX+=1
  goto next_name
)

echo Exporting the newest Codex session...
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%EXPORTER%" -OutputPath "%OUT%"
if errorlevel 1 (
  echo.
  echo ERROR: Export failed. No existing export was deleted or overwritten.
  pause
  exit /b 1
)

echo.
echo Created: "%OUT%"
start "" "%OUT%"
pause
exit /b 0
