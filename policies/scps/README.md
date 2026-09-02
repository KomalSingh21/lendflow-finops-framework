# LendFlow AWS Organizations SCPs

## Purpose

These Service Control Policies establish preventive guardrails around cost attribution, expensive compute, AWS Region usage, and runaway EC2 launch requests.

## Policies

| File | Purpose | Mode |
|---|---|---|
| `scp-mandatory-tagging.json` | Require core FinOps tags on EC2 launch requests | Preventive |
| `scp-gpu-instance-restriction.json` | Restrict GPU-family launches to approved accounts | Preventive |
| `scp-approved-regions.json` | Restrict AWS API usage to approved Regions | Preventive |
| `scp-instance-count-guardrail.json` | Guard large EC2 launch requests | Preventive/planning |

### Required tags

The portfolio taxonomy requires:
`business_unit`, `product`, `environment`, `cost_centre`, `team`.

Conditional tags:
`compliance_scope`, `data_classification`.

AWS supports request-tag and tag-key condition keys for enforcing tags on supported create operations:
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/supported-iam-actions-tagging.html

## Deployment

1. Validate JSON syntax.
2. Test each SCP in a sandbox OU.
3. Attach to a non-production test account first.
4. Validate Terraform/CloudFormation/CI workloads.
5. Confirm break-glass role behavior.
6. Move to production OU only after exception paths are verified.

## Important limitation: instance count

SCPs evaluate request context; they are not a general-purpose real-time inventory counter. The `scp-instance-count-guardrail.json` is therefore a request-size guardrail and must be validated against the exact EC2 API condition-key support before production deployment. Use AWS Config/EventBridge/Lambda quota automation when the requirement is an absolute fleet-wide count.

## Region exceptions

The approved baseline is:
- `ap-south-1`
- `ap-southeast-1`

The break-glass role is excluded from the region deny and must be tightly controlled and audited.
