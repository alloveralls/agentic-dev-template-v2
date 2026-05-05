---
name: security-review
description: Use when reviewing code or design changes for authentication, authorization, input handling, data exposure, dependency, or abuse-path risks.
---

# Security Review

Use this skill when the task is to identify security-relevant weaknesses in code, architecture, configuration, or operational behavior.

## Review areas

- Authentication and session handling
- Authorization and privilege boundaries
- Input validation and output encoding
- Secret handling and sensitive data exposure
- Injection, deserialization, file access, and command execution risks
- Dependency and configuration risks
- Logging, monitoring, and audit gaps that weaken incident response

## Review rules

- Model attacker-controlled input and privilege boundaries first
- Prefer concrete exploit paths over generic checklist output
- Separate exploitable issues from hardening suggestions
- Note required preconditions for each issue
- Call out where security confidence is limited by missing context or unrun tests

## Workflow

1. Identify entry points, trust boundaries, and sensitive operations.
2. Trace how untrusted data flows through validation, storage, authorization, and side effects.
3. Check whether secrets, tokens, PII, or internal state can leak through responses, logs, or metrics.
4. Review dangerous capabilities such as shell access, file access, SSRF paths, dynamic evaluation, or unsafe crypto usage.
5. Inspect dependencies and configuration choices when they materially affect exposure.
6. Report issues by severity, exploitability, impact, and required conditions.

## Output requirements

- Present findings first, ordered by severity
- For each finding, include the attack path, impact, and affected file or component
- Distinguish `must fix before merge` from `hardening recommended`
- Mention validation gaps if the review could not verify runtime behavior

## Avoid

- Producing a generic OWASP summary detached from the code
- Labeling every missing best practice as a vulnerability
- Ignoring privilege escalation or cross-tenant risks because they are indirect
- Hiding uncertainty about exploitability
