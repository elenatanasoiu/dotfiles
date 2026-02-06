---
name: start-work
description: Start new work on an issue with discovery, worktree/branch setup, TDD workflow, and draft PR creation. Use when beginning work on a GitHub issue.
---

# Start Work

When starting work on a new issue, follow this complete workflow from discovery to draft PR.

## Step 0: Discovery & Research

Before creating any branches or worktrees, gather context:

1. **Fetch Issue Details**
   - Get the issue number if not provided
   - Retrieve issue title, description, labels, and acceptance criteria
   - Identify linked issues, PRs, or related discussions

2. **Codebase Analysis**
   - Search for relevant files mentioned in the issue
   - Identify files that will likely need changes
   - Find existing tests related to the affected code
   - Review recent commits touching the same areas

3. **Pattern Recognition**
   - Look for similar issues or PRs in the repository history
   - Identify architectural patterns used in similar features
   - Check for existing conventions or best practices in the codebase

4. **Scope Clarification**
   - Summarize your understanding of the work
   - Ask the user to confirm or clarify before proceeding
   - Flag any ambiguities or missing information

## Step 1: Setup

Once discovery is complete and scope is confirmed:

1. **Create Worktree or Branch**
   - Ask user preference: worktree or branch?
   - **Naming convention:** `elenatanasoiu/{issue-number}-short-description`
     - Example: `elenatanasoiu/42-fix-auth-bug`
     - Short description should be kebab-case, 2-4 words max
   - For worktree: create in `../worktrees/{branch-name}/`
   - For branch: create and checkout locally

2. **Verify Setup**
   - Confirm clean working directory
   - Show current branch/worktree path

## Step 2: TDD Implementation

Follow test-driven development with linting checkpoints:

1. **Write Failing Tests First**
   - Create or update test files based on requirements
   - Run tests to confirm they fail
   - Commit: `test: add tests for [feature]`
   - **Lint before committing:** Run project linter to catch issues early

2. **Implement Until Tests Pass**
   - Write minimal code to make tests pass
   - Run tests frequently
   - Commit when a logical unit is complete: `feat: implement [feature]`
   - **Lint before committing:** Ensure code style compliance

3. **Refactor & Improve**
   - Clean up implementation
   - Improve naming, structure, or performance
   - Ensure tests still pass
   - Commit: `refactor: [improvement]`
   - **Lint before committing:** Validate refactoring

4. **Checkpoint Commits**
   - Make semantic commits at each meaningful step
   - Keep commits focused and atomic
   - Run linter before each commit to maintain quality

**Semantic Commit Format:**
- `test:` for test changes
- `feat:` for new features
- `fix:` for bug fixes
- `refactor:` for code improvements without behavior changes
- `docs:` for documentation only
- `chore:` for build, config, or dependency updates

## Step 3: Completion

Before pushing, ensure quality:

1. **Final Quality Checks**
   - Run full test suite
   - **Run linter one final time:** Catch any remaining issues
   - Fix any linting errors or warnings
   - Ensure all tests pass

2. **Commit Final Changes**
   - If lint fixes were needed: `chore: fix linting issues`
   - Ensure working directory is clean

3. **Push to Remote**
   - Push branch to origin
   - Confirm push succeeded

## Step 4: Draft Pull Request

Create a draft PR with proper context:

1. **PR Title**
   - Use the issue title or a clear summary
   - Example: "Fix authentication redirect loop"

2. **PR Body**
   - Start with: `Closes #{issue-number}`
   - Add a brief summary of changes
   - Include any testing notes or considerations
   - Mention any breaking changes or dependencies

3. **Mark as Draft**
   - Create as draft PR initially
   - Link the PR URL to the user

4. **Handoff**
   - Confirm PR is created and linked to issue
   - Ask if user wants to:
     - Continue with more work
     - Convert to ready for review
     - Make additional changes

## Related Skills

This skill works well with:
- **conventional-commits**: For commit message guidance
- **pr-review-assist**: For pre-push self-review

## Notes

- Always lint before commits to catch issues early
- Use discovery phase to prevent rework later
- Keep commits atomic and focused
- TDD ensures reliable, testable code
