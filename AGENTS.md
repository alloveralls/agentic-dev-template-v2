# Project Guidelines

## Version Control

Use **jj (Jujutsu)** for all version control operations instead of git commands.

Common jj equivalents:

- `jj st` — show status
- `jj diff` — show changes
- `jj log` — show history
- `jj new` — create a new change
- `jj describe -m "message"` — set commit message
- `jj squash` — squash into parent
- `jj bookmark set <name>` — set bookmark (branch)
- `jj git push` — push to remote

## Commit Messages

Follow **Conventional Commits** format:

```text
<type>[optional scope]: <description>

[optional body]

[optional footer]
```

### Types

| Type | When to use |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `docs` | Documentation only changes |
| `test` | Adding or updating tests |
| `chore` | Build process, tooling, or dependency updates |
| `perf` | Performance improvement |
| `ci` | CI/CD configuration changes |

### Rules

- Use lowercase for type and description
- Description must be in imperative mood ("add feature" not "added feature")
- No period at the end of the description
- Breaking changes: add `!` after type/scope or `BREAKING CHANGE:` footer

---

## Work Logs

Maintain logs in `.work-logs/` to enable resumption after unexpected shutdowns.

```text
.work-logs/
  work/
    YYYY-MM-DD/
      YYYYMMDDTHHmmss.md   # one file per session
  reviews/
    YYYY-MM-DD/
      YYYYMMDDTHHmmss.md   # one file per review run
```

### ID Format

- Work session: `WRK-YYYYMMDDTHHmmss`  (e.g. `WRK-20260504T142300`)
- Review: `REV-YYYYMMDDTHHmmss`  (e.g. `REV-20260504T143500`)
- Reviews reference their work session via `work_id`.

---

### Work Session Format

`.work-logs/work/YYYY-MM-DD/YYYYMMDDTHHmmss.md`

````markdown
---
id: WRK-YYYYMMDDTHHmmss
date: YYYY-MM-DDTHH:mm:ss
task: <one-line task description>
status: in_progress | completed | interrupted
---

## Context

<What was being done and why. Enough detail to resume cold.>

## Changes

- `<file path>` — <what changed and why>

## Commands Run

```text
<notable commands executed>
```

## Next Steps

- [ ] <immediate next action>
- [ ] <subsequent actions>

## Notes

<Anything surprising, blocked, or worth remembering.>
````

**status values:**

| Value | Meaning |
|-------|---------|
| `in_progress` | Session is active |
| `completed` | Task fully done |
| `interrupted` | Stopped mid-task; next steps recorded |

---

### Review History Format

`.work-logs/reviews/YYYY-MM-DD/YYYYMMDDTHHmmss.md`

```markdown
---
id: REV-YYYYMMDDTHHmmss
work_id: WRK-YYYYMMDDTHHmmss
date: YYYY-MM-DDTHH:mm:ss
reviewer: <agent type, e.g. code-reviewer>
---

## Summary

<Overall assessment of the review.>

## Issues

| ID | Severity | File | Line | Description | Status | Note |
|----|----------|------|------|-------------|--------|------|
| 1  | CRITICAL  | `src/foo.ts` | 42 | <description> | open | |
| 2  | HIGH      | `src/bar.ts` | 10 | <description> | fixed | |
| 3  | MEDIUM    | `src/baz.ts` | — | <description> | deferred | address in follow-up PR |
| 4  | LOW       | `src/qux.ts` | 5  | <description> | wont_fix | out of scope |
```

**Severity levels:**

| Level | Meaning |
|-------|---------|
| `CRITICAL` | Must fix before merge; security or correctness risk |
| `HIGH` | Should fix in this PR |
| `MEDIUM` | Fix if feasible; otherwise track |
| `LOW` | Nice to have |

**Status values:**

| Value | Meaning |
|-------|---------|
| `open` | Not yet addressed |
| `fixed` | Resolved in current session |
| `deferred` | Acknowledged; tracked for later |
| `wont_fix` | Intentionally not fixing; reason noted |

---

### Workflow

1. **Start of session** — create a `work` file with `status: in_progress`.
2. **After code review** — create a `review` file linked to the work session via `work_id`.
3. **Update review statuses** as issues are resolved during the session.
4. **End of session** — update the `work` file's `status` and fill in **Next Steps**.
5. **Resuming after interruption** — read the latest `interrupted` work file and its linked review file to restore context.

---

## GitHub Workflow (PR-Centric)

Use this workflow for changes that are delivered through GitHub pull requests.

### Principles

- Keep all version-control actions in `jj`. Do not switch to a git-first local flow.
- Use `gh` as the standard interface for GitHub operations.
- Keep PR scope small enough to review in one pass.

### 1) Prepare Local Change

1. Create a new change: `jj new`
2. Implement and verify locally.
3. Check current state and diff: `jj st`, `jj diff`
4. Set a Conventional Commit message: `jj describe -m "<type>: <description>"`
5. If needed, clean up history: `jj squash`

### 2) Publish and Open PR

1. Set or update bookmark: `jj bookmark set <name>`
2. Push to remote: `jj git push`
3. Create PR with `gh`:
   `gh pr create --title "<title>" --body "<body>"`
4. PR description must include:
   - Objective and context
   - Key changes
   - Test/verification performed
   - Risks and impact scope

### 3) Review and Update

1. Address review comments in follow-up commits/changes.
2. Re-check diff and status: `jj diff`, `jj st`
3. Push updates: `jj git push`
4. Re-request review when significant updates are made.

### 4) Merge Rules

- Merge strategy: **Squash merge**
- Required before merge:
  - At least **1 approval**
  - All required **CI checks green**
- Do not merge when CI is failing or approval is missing.

### 5) Post-Merge

1. Confirm PR is merged on GitHub.
2. Clean up obsolete bookmark(s) locally.
3. Start the next task with a fresh `jj new` change.

---

## Suggested Additional Skills

The current skills cover coding, review, security, tests, and release notes. The following are recommended additions for GitHub-centric delivery operations:

1. `github-pr-operations`
   - Focus: PR creation/update, review request flow, merge-readiness checks using `jj` + `gh`.
2. `ci-triage`
   - Focus: fast diagnosis of GitHub Actions failures, reproduction guidance, and fix prioritization.
3. `issue-triage`
   - Focus: issue intake quality, reproducibility checks, label/priority assignment, and backlog clarity.
