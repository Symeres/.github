# Symeres/.github

- `.github/`: default issue forms (Task, Feature, Bug) and the pull request template for every Symeres repository that
  doesn't have its own. Issues created from these forms get their issue type and are added to the
  [planning](https://github.com/orgs/Symeres/projects/7) board.
- `claude/`: the GitHub issue workflow for Claude Code: the rules (`github-workflow.md`) and the `/new-issue`,
  `/next-issue`, `/work-on` and `/finish-issue` commands.

## Install the Claude Code workflow

Needs the GitHub CLI 2.100 or newer, signed in with the `project` scope:

```bash
gh auth refresh -h github.com -s project
gh repo clone Symeres/.github "$HOME/symeres-dotgithub"
pwsh "$HOME/symeres-dotgithub/claude/install.ps1"
```

The script copies the files into `~/.claude` and adds `@~/.claude/github-workflow.md` to your own
`~/.claude/CLAUDE.md` (it keeps anything else in there). To update later: `git -C "$HOME/symeres-dotgithub" pull`, then run
the script again.

Change the workflow here, through a pull request, rather than in your own `~/.claude`: the script overwrites those files.
