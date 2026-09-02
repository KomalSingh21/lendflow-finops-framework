# Cost Anomaly Management

## Observed synthetic events

The synthetic anomaly dataset contains **80 events** with **$114,110.90** of observed excess cost.

| Severity | Events | Excess cost |
|---|---:|---:|
| P1 | 19 | $58,819.04 |
| P2 | 27 | $36,291.96 |
| P3 | 21 | $14,883.63 |
| P4 | 13 | $4,116.27 |

The largest anomaly type is runaway autoscaling at **$26,642.16** of observed excess cost.

## Detection layers

1. Static guardrails for known failure modes.
2. Statistical methods such as z-score and IQR.
3. AWS Cost Anomaly Detection / CloudWatch anomaly detection.
4. Business-context filtering using deployments, month-end processing, environment, owner and compliance scope.

## Response

`Detect → deduplicate → classify → route → investigate → contain → validate → RCA → preventive control`

P1/P2 events receive the fastest response. P3/P4 events are routed through operational channels according to their impact.

## Limitation

The source anomaly data has no detection, acknowledgement or resolution timestamps. Therefore actual historical MTTD and delayed-detection cost are **not claimed**. The repository instead defines target response SLAs.
