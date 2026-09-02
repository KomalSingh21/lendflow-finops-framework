# Savings Model

## Financial source of truth

| Metric | Value |
|---|---:|
| Current monthly spend | $180,000.00 |
| CFO target savings | $60,000.00/month |
| Expected modelled savings | $51,677.71/month |
| Worst-case scenario | $31,375.79/month |
| Best-case scenario | $53,903.64/month |
| Expected annualised run-rate | $620,132.52/year |
| Expected gap to target | $8,322.29/month |

## Expected case

```text
EC2 right-sizing             $9,032.50
Database (Aurora scenario)   $5,840.42
Storage                      $5,549.01
Data transfer               $30,574.46
RI / Savings Plans              $172.51
Spot                            $508.81
--------------------------------------
Expected                    $51,677.71/month
```

## Scenario discipline

The model deliberately excludes governance controls such as anomaly routing and tagging from additive savings. Their value is prevention, allocation and operational control rather than a separately additive savings number.

Database options are mutually exclusive:

- **RDS right-sizing:** $4,672.34/month.
- **Aurora Serverless:** $5,840.42/month.

The expected case uses Aurora Serverless. The alternative must not be added to the expected total.

## 90-day realisation model

| Day | Modelled realisation | Monthly run-rate |
|---:|---:|---:|
| 0 | 0% | $0.00 |
| 30 | 40% | $20,671.08 |
| 60 | 75% | $38,758.28 |
| 90 | 100% | $51,677.71 |

This is a planning curve, not evidence that the savings were actually realised.

## What is not claimed

- The CFO target is **not achieved** in the model.
- Modelled savings are not realised savings.
- Database savings are conditional.
- Commitment savings require current AWS pricing validation.
- Implementation cost is not invented where scope evidence is unavailable.
