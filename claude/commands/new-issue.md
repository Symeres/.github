---
description: Turn a rough idea into a well-formed GitHub issue (or a parent with sub-issues) on the board
argument-hint: <what you want, in your own words>
---

Create a GitHub issue in the current repository (or the one I name) from this idea: $ARGUMENTS

Follow "Issues" in `~/.claude/CLAUDE.md`.

1. Look for duplicates: `gh issue list --state all --search "<keywords>"`. If one exists, show it and ask whether to
   add to it instead.
2. Read the relevant code briefly so the context and references are concrete.
3. Draft:
   - a title (imperative, under 70 characters), the type (Task, Bug or Feature) and a priority (high, medium, low);
   - the body with `## Why`, `## Context`, `## Acceptance criteria` (3 to 6 `- [ ]` items, each a testable outcome
     rather than a step) and `## References` (repository paths);
   - `--parent` / `--blocked-by` when it belongs to a bigger issue or needs another one first.
   If it is more than one session or one pull request of work, propose a parent issue with sub-issues instead.
4. Show me the draft. Only after I agree:
   - `gh issue create --title ... --body-file <file> --type <type>` (Symeres repositories) or `--label bug|enhancement`
     (personal repositories), plus `--parent` / `--blocked-by`;
   - add it to the board and set Status to Todo and the Priority (`gh project item-add`, `gh project item-edit`, IDs in
     `~/.claude/CLAUDE.md`);
   - give me the issue URL.
