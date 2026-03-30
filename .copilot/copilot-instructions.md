# Copilot Instructions

These instructions apply to the entire repository and all applications within it.

## General Principles

- Always understand the context before making changes
- Identify which application is responsible for the requested change
- Prefer existing patterns over introducing new ones
- Keep solutions simple, clear, and maintainable
- Avoid unnecessary abstractions

## Multi-Application Awareness

- Determine the **source of truth** for the feature or logic
- Avoid duplicating logic across applications
- Do not move responsibilities between applications without clear justification
- When multiple applications are involved:
  - Explicitly state which app is primary
  - Identify dependent applications
  - Define execution and rollout order

## Code Changes

- Make minimal, scoped changes
- Do not modify unrelated parts of the codebase
- Follow conventions already used in each application
- Do not introduce new dependencies unless necessary

## Planning & Execution

- For non-trivial changes:
  - Explain the approach before implementing
  - Break down the work into steps
- For large changes:
  - Identify risks and edge cases
  - Consider impact on other applications

## Validation

- Ensure the implementation satisfies the original request
- Consider edge cases and failure scenarios
- Verify that changes do not break existing behavior
- When relevant, describe how the solution could be tested

## Communication

- Be concise and structured
- Clearly explain decisions and trade-offs
- Highlight assumptions when they exist