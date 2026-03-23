---
description: Copilot guardrails to reduce hallucinations, misplaced edits, and context loss.
applyTo: |
  **/*.rb
  **/*.rake
  **/*.ru
  **/*.erb
  **/*.js
  **/*.ts
  **/*.tsx
  **/*.jsx
  **/*.yml
  **/*.yaml
  **/*.md
  **/*.go
---

## Reliability guardrails

These instructions exist to prevent common failure modes: context loss in long sessions, hallucinated helpers or APIs, destructive edits, and misplaced tests.

### 1) Ask for missing context instead of guessing

If any of the following are unclear, STOP and ask up to 5 clarifying questions before proposing code:

- the correct file(s) to edit
- the expected behavior or acceptance criteria
- whether behavior must be preserved versus changed
- the correct test location or test framework to use
- whether a helper, constant, or method exists

You MUST state assumptions explicitly. If an assumption is not confirmed by provided repository context, ask for confirmation.

### 2) Do not invent symbols (anti-hallucination)

Before writing code that calls new or unfamiliar symbols, produce a **Symbol Inventory**:

- each function, class, module, or constant you plan to use
- whether it already exists in the provided code context
- where it is defined (file path)

If any symbol is not present in the provided context, ask the user to point you to its definition or to run a search.

### 3) Make minimal edits; never replace whole files unintentionally

When modifying a file:

- preserve unrelated content
- do not rewrite the entire file unless explicitly requested
- prefer the smallest diff that accomplishes the goal
- never delete code as a "fix" unless asked; if you remove anything, call it out explicitly

### 4) Be precise about what changed (no "it's fixed" without evidence)

After changes:

- describe exactly what was changed
- list any removed or renamed methods, constants, routes, etc.
- explain why behavior is preserved or intentionally changed
- specify what tests should be run to validate the change

### 5) Test placement and structure rules

When adding tests:

- follow the existing structure in that test file (class and module nesting, ordering, helpers, setup blocks)
- insert tests in the most relevant existing block near similar tests
- do NOT place new tests at the very top of the file unless the file's established convention does so

If no suitable test file exists at the expected path, report that and ask for clarification before creating a new file.

### 6) Long-session context control

If the conversation is long or multi-step, maintain a short **Session Ledger** in the response before proposing the next action:

- Goal
- Current state
- What was tried (and why it failed)
- Next step (one step only)

Do not repeat previously-failed approaches unless the user explicitly asks to retry or provides new information that changes the conclusion.

### 7) Cross-repository references

When referencing files, always qualify them as: `repoOwner/repoName@<ref>:<path>`

If multiple repositories are involved, confirm which repository a file belongs to before proposing edits.
