# Architecture & Operating Model

## Purpose

The case study treats FinOps as an operating layer around a multi-service AWS lending platform. The architecture is intentionally focused on cost visibility, engineering controls and safe optimisation rather than application implementation.

```mermaid
flowchart LR
    A[AWS workloads\nEC2 / EKS / RDS / S3 / EFS / ML / Serverless]
    B[Cost & usage signals\nBilling data / CloudWatch / tags]
    C[Inform\nAllocation / budgets / anomalies / unit economics]
    D[Optimise\nRight-size / lifecycle / transfer / commitments / Spot]
    E[Operate\nGovernance / policy-as-code / remediation / reviews]
    F[Leadership\nCFO / CTO / Engineering / Compliance]

    A --> B --> C --> D --> E --> B
    C --> F
    D --> F
    E --> F
```

## Design principles

1. **Compliance is a hard gate.** Cost changes cannot remove required isolation, retention, redundancy or auditability.
2. **Availability is a hard gate.** The 99.95% objective is preserved during optimisation.
3. **Evidence before action.** Usage, performance and ownership data should support production changes.
4. **Automation for repeatability.** Non-production scheduling, guardrails and anomaly routing should not depend on manual memory.
5. **Rollback before rollout.** Production optimisation must have a validation baseline and a reversal path.

## Control flow

`Usage → Cost allocation → Opportunity detection → Validation → Controlled change → Measurement → Governance`

This creates a closed loop rather than a one-time cost exercise.
