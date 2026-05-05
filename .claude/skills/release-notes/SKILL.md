---
name: release-notes
description: Use when preparing release notes from commits, diffs, merged work, or shipped features for engineers, operators, or end users.
---

# Release Notes

Use this skill when the deliverable is a concise, accurate summary of shipped changes and their user or operator impact.

## When to use

- Draft release notes for a version or deployment
- Summarize merged work for internal stakeholders
- Prepare upgrade notes, migration notes, or known issues
- Turn raw diffs or commit history into audience-ready changelog text

## Operating rules

- Derive statements from actual changes, not ticket titles alone
- Write for the requested audience: end users, developers, operators, or mixed
- Highlight user-visible impact before implementation detail
- Explicitly call out breaking changes, migrations, and operational actions
- Keep wording concrete and avoid inflated marketing language

## Workflow

1. Gather the relevant diffs, commits, PR notes, or change descriptions.
2. Group changes by audience impact or functional area.
3. Separate user-visible changes from internal maintenance work.
4. Identify required actions: migrations, configuration changes, rollbacks, deprecations, or known limitations.
5. Draft concise notes with stable verbs and consistent tense.
6. Verify that every important shipped change is either included or intentionally omitted.

## Output requirements

- Start with a short release summary
- Use flat sections only when they improve scanability
- Include breaking changes and required actions in their own clearly labeled section
- Note known issues only when they are actionable or user-relevant
- If source material is incomplete, say what the notes are based on

## Avoid

- Listing internal refactors with no audience impact unless explicitly requested
- Writing vague claims such as "various improvements"
- Hiding breaking changes in a general summary
- Mixing speculative roadmap language into shipped notes
