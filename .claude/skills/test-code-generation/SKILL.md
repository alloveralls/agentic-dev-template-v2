---
name: test-code-generation
description: Use when creating or updating automated tests for existing behavior, new features, bug fixes, or regression coverage.
---

# Test Code Generation

Use this skill when the main deliverable is automated tests or when code changes need explicit test coverage.

## When to use

- Add tests for a new feature
- Create regression tests for a bug fix
- Expand coverage around risky logic
- Convert manual scenarios into automated checks

## Operating rules

- Derive tests from actual behavior, not guessed intent
- Prefer the narrowest test level that gives reliable signal
- Cover both success and failure paths when the code has branching behavior
- Keep fixtures and setup minimal so failures stay local and readable
- If behavior is ambiguous, capture the ambiguity clearly instead of inventing a rule

## Workflow

1. Read the production code and existing tests that define the target behavior.
2. Enumerate core scenarios: happy path, edge cases, invalid input, and regressions.
3. Choose the right test layer: unit, integration, API, UI, or end-to-end.
4. Implement tests that make assertions on observable behavior, not incidental internals.
5. Run the relevant test target if possible.
6. Report covered scenarios, omitted scenarios, and any ambiguity in the specification.

## Output requirements

- Name the behavior under test
- State which scenarios were added or updated
- Report the exact verification run, or the reason it was skipped
- Call out gaps when environment limits prevent full coverage

## Avoid

- Snapshot-heavy tests with weak intent
- Mocking away the behavior that actually needs confidence
- Adding brittle assertions tied to logging, timing, or formatting noise
- Claiming coverage without listing the scenarios that were exercised
