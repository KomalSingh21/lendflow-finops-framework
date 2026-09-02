# Cost Analysis

## Six-month baseline

| Month | AWS spend |
|---|---:|
| Jan 2026 | $50,000 |
| Feb 2026 | $68,000 |
| Mar 2026 | $92,000 |
| Apr 2026 | $121,000 |
| May 2026 | $151,000 |
| Jun 2026 | $180,000 |

AWS spend increased approximately **3.6×** from January to June 2026. The case study does not treat this as a realised cost-saving event; it is the baseline against which opportunities are evaluated.

## Six-month service concentration

| Service | Six-month spend |
|---|---:|
| EC2 | $145,373.46 |
| RDS | $140,170.16 |
| EKS | $130,881.45 |
| SageMaker | $64,874.84 |
| EFS | $55,429.74 |
| S3 | $35,027.64 |
| NAT Gateway | $27,215.61 |
| ALB | $19,397.20 |
| EBS | $14,244.42 |
| CloudWatch | $13,598.93 |
| SQS | $8,655.07 |
| Lambda | $7,132.09 |

The concentration in compute, database and Kubernetes-related services supports prioritising utilisation, architecture and data-transfer analysis.

## Key findings

### Compute

400 instances were analysed; 100 were sustained low-CPU candidates. A one-step right-sizing planning assumption produces **$9,032.50/month** of modelled savings. Production candidates require workload-specific performance validation.

### Storage

192 Standard-tier resources had 90+ days since access in the synthetic inventory. The modelled storage lifecycle opportunity is **$5,549.01/month**.

### Data transfer

Data-transfer analysis identifies **$30,574.46/month** as the expected modelled opportunity across placement, regional transfer, egress and network-path optimisation scenarios. These changes require traffic, latency, data-classification and compliance validation.

### Database

RDS right-sizing is modelled at **$4,672.34/month**. Aurora Serverless is an alternative scenario at **$5,840.42/month**. The alternatives are mutually exclusive and the expected model uses Aurora Serverless.

### Commitments and Spot

Risk-adjusted RI/Savings Plans opportunity is **$172.51/month** under planning assumptions. Suitable interruptible workloads add **$508.81/month** of modelled Spot savings.

## Evidence files

The underlying synthetic datasets are in [`data/`](../data/). Detailed analytical CSVs and charts are in [`analysis/`](../analysis/).
