# CFO Review Panel — Speaker Notes

## 1. Opening

LendFlow Technologies is a fictional lending platform case study. The objective is to show how a FinOps programme can connect AWS cost analysis to engineering decisions, governance and executive financial outcomes.

## 2. Problem

AWS spend increased from $50,000/month in January 2026 to approximately $180,000/month in June 2026. The business objective is $60,000/month of sustainable savings without compromising reliability or compliance.

## 3. Financial position

The expected model identifies $51,677.71/month, or $620,132.52/year, leaving an $8,322.29/month gap to the target. The gap is deliberately retained rather than filled with unsupported assumptions.

## 4. Opportunity mix

Data-transfer optimisation is the largest expected opportunity, followed by EC2, storage and database optimisation. RI/Savings Plans and Spot contribute smaller risk-adjusted opportunities.

## 5. Database decision

RDS right-sizing at $4,672.34/month and Aurora Serverless at $5,840.42/month are alternatives. The expected model uses Aurora Serverless; both must never be added together.

## 6. Risk

The highest-value changes may affect architecture, traffic paths or capacity. Each production change therefore requires performance validation, compliance review and rollback planning.

## 7. Governance

The operating model uses ownership, budgets, anomaly detection, tagging, SCPs, Config, policy-as-code and recurring FinOps reviews so savings are sustained.

## 8. Executive ask

Approve the highest-confidence optimisation work, validate the conditional opportunities, and retain the remaining gap as an explicit engineering/financial problem rather than claiming target completion.

## Closing

The central message is that FinOps is not simply finding cheaper AWS resources. It is a repeatable mechanism for understanding cloud economics, making safe engineering changes and measuring business value.
