---
name: pr
description: Create a GitHub pull request
disable-model-invocation: true
argument-hint: [base-branch]
---

Create a pull request for the current branch.

## Steps

1. Run `git status` to verify current branch (never use -uall flag)
2. Run `git log` and `git diff <base>...HEAD` to understand all changes
3. Ensure branch is pushed to remote (push if needed with `-u` flag)
4. Analyze ALL commits in the branch, not just the latest
5. Create PR with `gh pr create`:

```bash
gh pr create --title "Title here" --body "$(cat <<'EOF'
## Summary
<bullet points summarizing changes>

## Test plan
<how to test the changes>
EOF
)"
```

## User Input

Base branch: $ARGUMENTS

If not specified, use the repository's default branch.

## PR Guidelines

- Keep title under 70 characters
- Summary should explain the "why" not just the "what"
- Include test plan or verification steps
- Reference related issues with "Fixes #123" or "Relates to #123"
