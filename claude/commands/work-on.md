---
description: Work on a GitHub issue end to end - assign, branch, plan (with approval), implement, verify, hand over
argument-hint: <issue number or URL>
---

Work on GitHub issue $ARGUMENTS, following "Issues" in `~/.claude/CLAUDE.md`. Tell me briefly which step you are on.

1. **Context**: `gh issue view $ARGUMENTS --comments --json title,body,comments,assignees,blockedBy,subIssues,issueType,labels,url`.
   Read the repository's `CLAUDE.md` / `AGENTS.md`, the files under `## References` and the code they point to.
2. **Ready?** Stop and tell me if the issue is closed, assigned to someone else, blocked by an open issue, a parent with
   open sub-issues, or has no acceptance criteria. Suggest criteria or a split into smaller issues instead of guessing.
3. **Take it**: `gh issue edit $ARGUMENTS --add-assignee @me`, add it to the board if it is not there, and set Status to
   In Progress.
4. **Branch**: `gh issue develop $ARGUMENTS --name <number>-<short-title> --base <default branch> --checkout` from an
   up-to-date default branch. Ask me first if the working tree has uncommitted changes.
5. **Plan**: post the plan as a comment (`🤖 Claude: **Implementation plan**` with the steps, the files to change, the
   tests to add and open questions). Then **stop and show me the plan**. Continue only after I approve it; when I
   change it, update the comment with `gh issue comment $ARGUMENTS --edit-last --body-file <file>`.
6. **Implement** in small steps. Commit with the issue at the end of the message: `<what changed> (#<number>)`. Keep a
   running list of decisions, deviations from the plan and commands run, for the pull request's implementation notes.
   If the work spans sessions, post that list as an issue comment before you stop.
7. **Ask people in the issue**: questions for the reporter or others go in an issue comment (`🤖 Claude: ...`). Check the
   comments for answers before you continue on that point.
8. **Verify and hand over**: follow `~/.claude/commands/finish-issue.md`.
