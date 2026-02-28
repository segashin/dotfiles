---
name: commit
description: Stage and commit changes with a well-formatted message
disable-model-invocation: true
argument-hint: [optional message]
allowed-tools: Bash(git status *), Bash(git diff *), Bash(git log *), Bash(git add *), Bash(git commit *)
---

Create a git commit for the current changes.

## Steps

1. Run `git status` to see current state (never use -uall flag)
2. Run `git diff` to review unstaged changes
3. Run `git diff --cached` to review staged changes
4. Run `git log --oneline -5` to see recent commit style
5. Stage relevant files (prefer specific files over `git add -A`)
6. Write a clear commit message following the repository's style
7. Run `git commit` with the message
8. Verify with `git status`

## Commit Message Format

- Use conventional commits if the repo follows that style (feat, fix, docs, refactor, test, chore)
- First line: concise summary (50 chars or less)
- Use present tense ("Add feature" not "Added feature")
- Reference issues if applicable

## User Input

If the user provided a message hint: $ARGUMENTS

Use this to guide the commit message content.
