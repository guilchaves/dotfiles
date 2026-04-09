# Copilot Instructions

These instructions define how Copilot CLI agents should operate in this repository.

---

## Core Principles

- Always understand context before making changes.
- Inspect the codebase and the owning app before editing.
- Prefer existing patterns and make the smallest safe change.
- Avoid unnecessary abstractions and unrelated refactors.

---

## Agent Workflow

- Use the **orchestrator** for multi-step or cross-file changes.
- The orchestrator must:
  - delegate planning to the planner
  - split work into phases
  - assign tasks to coder and designer
- Do not skip planning for non-trivial tasks.

---

## Scope and Priority

- Follow app-specific instructions before global ones.
- If instructions conflict, stop and ask for clarification.
- Do not duplicate rules already defined in app-specific documentation.

---

## Multi-App Work

- Identify the source of truth and the primary app.
- Explicitly state cross-app dependencies before making changes.
- Do not move responsibilities across apps without clear justification.

---

## Execution

- For non-trivial changes:
  - summarize the approach before editing
  - confirm assumptions when needed

- For large or risky changes:
  - break work into steps
  - execute incrementally

- Ask before:
  - broad refactors
  - architectural changes
  - cross-cutting modifications

---

## File Discipline

- Scope changes to specific files whenever possible.
- Avoid overlapping edits across parallel tasks.
- Prefer coherent file-level edits over scattered small changes.

---

## Documentation Scope

- `docs/` always means the repository root `docs/` folder.
- This is the only approved location for agent-generated Markdown documentation.
- Never create Markdown files in nested folders like `app/docs/`, `api/docs/`, `ai/docs/`, or `web/docs/`.
- For app-specific documentation, keep the file in root `docs/` and prefix the filename with the app name.
- Create Markdown outside root `docs/` only if the user explicitly requests it.

---

## Automatic Fix Documentation

When applying a behavioral change, the agent must:

1. Create a markdown file under the repository root `docs/` directory.
2. Never place this file inside app-specific folders or nested `docs/` folders.
3. Include:
   - description of the issue
   - why the change was necessary
   - summary of the fix
4. Include:
   - a `diff` block or
   - a code snippet highlighting the main change
5. Paste the markdown content into the PR description and reference the file.

---

## Validation

- Run the smallest relevant checks:
  - targeted lint
  - unit tests
  - type checks
  - minimal build steps

- Prefer fast, focused validation over full test suites.

- If validation cannot be completed:
  - explicitly state what was not verified
  - explain why

---

## Security

- Never commit:
  - secrets
  - tokens
  - `.env` files
  - sensitive logs

- Use:
  - environment variables
  - encrypted secrets
  - secret managers

---

## Communication

- Be concise and structured.
- Explicitly state assumptions.
- Report only what was verified.
- Clearly list remaining risks.
