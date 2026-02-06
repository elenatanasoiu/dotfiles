---
name: pr-review-assist
description:  Prepare structured PR reviews using a three-phase framework (Context, Analysis, Validation). Use when reviewing pull requests, when user shares a PR URL, or mentions "review PR", "code review", or "check this PR".
allowed-tools:  Bash(gh: *) Read
---

# PR Review Assist

Great code review isn't about catching bugs—it's about building confidence in what ships.  Treat every PR as the beginning of a conversation.

## Prerequisites

- `gh` CLI authenticated
- PR URL or repo/number (e.g., `owner/repo#123`)

## For PR Authors

Before requesting review:  self-review first, leave explanatory comments on non-obvious changes, split large PRs.  Move to draft when addressing feedback.

## Phase 1: Context Before Code

Establish strategic foundation *before* looking at diffs.

```bash
gh pr view <number> --json title,body,author,files,additions,deletions,baseRefName,headRefName,labels
```

### Business Context

- Who initiated this and why now?
- Which users/systems does this impact?
- What problem does this solve?
- How does this align with priorities?

### Technical Context

- What's the blast radius if this fails?
- Are there dependencies or sequencing needs?
- Does this require cross-team coordination?
- What validation environments exist?

## Phase 2: Systematic Analysis

### Scope & Structure

- Is the PR appropriately sized?
- Are changes cohesive or should this be split?
- Do file changes align with stated intent?

### Quality Analysis

| Aspect | Key Questions |
|--------|---------------|
| **Intent** | Does code match PR description? |
| **Correctness** | Edge cases, null handling, logic errors?  |
| **Security** | Input validation, auth, data exposure? |
| **Performance** | N+1 queries, loops, memory?  |
| **Accessibility** | Keyboard, alt text, ARIA?  |
| **Testing** | Coverage gaps?  |
| **Patterns** | Follows repo conventions? |

### Related Context

Optionally search your local notes or documentation for related context:

```bash
# Customize these paths to your own notes/docs directory
grep -r "<keywords>" "<your-notes-directory>/"
```

## Phase 3: Validation

See [review-checklist.md](references/review-checklist.md) for detailed verification steps.

**Mindset**: Trust your team.  Preferences (💅) don't block; only true blockers (🟡) that would break prod or harm users.

**Actions**:
- **Approve**: Ships safely
- **Request Changes** (🟡): Blockers only
- **Comment** (🙋): Need answers first

**After**:  Respond to replies, react with emoji, link back in follow-ups.

## Output

```markdown
## PR Review:  <title>

**PR**:  <url> | **Author**: @<author> | **Files**: <count>

### Context
[Why now, impact, blast radius]

### Analysis
[Approach assessment, observations with file: line refs]

### Recommendation
[Approve/Request Changes/Comment] — [rationale]
```

## Example Usage

"Review this PR:  https://github.com/org/repo/pull/123"
"Help me review #1642"

## Inspiration

- https://elenatanasoiu.com/posts/2025/06/02/how-i-approach-code-review/
- https://github.blog/developer-skills/github/how-to-review-code-effectively-a-github-staff-engineers-philosophy/
