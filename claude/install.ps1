# Installs the shared GitHub issue workflow for Claude Code into ~/.claude.
# Safe to run again after an update: the workflow file and the four commands are replaced,
# your own ~/.claude/CLAUDE.md is kept and only gets the import line once.

$ErrorActionPreference = 'Stop'
$source = $PSScriptRoot
$target = Join-Path $HOME '.claude'
$commands = Join-Path $target 'commands'

New-Item -ItemType Directory -Force -Path $commands | Out-Null

Copy-Item (Join-Path $source 'github-workflow.md') $target -Force
Copy-Item (Join-Path $source 'commands\*.md') $commands -Force

$claudeMd = Join-Path $target 'CLAUDE.md'
$import = '@~/.claude/github-workflow.md'
if (-not (Test-Path $claudeMd)) {
    Set-Content -Path $claudeMd -Value $import -Encoding utf8
} elseif (-not (Select-String -Path $claudeMd -SimpleMatch $import -Quiet)) {
    Add-Content -Path $claudeMd -Value "`n$import" -Encoding utf8
}

Write-Host "Installed into $target. Restart Claude Code and type / to see /new-issue, /next-issue, /work-on and /finish-issue."
