# Policy Controls

The policy layer translates the FinOps strategy into preventative, detective and corrective controls.

## Preventive controls

- Approved AWS Regions through Organizations SCPs.
- Restricted GPU instance creation.
- Mandatory cost-allocation tagging.
- Terraform validation for required tags and approved instance types.
- Infracost visibility and CI cost thresholds.

## Detective controls

- Tag compliance.
- Sustained low-utilisation EC2.
- Old Standard-tier S3 objects.
- Overly permissive security groups.
- Budget and anomaly signals.

## Corrective controls

AWS Config can invoke controlled remediation workflows. Automatic actions should be limited to changes with a known safe boundary. Protected, regulated or ownership-uncertain resources require human review.

## Included implementation examples

- `scps/*.json` — Organizations guardrails.
- `config-rules/config-rule-specifications.md` — detective control definitions.
- `remediation/automated-remediation-workflow.md` — controlled response workflow.
- `terraform-cost-aware/` — Terraform, Infracost and pre-commit examples.
- `autoscaling/*.yaml` — service-specific scaling policies.

These files are design examples for the fictional case study; they are not represented as deployed production controls.
