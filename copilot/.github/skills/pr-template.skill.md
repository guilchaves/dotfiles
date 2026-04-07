---
name: pr-template
description: Generates a standardized Pull Request body and optionally includes `@docs/` correction file content. Output should be written in English by default.
version: 0.1.0
---

# pr-template

Input (JSON):
{
  "title": "<PR title>",
  "summary": "Short summary of the PR",
  "impact": "What changes / high-level impact",
  "how_to_test": "Steps to validate",
  "docs_path": "@docs/file.md" (optional)
}

Output: a PR body formatted in English by default, following repo rules and including the content of `docs_path` if provided.
