# Cost-Aware Terraform Module

This module is a portfolio template for LendFlow cost-aware provisioning.

## Guardrails

- Mandatory FinOps tags: `business_unit`, `product`, `environment`, `cost_centre`, `team`.
- `environment` must be `dev`, `staging`, or `production`.
- EC2 instance types are restricted to an approved list.
- Oversized instance types are blocked outside production.
- Terraform variable validation and resource preconditions fail the plan when guardrails are violated.
- Infracost is used in CI to expose estimated monthly cost and cost deltas on pull requests.
- A pre-commit/CI gate fails when the estimated monthly cost exceeds the configured threshold.

Terraform variable validation and preconditions are evaluated during planning and can stop an operation when their conditions fail:
https://developer.hashicorp.com/terraform/language/validate

## Example

```hcl
module "loan_api" {
  source = "./policies/terraform-cost-aware"

  name           = "loan-api"
  environment    = "staging"
  ami_id         = "ami-xxxxxxxx"
  subnet_id      = "subnet-xxxxxxxx"
  instance_type  = "m7i.large"

  tags = {
    business_unit = "lending"
    product       = "loan-platform"
    environment   = "staging"
    cost_centre   = "CC-1001"
    team          = "loan-platform"
    service       = "loan-application-api"
    created_by    = "terraform"
  }
}
```

## Validation

```bash
terraform fmt -check -recursive
terraform init -backend=false
terraform validate
terraform plan
```

## Infracost

Use the Infracost CLI in CI to generate a cost estimate and post the delta to the pull request. The official GitHub Actions integration supports PR-level cost estimates:
https://www.infracost.io/docs/integrations/github_actions/

## Cost gate

The recommended CI flow is:

1. `terraform plan -out=tfplan`
2. Export plan JSON.
3. Run Infracost against the plan.
4. Parse the monthly `diffTotalMonthlyCost`.
5. Fail the pipeline if the change exceeds the approved threshold.
6. Require an explicit FinOps exception label/approval for threshold overrides.

The threshold is intentionally implemented as a CI policy rather than pretending Terraform itself can query an external cost engine during plan evaluation.
