# Optimisation Decision Matrix

## Purpose

This matrix turns the cost analysis into an engineering decision framework. Each opportunity is assessed against **modelled savings, confidence, implementation effort, technical risk and compliance/availability constraints**.

The objective is not to maximise theoretical savings. It is to prioritise changes that can be validated, safely implemented and measured without compromising the platform's operational requirements.

> **Important:** Savings are modelled scenarios based on synthetic data. They are not realised production savings.

## Decision Summary

| Priority | Opportunity | Expected Monthly Savings | Confidence | Effort | Risk | Decision |
|---|---|---:|---|---|---|---|
| **P1** | Data-transfer optimisation | **$30,574.46** | Medium | Medium | Medium | **Prioritise investigation and validate highest-cost paths** |
| **P1** | EC2 right-sizing | **$9,032.50** | High | Medium | Medium | **Prioritise with staged validation** |
| **P1** | Storage lifecycle optimisation | **$5,549.01** | High | Low | Low | **Prioritise for controlled rollout** |
| **P2** | Aurora Serverless migration scenario | **$5,840.42** | Medium | High | High | **Validate as a database architecture option** |
| **P2** | Spot for eligible workloads | **$508.81** | Medium | Medium | Medium | **Apply selectively to interruption-tolerant workloads** |
| **P2** | RI / Savings Plan optimisation | **$172.51** | Medium | Medium | Medium | **Review coverage and utilisation before commitment** |
| **P3** | Non-production scheduled scaling | **$835.68** | Medium | Low | Low | **Automate for eligible non-prod workloads** |

### Expected savings position

- **Expected modelled savings:** **$51,677.71/month**
- **Expected annualised savings:** **$620,132.52/year**
- **CFO target:** **$60,000/month**
- **Expected gap:** **$8,322.29/month**
- The matrix therefore supports a **prioritised optimisation programme**, not a claim that the CFO target has already been achieved.

## Detailed Decision Matrix

| Opportunity | Evidence / Trigger | Savings Basis | Confidence | Effort | Risk | Compliance / Availability Gate | Recommended Action |
|---|---|---|---|---|---|---|---|
| **Data-transfer optimisation** | High transfer-cost paths identified across the synthetic transfer dataset | Modelled expected savings of **$30,574.46/month** | Medium | Medium | Medium | Validate latency, service dependencies, encryption and data-residency requirements | Analyse the highest-cost paths first; evaluate locality, architecture and transfer reduction options before implementation |
| **EC2 right-sizing** | 100 sustained low-utilisation candidates identified from 400 analysed instances | Modelled savings of **$9,032.50/month** | High | Medium | Medium | Validate CPU, memory, throughput, latency and application SLOs | Start with low-risk candidates; benchmark and roll back if performance thresholds are breached |
| **Storage lifecycle optimisation** | 192 Standard-tier resources with 90+ days since access | Modelled savings of **$5,549.01/month** | High | Low | Low | Confirm retention, recovery and regulatory requirements before transition/deletion | Apply lifecycle policies to eligible data after ownership and retention validation |
| **Aurora Serverless migration** | Database optimisation scenario identified during RDS/Aurora analysis | Modelled savings of **$5,840.42/month** | Medium | High | High | Validate workload compatibility, performance, availability, recovery and compliance | Treat as an architecture option; benchmark before production migration |
| **RDS right-sizing** | Alternative database optimisation scenario | Modelled savings of **$4,672.34/month** | Medium | Medium | Medium | Same database performance, availability and recovery gates | Evaluate as an alternative to Aurora Serverless; do **not** add both scenarios to total savings |
| **Spot optimisation** | Eligible interruptible workload scenario | Modelled savings of **$508.81/month** | Medium | Medium | Medium | Workload must tolerate interruption and maintain availability through fallback capacity | Use diversified Spot capacity pools and interruption handling for suitable workloads |
| **RI / Savings Plan optimisation** | Commitment coverage and utilisation reviewed; average RI utilisation modelled at 71.4% | Modelled savings of **$172.51/month** | Medium | Medium | Medium | Validate stable demand and avoid over-commitment | Improve commitment coverage only after utilisation and baseline demand are validated |
| **Non-production scheduling** | Eligible non-prod capacity identified | Planning estimate of **$835.68/month** | Medium | Low | Low | No impact to required test windows, release activities or shared environments | Automate weekday scale-down/up schedules and weekend shutdown where appropriate |

## Decision Rules

### 1. Savings alone does not determine priority

A large theoretical saving is not automatically a production priority. The opportunity must also have:

- sufficient evidence;
- an identifiable owner;
- an acceptable implementation path;
- a validation strategy;
- a rollback path; and
- no conflict with compliance or availability requirements.

### 2. Compliance is a hard gate

An optimisation is rejected or redesigned if it would compromise required:

- data isolation;
- retention;
- auditability;
- encryption;
- access controls; or
- regulatory obligations.

### 3. Availability is a hard gate

Changes must preserve the **99.95% availability objective**.

Production optimisation should therefore use staged rollout, monitoring and explicit rollback criteria where service behaviour could change.

### 4. Mutually exclusive scenarios must remain separate

The database options are alternatives:

- **Aurora Serverless:** $5,840.42/month modelled savings
- **RDS right-sizing:** $4,672.34/month modelled savings

They must **not** be summed together.

The expected savings model uses the Aurora Serverless scenario.

## Recommended Execution Sequence

### Phase 1 — Low-risk, high-confidence

1. Storage lifecycle optimisation
2. EC2 right-sizing for low-risk candidates
3. Non-production scheduled scaling

These opportunities provide relatively straightforward optimisation paths and can establish the measurement and rollback process.

### Phase 2 — Evidence-heavy optimisation

4. Data-transfer optimisation
5. RI / Savings Plan review
6. Spot adoption for eligible workloads

These require stronger workload and demand validation before financial commitments or architectural changes are made.

### Phase 3 — Architectural optimisation

7. Aurora Serverless migration evaluation

This has meaningful potential savings but carries greater application, performance and migration risk. It should therefore be treated as a validated architecture decision rather than a simple cost-cutting action.

## Validation Checklist

Before approving a production optimisation:

- [ ] Cost baseline captured
- [ ] Resource/service owner identified
- [ ] Usage and performance evidence reviewed
- [ ] Expected savings quantified
- [ ] Compliance impact reviewed
- [ ] Availability/SLO impact reviewed
- [ ] Performance test or benchmark defined
- [ ] Rollback procedure documented
- [ ] Monitoring and alerting confirmed
- [ ] Change approved
- [ ] Post-change savings measurement defined

## Outcome Measurement

After implementation, each approved opportunity should be measured against:

| KPI | Purpose |
|---|---|
| **Monthly cost reduction** | Quantify absolute savings |
| **Cost reduction %** | Measure efficiency improvement |
| **Cost per transaction / customer** | Connect infrastructure spend to business activity |
| **Service performance** | Confirm optimisation did not degrade workload behaviour |
| **Availability** | Confirm the 99.95% objective remains protected |
| **Realised vs modelled savings** | Test the accuracy of the original scenario |
| **Compliance / tagging status** | Confirm governance controls remain effective |

## Decision Principle

> **Prioritise the opportunity with the best combination of savings potential, evidence quality, implementation feasibility and operational safety — not simply the largest dollar figure.**

This decision framework keeps cost optimisation aligned with engineering responsibility: **measure first, validate second, change safely, and prove the outcome.**
