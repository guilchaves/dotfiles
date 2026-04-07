---
name: generate-fix-doc
description: Generates a standardized markdown document to record a behavioral fix applied to the repository. Output document should be written in English by default.
version: 0.1.0
---

# generate-fix-doc

Expected input (JSON):

{
  "title": "<short title>",
  "issue": "<issue-number-or-empty>",
  "summary": "Short summary of the fix",
  "problem": "Description of the problem before the fix",
  "diagnosis": "How the problem was diagnosed",
  "fix": "Summary of what was changed",
  "files_changed": ["path/to/file1", "path/to/file2"],
  "diff_snippet": "A short diff or patch excerpt that illustrates the change",
  "how_to_test": "Steps to reproduce and validate the fix"
}

Output: a ready-to-save markdown document for `@docs/` with a suggested filename.

Example output should include:

- Title
- Metadata (issue, date, author)
- Problem description
- Diagnosis/Root cause
- Applied solution (summary)
- Representative diff snippet
- How to test / validation steps
