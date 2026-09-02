# FinOps Governance

## Ownership model

| Stakeholder | Primary responsibility | Decision focus |
|---|---|---|
| CFO | Financial outcome | Savings, forecastability, target gap |
| CTO | Technical risk | Availability, architecture, engineering velocity |
| VP Engineering | Execution | Change sequencing and disruption |
| Compliance | Control boundary | PCI/SOC 2/RBI/GDPR constraints |
| Data Engineering | Data/ML efficiency | Throughput and workload performance |
| Product | Customer impact | Launch velocity and experience |

## Operating cadence

- **Daily:** automated cost, anomaly and budget signals.
- **Weekly:** engineering opportunity review and action tracking.
- **Monthly:** FinOps review of spend, savings, allocation, anomalies and realised value.
- **Quarterly:** strategic review of architecture, commitments, unit economics and maturity.

## Budget hierarchy

`Organisation → Business Unit → Team → Product/Project`

Budget alerts are designed around 80%, 90%, 100% and 120% thresholds, with escalation based on severity and ownership.

## RACI principle

Finance owns financial accountability; engineering owns technical implementation; compliance has a hard approval boundary for regulated changes; product is consulted where customer impact exists.

## Success measures

- Cost reduction in absolute and percentage terms.
- Cost per loan/application/product unit.
- Tag compliance above 95%.
- Anomaly detection target below four hours for applicable events.
- RI utilisation above 85%.
- Zero optimisation changes that breach availability or compliance controls.
