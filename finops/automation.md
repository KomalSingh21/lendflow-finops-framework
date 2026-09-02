# FinOps Automation

## Automation catalogue

| Automation | Trigger | Action | Safety boundary |
|---|---|---|---|
| Non-production scaling | Schedule | Scale down/up outside working windows | Non-production only |
| Anomaly routing | Cost/metric signal | Route to owner and FinOps | No destructive action by default |
| Tag compliance | Config evaluation | Report or safely remediate | Ownership and protected-resource checks |
| Terraform cost gate | Pull request | Show estimated cost impact | Review required for threshold breach |
| Autoscaling | Metrics/backlog | Adjust capacity | Min/max limits and cooldowns |
| Policy guardrails | Resource/API request | Deny disallowed patterns | Explicit approved exceptions |

## Autoscaling design

Six service patterns were considered using request rate, CPU, queue backlog, queue age and latency. Production services have minimum capacity floors and conservative scale-in windows. Payment processing is intentionally more conservative and avoids Spot dependency.

## Remediation principles

1. Prefer prevention over correction.
2. Use reversible actions first.
3. Exclude regulated or protected resources from automatic destructive actions.
4. Require ownership metadata for cleanup.
5. Record every remediation action for auditability.
6. Validate service health after changes.
7. Provide rollback or restore instructions.

The actual policy examples are under [`../policies/`](../policies/).
