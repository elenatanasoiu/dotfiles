# GitHub Copilot Skills Guide

## What Are Skills?

**Skills** are custom instructions that teach GitHub Copilot (or Claude) how to perform specific workflows. Think of them as specialized "modes" that activate automatically based on your context.

## How Skills Work

### Structure
```
.github/skills/
└── skill-name/
    ├── SKILL.md          # Main instruction file
    └── references/       # Optional supporting files
        └── checklist.md
```

### YAML Frontmatter
Every SKILL.md starts with metadata:

```yaml
---
name: skill-name
description: When this skill activates and what it does
allowed-tools: Bash, Read, Grep  # Optional: restrict tool usage
---
```

### Activation
Skills activate automatically when:
- You mention keywords in the description
- You explicitly reference the skill name
- The context matches the skill's purpose

## Your Three Skills

### 1. **conventional-commits**
**When it activates:** When you say "commit", "git commit", or want to save changes

**What it does:**
- Checks your staged changes with `git diff`
- Analyzes what type of change you made (feat, fix, docs, etc.)
- Generates a properly formatted commit message
- Always includes a Claude Code footer

**Try it:**
```
"Help me commit these changes"
"Create a commit message for this"
```

### 2. **start-work**
**When it activates:** When you mention starting work on an issue

**What it does:**
1. **Discovery** - Researches the issue, finds relevant code
2. **Setup** - Creates a branch/worktree with proper naming
3. **TDD** - Guides you through test-driven development
4. **PR** - Creates a draft pull request

**Try it:**
```
"Start work on issue #42"
"I need to work on fixing the auth bug"
```

### 3. **pr-review-assist**
**When it activates:** When you share a PR URL or say "review PR"

**What it does:**
- Uses `gh` CLI to fetch PR details
- Analyzes: business context, technical impact, code quality
- Provides structured review with emojis:
  - 💅 Non-blocking suggestion
  - 🙋 Question
  - 🟡 Blocking issue
  - ✨ Nice work!

**Try it:**
```
"Review this PR: https://github.com/owner/repo/pull/123"
"Help me review #456"
```

## How to Use Skills

### Manual Invocation
You can explicitly mention the skill:
```
"Use the start-work skill for issue #10"
"Run the pr-review-assist skill on this PR"
```

### Automatic Activation
Just describe what you want naturally:
```
"I want to commit these changes" → conventional-commits activates
"Let's start on issue #5" → start-work activates
"Can you review this PR?" → pr-review-assist activates
```

### Check What's Available
In VS Code with Copilot:
1. Open Command Palette (Cmd+Shift+P)
2. Search for "Copilot"
3. Look for skill-related commands

## Practical Examples

### Example 1: Making a Commit
**You:** "I've fixed the login bug, help me commit"

**Copilot (using conventional-commits):**
1. Runs `git diff --staged`
2. Sees changes in auth.js
3. Suggests:
```bash
git commit -m "$(cat <<'EOF'
fix(auth): correct redirect loop on login

Previously redirected indefinitely when session expired.
Now properly redirects to login page.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
EOF
)"
```

### Example 2: Starting Work
**You:** "Start work on issue #15 - add dark mode"

**Copilot (using start-work):**
1. **Discovery:** Fetches issue details, searches for theme-related code
2. **Asks:** "I found existing theme system in `src/styles/theme.js`. Should I create branch or worktree?"
3. **Setup:** Creates `elenatanasoiu/15-add-dark-mode` branch
4. **TDD:** Guides you to write tests first, then implementation
5. **PR:** Creates draft PR when ready

### Example 3: Reviewing a PR
**You:** "Review https://github.com/myorg/repo/pull/42"

**Copilot (using pr-review-assist):**
1. Runs `gh pr view 42 --json ...`
2. Analyzes context, changes, risk
3. Provides structured review:

```markdown
## PR Review: Add user authentication

**PR**: #42 | **Author**: @jane | **Files**: 12

### Context
Implements JWT-based auth for API. High impact - affects all endpoints.
Blast radius: Authentication failure would break entire app.

### Analysis
✨ Nice work on comprehensive test coverage
🙋 Could you clarify session timeout behavior? Expected 24hrs but saw 1hr
🟡 Missing rate limiting on /auth/login endpoint - security risk

### Recommendation
Request Changes (🟡) — Add rate limiting before merge
```

## Tips & Best Practices

### 1. Let Skills Chain Together
Skills work well in sequence:
```
start-work → (you code) → conventional-commits → pr-review-assist
```

### 2. Customize for Your Workflow
Edit the SKILL.md files to match your team's conventions:
- Branch naming patterns
- Commit message formats
- Review criteria

### 3. Skills Remember Context
Within a conversation, skills maintain context. You can say:
```
"Use start-work for issue #5"
... (work happens) ...
"Now create a commit"  ← conventional-commits already knows what you're working on
```

### 4. Override When Needed
Skills are guidelines, not rules:
```
"Create a commit but skip the footer"
"Review this PR but focus only on performance"
```

## Troubleshooting

### Skill Not Activating?
- **Be explicit:** "Use the [skill-name] skill"
- **Check the trigger words:** Look at the `description` in the YAML frontmatter
- **Reload:** Sometimes VS Code needs a reload

### Wrong Skill Activating?
- **Be more specific:** Instead of "help me", say "help me commit" or "help me review"
- **Override:** "Don't use [skill-name], instead..."

### Want to Disable a Skill?
- Delete or rename the SKILL.md file
- Or move it outside `.github/skills/`

## Next Steps

### Try Them Out
1. Make a change to a file
2. Say: "Help me commit these changes"
3. Watch conventional-commits in action!

### Explore elenatanasoiu's Other Skills
His repo has more skills you might find useful:
- **interview** - Deep discovery interviews
- **engineering-brief** - Project planning
- **venture-feasibility** - Business validation

### Create Your Own
Skills are just markdown files! You can create custom ones for your workflow:
```yaml
---
name: deploy-checklist
description: Run pre-deployment checklist
---

# Deployment Checklist
1. Run tests
2. Check environment variables
3. ...
```

## Resources

- [elenatanasoiu's dotfiles](https://github.com/elenatanasoiu/dotfiles) - More skill examples
- [Conventional Commits](https://www.conventionalcommits.org/) - Commit message spec
- [GitHub CLI](https://cli.github.com/) - Required for pr-review-assist

---

**Remember:** Skills are your personal automation. Customize them to fit how YOU work!
