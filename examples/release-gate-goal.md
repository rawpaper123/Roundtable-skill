# Example: Release Gate Goal

```text
Use Roundtable Skill for this release gate.

Project: <path>
Goal: verify the hosted staging API before merging the release PR.
Constraints:
- no product code changes unless a blocker is proven
- no secrets in logs
- no database downgrade
- report rollback steps

Assign dynamic expert angles:
- runtime/release reliability
- data integrity
- security/privacy
- operations runbook clarity

If an expert has no actionable concern, they must reply no opinion.
```
