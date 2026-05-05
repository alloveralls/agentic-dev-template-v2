---
name: coding
description: Use when implementing or changing application code, refactoring behavior, or wiring features end to end in an existing codebase.
---

# Coding

Use this skill when the task requires actual code changes, not just analysis.

## When to use

- Add a feature or complete part of one
- Fix a bug or regression
- Refactor code while preserving behavior
- Integrate multiple modules, services, or APIs

## Operating rules

- Read the relevant code before proposing structure changes
- Match existing architecture, naming, and error-handling patterns unless there is a concrete reason to improve them
- Prefer small, testable edits over broad rewrites
- Preserve user changes and unrelated local modifications
- Use `jj` for version control operations in this repository

## Workflow

1. Identify the exact behavior to change and the files that own it.
2. Trace inputs, outputs, side effects, and failure modes before editing.
3. Implement the smallest coherent change that solves the task end to end.
4. Update or add tests when behavior changes or bug fixes need protection.
5. Run the narrowest useful verification available.
6. Summarize what changed, what was verified, and any remaining risk.

## Output requirements

- State the solution first
- Name the key files changed
- Report verification that was run, or explicitly state what could not be run
- Call out assumptions, migrations, or follow-up work only when they materially matter

## Avoid

- Rewriting working code without a concrete payoff
- Introducing new abstractions before the existing shape is understood
- Leaving behavior changes untested when tests are feasible
- Reporting only intent without implementing the code
