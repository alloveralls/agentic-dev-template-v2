---
name: code-review
description: Use when reviewing code changes for bugs, regressions, design risks, missing tests, or maintainability issues before merge.
---

# Code Review

Use this skill when the task is to review a diff, change set, or implementation for correctness and engineering risk.

## Review priority

Focus on issues that matter before merge:

- Correctness bugs
- Behavioral regressions
- Broken assumptions across module boundaries
- Missing or weak tests for changed behavior
- Design choices that create near-term maintenance or incident risk

## Review rules

- Findings come before summary
- Prefer evidence from code paths, inputs, outputs, and state transitions
- Be explicit about severity and impact
- Distinguish confirmed problems from open questions
- Ignore style-only observations unless they hide a real defect

## Workflow

1. Read the diff and identify the behavior it changes.
2. Trace affected execution paths, including error handling and data flow.
3. Check whether tests cover the changed behavior and failure modes.
4. Look for mismatches between the implementation, surrounding conventions, and likely caller expectations.
5. Produce findings ordered by severity with file and line references when possible.

## Output requirements

- Present findings first
- For each finding, include severity, impacted file, and the concrete problem
- Follow with open questions or assumptions if needed
- Keep the summary brief and secondary
- If no findings are present, state that explicitly and mention any residual test or validation gap

## Avoid

- Leading with compliments or generic overview
- Treating preference debates as defects
- Reporting hypothetical issues without a plausible execution path
- Omitting line references when the location can be identified
