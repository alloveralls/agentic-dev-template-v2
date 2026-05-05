# Template Setup

Use this checklist after copying this repository to start a new internal AI agent project.

## 1. Replace Placeholder Content

- [ ] Update [README.md](./README.md) and replace every `TBD` section with project-specific content.
- [ ] Review [AGENTS.md](./AGENTS.md) and update any repository-specific workflow, review, or ownership rules.
- [ ] Customize [DESIGN.md](./DESIGN.md) by replacing placeholders, example tokens, and unresolved questions with project-specific design decisions.
- [ ] Update [.github/CONTRIBUTING.md](./.github/CONTRIBUTING.md) if contributors need project-specific setup or commands.
- [ ] Review [.github/README.md](./.github/README.md) and make sure the listed GitHub automation still matches the repository.

## 2. Update Ownership and GitHub Settings

- [ ] Replace `@alloveralls` in [.github/CODEOWNERS](./.github/CODEOWNERS) with the correct owner or team.
- [ ] Review PR and Issue templates under [.github](./.github/) and adjust labels, wording, or required fields.
- [ ] Create the labels documented in [.github/labels.md](./.github/labels.md) in the GitHub repository settings.
- [ ] Enable required status checks for `pr-title` and `docs-ci`.
- [ ] Set the repository merge strategy to Squash merge if that is still the intended policy.

## 3. Verify Local Tooling

- [ ] Confirm `jj` and `gh` are installed for local development.
- [ ] Confirm `markdownlint-cli2`, `lychee`, and `typos` are installed if you want local checks to match CI.
- [ ] Run `make docs-check` and fix any failures before opening the first PR.

## 4. Confirm Work Log Operation

- [ ] Use [.work-logs/templates/work-session.md](./.work-logs/templates/work-session.md) for new work sessions.
- [ ] Use [.work-logs/templates/review.md](./.work-logs/templates/review.md) for review records.
- [ ] Make sure `.work-logs/` remains tracked in version control.

## 5. First PR Sanity Check

- [ ] Create a small test PR and confirm the PR template is loaded.
- [ ] Confirm the correct reviewer is suggested by `CODEOWNERS`.
- [ ] Confirm `pr-title` and `docs-ci` both run on GitHub.
- [ ] Confirm the default labels and issue forms appear in the repository UI.

## Notes

- This repository assumes internal development by default.
- Keep template-specific guidance here and move project-specific operational detail into `README.md`, `AGENTS.md`, or `.github/CONTRIBUTING.md`.
