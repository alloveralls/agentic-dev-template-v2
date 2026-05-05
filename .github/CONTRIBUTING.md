# Contributing

This repository is operated for internal development. Keep the flow small, reviewable, and consistent with the rules in [AGENTS.md](../AGENTS.md).

## Workflow

1. Create a new change with `jj new`.
2. Implement the smallest coherent change.
3. Check status and diff with `jj st` and `jj diff`.
4. Set a Conventional Commit message with `jj describe -m "<type>: <description>"`.
5. Push with `jj git push`.
6. Open or update the PR with `gh`.

## Pull Requests

- Use the PR template and fill every section.
- Keep the PR scoped so it can be reviewed in one pass.
- Re-request review after material updates.
- Merge policy is `1 approval + green CI`.
- Merge strategy is Squash merge.

## Work Logs

- Start each session by creating a file under `.work-logs/work/YYYY-MM-DD/`.
- Record context, changed files, notable commands, and next steps.
- Update the work log status to `completed` or `interrupted` at the end of the session.

## Review Ownership

- `CODEOWNERS` defines the default review owner as `@alloveralls`.
- Changes to `.github`, `.agents`, `AGENTS.md`, and `DESIGN.md` are also owned by `@alloveralls`.

## More Detail

For the full operating rules, including review logging and GitHub workflow conventions, see [AGENTS.md](../AGENTS.md).
