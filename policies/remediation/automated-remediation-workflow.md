# Automated Remediation Workflow Design

## Objective

Turn AWS Config findings into controlled, auditable remediation workflows without creating automatic production changes that could violate PCI DSS, SOC 2, RBI controls, GDPR requirements, or the 99.95% service objective.

## Architecture

```text
AWS Config Rule
      |
      v
EventBridge / Config finding event
      |
      v
Remediation Router Lambda
  |       |        |        |
  |       |        |        +--> Weekly Compliance Summary
  |       |        +-----------> JIRA Ticket
  |       +--------------------> Slack Notification
  +----------------------------> Safe Auto-Tag Lambda
                                      |
                                      v
                               CloudTrail / DynamoDB audit record
```

## Workflow A — Auto-tag safe defaults

1. Config marks a resource NON_COMPLIANT.
2. EventBridge routes the finding to the remediation router.
3. Lambda looks up owner/account/service defaults.
4. If a deterministic value exists, apply only approved default tags.
5. Re-evaluate the Config rule.
6. Record before/after state, actor, timestamp, finding ID, and remediation result.
7. If the value cannot be derived safely, do not mutate the resource; create a JIRA ticket.

Examples of safe defaults:
- `business_unit` from account OU mapping.
- `environment` from account/workload mapping.
- `created_by` from provisioning role.
- `team` from an approved resource-to-owner mapping.

## Workflow B — Slack notification

Send a compact notification containing:
- Config rule
- Resource ID/type
- Owner/team
- Severity
- Required action
- JIRA ticket ID, if created
- Link to the AWS Config finding

Do not include customer PII, loan documents, payment data, credentials, or sensitive payloads in Slack.

## Workflow C — JIRA ticket

Create a ticket for manual remediation when:
- the resource is production;
- remediation could affect availability;
- compliance approval is required;
- no safe default tag exists;
- a security group exception is ambiguous;
- S3 retention/legal-hold status is unclear.

Required fields:
`resource_id`, `resource_type`, `account`, `region`, `config_rule`, `owner`, `severity`, `finding_time`, `recommended_action`, `due_date`, `compliance_scope`.

## Workflow D — Weekly compliance report

Every Monday at 09:00 IST:
1. Query AWS Config compliance by rule/resource.
2. Aggregate compliant/non-compliant counts.
3. Calculate tag compliance %, open remediation count, aged findings, and rule-level trend.
4. Identify top owning teams and highest-risk findings.
5. Publish to the FinOps/Compliance reporting location and notify stakeholders.

## Controls

- Least-privilege IAM for every Lambda.
- No automatic deletion/termination of production resources.
- Idempotency keys to prevent duplicate actions.
- Dead-letter queue for failed events.
- CloudWatch logs and metrics.
- CloudTrail audit trail for mutations.
- Manual approval for regulated or production changes.
- Rollback/compensating action documented per remediation type.

## Target SLAs

| Finding | Initial notification | Ticket target | Escalation |
|---|---:|---:|---|
| Critical/security | 15 min | 4 h | Security + Compliance |
| High/production cost | 1 h | 1 business day | Engineering manager |
| Medium | 4 h | 3 business days | Team owner |
| Low | 24 h | 5 business days | FinOps review |

## Failure handling

If Lambda fails, send the event to a DLQ and alert the FinOps platform owner. Do not silently mark a resource compliant. Reconciliation runs daily to detect missed events.
