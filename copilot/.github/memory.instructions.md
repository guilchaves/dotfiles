# Project Conventions

These rules define how contributors and agents should operate within this repository.

---

## Language

- All documentation under `docs/` must be written in **Brazilian Portuguese**.
- All pull requests must be written in **Brazilian Portuguese**.
- All commits must be written in **Brazilian Portuguese**.
- All branch names must be written in **Brazilian Portuguese**.

---

## Git Conventions

### Branching (Gitflow)

- Use prefixes:
  - `feat/`
  - `fix/`
  - `chore/`
  - `hotfix/`

- Format:

<tipo>/<descricao-em-kebab-case>


- Example:

feat/adicionar-login
fix/corrigir-token-expirado


- Include issue number when available:

feat/123-adicionar-login


---

## Commits

- Follow **Conventional Commits**
- Write in **Brazilian Portuguese**

Format:

<tipo>(<escopo>): descrição curta no imperativo


Examples:

feat(auth): adicionar autenticação com jwt
fix(api): corrigir erro de timeout


Rules:
- lowercase
- no trailing period
- concise and clear

---

## Pull Requests

- Must be written in **Brazilian Portuguese**
- Keep PRs small and focused

Include:
- objetivo
- impacto
- passos de validação
- riscos
- rollback (se aplicável)

- Link the related issue when available

## Documentation Convention

- The only allowed location for agent-generated Markdown documentation is the repository root `docs/` directory.
- Do not create or move documentation into `app/docs`, `api/docs`, `ai/docs`, `web/docs`, or other nested documentation folders unless explicitly requested by the user.
- When documenting a specific app, keep the file in root `docs/` and use a filename prefix to indicate ownership, for example:
  - `docs/app-login-bug.md`
  - `docs/api-token-refresh-fix.md`
  - `docs/ai-rate-limit-analysis.md`
  - `docs/web-landing-copy-update.md`
