# LendFlow Technologies — FinOps Cost Optimisation

**A portfolio case study in AWS cost visibility, optimisation, governance, automation and executive financial decision-making.**

> **Case study:** LendFlow Technologies is fictional and all financial, workload and usage data in this repository is synthetic/illustrative.

## Project Overview

LendFlow Technologies operates a lending platform on AWS with more than 500,000 loan applications per month across 12 microservices. Monthly AWS spend increased from **$50,000 in January 2026 to approximately $180,000 in June 2026** while the business required continued reliability, security, auditability and regulatory compliance.

The case study applies the FinOps lifecycle **Inform → Optimise → Operate** to move from cost visibility to engineering action and then to controls that prevent recurring waste.

## Business Problem

The business objective was to identify at least **$60,000/month** of sustainable savings within 90 days without reducing the **99.95% availability objective** or violating PCI DSS, SOC 2, RBI IT Framework or GDPR-related constraints.

The engineering challenge was not simply to find cheaper resources. Recommendations had to be evaluated against performance, availability, data locality, auditability, ownership, implementation risk and reversibility.

## Objectives

- Establish a defensible AWS cost baseline.
- Identify and quantify the strongest optimisation opportunities.
- Separate expected savings from conditional and scenario-based opportunities.
- Design governance that connects cloud spend to owners and budgets.
- Automate safe, repeatable cost controls.
- Provide engineering and executive dashboards.
- Preserve compliance and operational guardrails.
- Make remaining uncertainty visible instead of inventing precision.

## Baseline

| Metric | Value |
|---|---:|
| January 2026 AWS spend | $50,000/month |
| June 2026 AWS spend | $180,000/month |
| CFO savings objective | $60,000/month |
| Expected modelled savings | $51,677.71/month |
| Expected annualised run-rate | $620,132.52/year |
| Expected gap to target | $8,322.29/month |
| Worst-case model | $31,375.79/month |
| Best-case model | $53,903.64/month |

The model **does not claim that the $60,000 target has been achieved**. The remaining gap is intentionally retained because the available evidence does not support additional savings claims with sufficient confidence.

## FinOps Strategy

### Inform

Create visibility and allocation using billing data, service-level analysis, tagging, anomaly detection, budget views, unit economics and executive reporting.

### Optimise

Prioritise usage and rate optimisation: EC2 right-sizing, storage lifecycle changes, data-transfer reduction, database scenarios, commitment coverage and suitable Spot workloads.

### Operate

Sustain gains with ownership, budgets, anomaly routing, policy-as-code, automated remediation, scheduled non-production scaling and recurring FinOps reviews.

**Lifecycle:** `Inform → Optimise → Operate → repeat`

## Cost Optimisation Opportunities

| Workstream | Expected monthly model | Confidence / status |
|---|---:|---|
| Data-transfer optimisation | **$30,574.46** | Modelled opportunity |
| EC2 right-sizing | **$9,032.50** | High-confidence candidate analysis |
| Storage lifecycle optimisation | **$5,549.01** | Modelled opportunity |
| Database optimisation | **$5,840.42** | Conditional; Aurora Serverless scenario |
| Spot workloads | **$508.81** | Workload suitability required |
| RI / Savings Plans | **$172.51** | Planning assumption; pricing validation required |
| **Expected total** | **$51,677.71/month** | Consolidated expected case |

The database alternatives are mutually exclusive. The expected model uses the Aurora Serverless scenario; RDS right-sizing is retained as an alternative at **$4,672.34/month**.

## Savings Model

The financial model separates:

- current spend;
- expected savings;
- worst and best scenarios;
- conditional database alternatives;
- planning assumptions;
- non-additive governance value; and
- future realised savings.

See [`cost/savings-model.xlsx`](cost/savings-model.xlsx), [`cost/savings-model.md`](cost/savings-model.md) and [`cost/roi-analysis.md`](cost/roi-analysis.md).

## Governance & Controls

The operating model combines:

- mandatory cost-allocation tags;
- budget thresholds and escalation;
- anomaly detection and routing;
- AWS Organizations SCP guardrails;
- AWS Config detective controls;
- controlled remediation;
- RACI ownership;
- daily, weekly, monthly and quarterly reviews; and
- KPI/OKR measurement.

See [`finops/governance.md`](finops/governance.md), [`finops/tagging-strategy.md`](finops/tagging-strategy.md) and [`policies/policy-controls.md`](policies/policy-controls.md).

## Automation

Automation is designed around safe intervention rather than unrestricted self-healing. Examples include scheduled non-production scaling, cost anomaly routing, policy-as-code checks, Infracost visibility in infrastructure changes, AWS Config remediation and autoscaling policies.

Each automated action has an owner, a trigger, a defined boundary and a validation/rollback path.

See [`finops/automation.md`](finops/automation.md).

## Dashboards

Three dashboard designs provide different decision views:

- **Executive:** spend, target, forecast, savings and commitment coverage.
- **Engineering manager:** service/team cost, utilisation, right-sizing queue, anomalies and capacity decisions.
- **Team:** daily service cost, deployment deltas, scaling behaviour, idle resources and cost per endpoint.

See [`dashboards/dashboard-overview.md`](dashboards/dashboard-overview.md) and the Draw.io files in `dashboards/`.

## Executive Decision Support

The case study translates engineering findings into decisions rather than presenting savings as guaranteed outcomes. Leadership can see the current baseline, expected savings, scenario range, remaining gap, risk, compliance gates and areas requiring additional validation.

The principal executive decision is whether to approve the highest-confidence optimisation work while funding or validating the remaining gap rather than accepting unsupported savings assumptions.

See [`executive/decision-support.md`](executive/decision-support.md) and [`executive/cfo-review-panel.pptx`](executive/cfo-review-panel.pptx).

## Risk & Compliance

The case study treats compliance and availability as hard constraints. Examples:

- PCI-scoped payment infrastructure remains isolated.
- RBI-related redundancy requirements are preserved.
- SOC 2 retention and auditability are considered before storage lifecycle changes.
- GDPR/data-localisation considerations constrain regional data movement.
- Spot is limited to workloads that can tolerate interruption.
- Production changes require validation and rollback planning.

These are **design considerations for the fictional case study**, not claims of a live production compliance review.

## Engineering Lessons

- FinOps is an engineering operating discipline, not just bill reduction.
- Visibility and allocation must precede optimisation.
- Savings models need explicit assumptions and mutually exclusive scenarios.
- The largest cost opportunities can require architecture or networking changes.
- Governance prevents yesterday's waste from becoming tomorrow's baseline.
- Automation should be bounded by safety, ownership and rollback controls.
- A smaller defensible savings number is more credible than an inflated target-completion claim.

## Limitations

- The case study uses synthetic data.
- Database right-sizing lacks complete production workload telemetry and is therefore conditional.
- RI/Savings Plans figures are planning assumptions, not live procurement quotes.
- Spot savings depend on workload suitability and interruption handling.
- Historical anomaly detection/acknowledgement timestamps were unavailable, so actual MTTD is not claimed.
- Some dashboard values are illustrative design values.
- Implementation cost is not estimated where reliable scope evidence is unavailable.
- Savings are modelled opportunities, not realised savings.

## Repository Structure

```text
lendflow-finops-cost-optimization/
├── README.md
├── architecture/
│   └── architecture-overview.md
├── cost/
│   ├── billing-analysis.xlsx
│   ├── cost-analysis.md
│   ├── roi-analysis.md
│   ├── savings-model.md
│   └── savings-model.xlsx
├── finops/
│   ├── anomaly-management.md
│   ├── automation.md
│   ├── governance.md
│   ├── policy-as-code-control-matrix.md
│   └── tagging-strategy.md
├── dashboards/
│   ├── dashboard-overview.md
│   ├── executive-finops-dashboard.drawio
│   ├── engineering-manager-finops-dashboard.drawio
│   ├── team-finops-dashboard.drawio
│   └── *.png
├── policies/
│   ├── policy-controls.md
│   ├── scps/
│   ├── config-rules/
│   ├── remediation/
│   ├── terraform-cost-aware/
│   └── autoscaling/*.yaml
├── evidence/
│   └── engineering-decisions.md
├── executive/
│   ├── decision-support.md
│   ├── cfo-review-panel.pptx
│   └── speaker-notes.md
├── analysis/
│   ├── optimisation and anomaly CSVs
│   ├── savings charts
│   └── dashboard/governance analysis
└── data/
    ├── synthetic billing/usage CSVs
    └── README.md
```

## Technologies

**AWS:** Cost Explorer, Cost Anomaly Detection, CloudWatch, Organizations/SCPs, Config, EC2, RDS, EKS, S3, EFS, NAT Gateway, SageMaker, Lambda, SQS and ALB.

**Engineering:** Terraform, Infracost, policy-as-code, CI/CD cost gates, autoscaling, scheduled scaling and automated remediation.

**Analysis & delivery:** Python, CSV, Excel, Draw.io, PowerPoint, Markdown, Git and GitHub.

## Case Study Disclaimer

> This is a fictional FinOps engineering case study using synthetic data. Financial figures, workloads, and business metrics are illustrative and are intended to demonstrate FinOps analysis, optimisation methodology, governance, automation design, and executive decision-making.
