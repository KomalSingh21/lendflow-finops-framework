# ROI & Payback Analysis

## Financial view

The expected savings run-rate is **$51,677.71/month**, equivalent to **$620,132.52/year** if fully realised.

The case study does not provide a defensible single ROI percentage or payback period because implementation costs and validated engineering scope are not consistently available for every recommendation.

## Decision framework

For each initiative, the decision should use:

`Payback period = implementation cost / monthly realised savings`

`ROI = (annual realised savings − implementation cost) / implementation cost`

These calculations should be completed only after engineering scope, labour, tooling and migration costs are validated.

## What can be compared now

| Initiative | Expected monthly opportunity | Relative decision signal |
|---|---:|---|
| Data transfer | $30,574.46 | Highest financial impact; higher engineering risk |
| EC2 right-sizing | $9,032.50 | Strong candidate analysis; validate performance |
| Storage lifecycle | $5,549.01 | Lower-risk operational optimisation |
| Aurora Serverless | $5,840.42 | Conditional architecture decision |
| Spot | $508.81 | Small but repeatable workload optimisation |
| RI/SP | $172.51 | Small risk-adjusted opportunity; pricing validation required |

The objective is to avoid false precision: a smaller evidence-backed opportunity is preferable to an unsupported ROI claim.

## Recommendation decision matrix

Implementation cost is intentionally shown as **TBD** where reliable scope and labour-cost evidence is unavailable. The source analysis does provide planning-level effort and risk for the main opportunities.

| Initiative | Monthly opportunity | Effort | Risk | Decision posture |
|---|---:|---:|---|---|
| Storage lifecycle | $5,549.01 | 4 person-days | Low | Prioritise after retention validation |
| EC2 right-sizing | $9,032.50 | 10 person-days | Medium | Prioritise with performance baseline |
| Non-production scheduling | $1,800.00 | 5 person-days | Low | Automate |
| Cross-AZ placement | $8,500.00 | 12 person-days | Medium | Plan after traffic/latency validation |
| Cross-region transfer | $9,000.00 | 12 person-days | High | Validate data locality first |
| Egress compression/caching | $6,500.00 | 10 person-days | Medium | Benchmark before rollout |
| Aurora Serverless | $5,840.42 | 15 person-days | High | Architecture validation required |
| RI/Savings Plans | $172.51 | 5 person-days | Medium | Validate stable baseline and pricing |
| Spot workloads | $508.81 | 7 person-days | Medium | Use only for interruptible workloads |

Person-days are planning estimates from the case-study analysis, not measured project execution effort.
