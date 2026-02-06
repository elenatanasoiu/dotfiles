# Review Checklist

Quick reference for PR review validation steps.

---

## Finding PRs to Review

```bash
gh pr list --search "is:open -is:draft review:none org:<org>"
gh pr list --search "is:open -is:draft team-review-requested:<org>/<team>"
```

---

## Analysis Checklists

### Scope & Structure
- [ ] Appropriately sized (reviewable in one session)
- [ ] Changes are cohesive (single concern)
- [ ] No unrelated changes bundled

### Correctness
- [ ] Code does what PR claims
- [ ] Edge cases handled (null, empty, boundaries)
- [ ] Error handling appropriate
- [ ] Async operations awaited
- [ ] State mutations intentional

### Security
- [ ] Input validated/sanitized
- [ ] Auth/authz checks in place
- [ ] No secrets in code/logs
- [ ] Injection vectors addressed (SQL, XSS, CSRF)

### Performance
- [ ] No N+1 queries
- [ ] Large datasets paginated
- [ ] Expensive ops cached/deferred
- [ ] No memory leaks

### Accessibility
- [ ] Keyboard accessible
- [ ] Images have alt text
- [ ] ARIA labels appropriate
- [ ] Color not sole indicator

### Testing
- [ ] New code has tests
- [ ] Happy path + error cases covered
- [ ] Tests deterministic

---

## Validation Checklist

- [ ] Reproduced original issue (if bug fix)
- [ ] Verified in staging/preview
- [ ] Testing instructions clear
- [ ] Automated tests pass
- [ ] No unintended side effects
- [ ] Confident this ships safely

---

## Comment Templates

| Emoji | Type | Use When |
|-------|------|----------|
| 💅 | Non-blocking | Style preference, optional |
| 🙋 | Question | Need clarification |
| 🟡 | Blocking | Must fix before merge |
| ✨ | Affirmation | Recognize good work |

```
💅 Consider [alternative].  Feel free to address in follow-up.

🙋 Could you clarify [observation]? Expected [expectation].

🟡 Needs fix before merge: [issue].  Suggest: [fix].

✨ Nice work on [thing]—makes this [benefit].
```

---

## Communication

**During**: Reference repo patterns, give concrete examples, distinguish 💅 from 🟡.

**After**: Respond to replies, react with emoji, acknowledge when feedback addressed.

**Follow-ups**: Link back to original comments, tag reviewer.

---

## Risk Levels

| Risk | Examples |
|------|----------|
| **Low** | Typos, docs, tests only, isolated changes |
| **Medium** | New features with tests, refactors with coverage |
| **High** | Auth changes, payments, data deletion, schema changes |
