---
description: Pick the next ready GitHub issue from the board and start on it
argument-hint: [all | label, optional; default is the current repository]
---

1. List the board items (`gh project item-list`, see "Board" in `~/.claude/CLAUDE.md`). Ready means: an open issue,
   Status Todo, no assignee, and no open "blocked by" issues (check candidates with
   `gh issue view <n> -R <owner/repo> --json blockedBy`). Parent issues with open sub-issues are not ready themselves.
   - No argument: only issues from the current repository.
   - `all`: the whole board, grouped by repository.
   - Anything else: only issues with that label.
2. Show me the top three: repository, number, priority, title, and one line on why it is a good next step (it unblocks
   other issues, it is high priority, it is small). Wait for my choice.
3. Work on the chosen issue by following `~/.claude/commands/work-on.md`. If it is in another repository, tell me which
   folder to open instead of starting here.
