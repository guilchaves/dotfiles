# Agents Overview

This repository uses a lightweight multi-agent workflow inspired by Ultralight, adapted for GitHub Copilot CLI.

Agents are defined in `.github/agents/` and are designed to work together through a delegated orchestration model.

---

## Available Agents

### 🧠 Orchestrator (entry point)

**File:** `orchestrator.agent.md`  
**Model:** Claude Opus 4.6  
**User-invocable:** ✅ Yes  

The orchestrator is the main entry point for complex tasks.

**Responsibilities:**
- Break down user requests into structured tasks
- Delegate work to planner, coder, and designer
- Manage execution order and parallelization
- Aggregate and verify results

**When to use:**
- Multi-step features
- Refactors across multiple files
- Anything requiring planning + implementation + design

---

### 📋 Planner

**File:** `planner.agent.md`  
**Model:** GPT-5.4  
**User-invocable:** ❌ No (internal)

Creates structured, file-aware implementation plans.

**Responsibilities:**
- Analyze codebase and requirements
- Identify constraints and assumptions
- Break work into phases
- Define file-level changes
- Highlight risks and edge cases

**When it is used:**
- Always first step in orchestrated workflows

---

### 💻 Coder

**File:** `coder.agent.md`  
**Model:** GPT-5.3-Codex  
**User-invocable:** ❌ No (internal)

Implements code changes with strict engineering discipline.

**Responsibilities:**
- Write and modify code
- Fix bugs
- Follow repository patterns
- Keep changes scoped and deterministic

**Strengths:**
- Code correctness
- Refactoring
- Implementation clarity

---

### 🎨 Designer

**File:** `designer.agent.md`  
**Model:** Gemini 3.1 Pro (Preview)  
**User-invocable:** ❌ No (internal)

Handles UI/UX and visual design decisions.

**Responsibilities:**
- Improve usability and flows
- Maintain design consistency
- Extend existing design system (not reinvent it)
- Ensure accessibility and clarity

**Key rule:**
> Always follow the existing design language before introducing new patterns.

---

## How the System Works

The workflow is **orchestrator-driven**:

1. Orchestrator receives the request
2. Orchestrator calls Planner → produces structured plan
3. Orchestrator splits work into phases
4. Tasks are delegated to:
   - Designer (for UI/UX decisions)
   - Coder (for implementation)
5. Orchestrator verifies and summarizes results

---

## Execution Model

### Parallel vs Sequential Work

- Tasks touching different files → can run in parallel
- Tasks touching the same file → must be sequential
- Design tasks should precede dependent implementation tasks

-

