<!-- Shared from https://github.com/Symeres/.github (claude/). Update it there, then run claude/install.ps1 again. -->

# Issues: GitHub, one board for all repositories

My work is tracked in GitHub issues, in the repository the code lives in (the `Symeres` organization, or my personal
account). Every issue is on one board: the Symeres project **planning** (https://github.com/orgs/Symeres/projects/7).
Use the `gh` CLI for all of it; ask me before pushing, opening a pull request, or creating issues.

The commands `/new-issue <idea>`, `/next-issue [all|label]`, `/work-on <number or URL>` and `/finish-issue` run this
workflow. The rules they follow:

1. **Small issues**: one session, one pull request. Bigger work is a parent issue with sub-issues (`--parent`), and
   order between issues is a "blocked by" link (`--blocked-by`), not a sentence in the description.
2. **Issue body**: `## Why`, `## Context`, `## Acceptance criteria` (`- [ ]` items, each a testable outcome) and
   `## References` (repository paths to read first). Issue type Task, Bug or Feature (`--type`) in Symeres repositories;
   in personal repositories use the `bug` or `enhancement` label instead.
3. **Plan before code**: post the plan as an issue comment, then stop until I approve it in the chat. Update that
   comment (`gh issue comment <n> --edit-last`) when the plan changes.
4. **Branch per issue**: `gh issue develop <n> --name <n>-<short-title> --base <default branch> --checkout`, so the
   branch shows on the issue. Commit messages end with the issue: `Add signature check (#12)`.
5. **Acceptance criteria are ticked only when verified**, by editing the issue body. Say how each was verified.
6. **The pull request body is the report**: `Closes #<n>` (or `Closes owner/repo#<n>`), then `## Summary`,
   `## Implementation notes` (decisions, deviations from the plan), `## How to verify`, `## Follow-ups`.
7. **Comments you post start with `🤖 Claude:`**, so people can tell them from mine. Questions for people go in issue
   comments, not only in the chat.
8. Repository specifics (build and test commands, conventions, Definition of Done) come from the repository's own
   `CLAUDE.md` / `AGENTS.md`.

## Board

Status flow: Todo → In Progress (`/work-on`) → In review (pull request opened) → Done (set by GitHub when the issue
closes); On hold for parked work. Fields: Status, Priority (high, medium, low). Add every new issue to the board;
`item-add` returns the item id and is safe to repeat:

```bash
gh project item-add 7 --owner Symeres --url <issue url> --format json --jq .id
gh project item-edit --id <item id> --project-id PVT_kwDOBfWYLM4AbghN --field-id <field id> --single-select-option-id <option id>
gh project item-list 7 --owner Symeres --format json --limit 500
```

| Field | Field id | Options |
|---|---|---|
| Status | `PVTSSF_lADOBfWYLM4AbghNzgRtj7Q` | Todo `a7279dc6`, In Progress `47fc9ee4`, In review `397b6262`, On hold `f47b7170`, Done `98236657` |
| Priority | `PVTSSF_lADOBfWYLM4AbghNzgmDCT0` | high `9a721c81`, medium `217eb352`, low `2e6794cc` |
