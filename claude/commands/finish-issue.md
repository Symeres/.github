---
description: Verify the GitHub issue you are working on and hand it over as a pull request
argument-hint: [issue number or URL; defaults to the issue of the current branch]
---

For issue $ARGUMENTS (or, if empty, the issue in the current branch name `<number>-...`), following "Issues" in
`~/.claude/CLAUDE.md`:

1. `gh issue view <n> --json body,title,url`. List the acceptance criteria that are not ticked yet and the repository's
   Definition of Done (its `CLAUDE.md` / `AGENTS.md`).
2. Run the checks (build, tests, lint as the repository describes). Tick each criterion you verified by editing the
   issue body (`gh issue edit <n> --body-file <file>`), changing only those checkboxes. If something is not met, say
   what and stop; don't hand over unfinished work.
3. Propose follow-up work as new issues (after I agree, as in `/new-issue`) rather than leaving TODOs in the code.
4. Write the pull request body to a file: `Closes #<n>`, `## Summary` (what changed and why), `## Implementation notes`
   (decisions, deviations from the plan), `## How to verify`, `## Follow-ups`.
5. Show me the body, `git status`, `git log --oneline <default branch>..HEAD`, and the commands to push and open the pull
   request (`git push -u origin HEAD`, `gh pr create --title "<issue title>" --body-file <file>`). Push and open it
   only when I say so; then set the board Status to In review.
