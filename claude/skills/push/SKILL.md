---
name: push
description: Push commits to remote repository
disable-model-invocation: true
argument-hint: [remote] [branch]
---

Push the current branch to the remote repository.

## Steps

1. Run `git status` to verify clean state and current branch
2. Run `git log origin/$(git branch --show-current)..HEAD --oneline` to see commits to push (if tracking exists)
3. Push to remote:
   - If arguments provided: `git push $ARGUMENTS`
   - Otherwise: `git push origin $(git branch --show-current)`
4. If branch has no upstream, use `-u` flag to set tracking
5. Confirm the push succeeded

## User Input

Remote and branch arguments: $ARGUMENTS

If empty, push current branch to origin.

## Safety

- Never use `--force` or `-f` unless explicitly requested
- Warn if pushing to main/master branch
