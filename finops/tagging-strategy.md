# Tagging Strategy

## Mandatory allocation tags

- `business_unit`
- `product`
- `environment`
- `cost_centre`
- `team`

## Recommended operational tags

- `service`
- `created_by`
- `ttl`

Conditional tags such as `compliance_scope` and `data_classification` apply where they improve governance without exposing sensitive information.

## Control model

```text
Provisioning
   ↓
Preventive policy / Terraform validation
   ↓
Resource created
   ↓
AWS Config detective check
   ↓
Corrective remediation where safe
   ↓
Monthly compliance reporting
```

The synthetic analysis found **82.7% tag compliance**, leaving 260 non-compliant resources. The allocation-gap proxy is not presented as savings because improving tags primarily improves attribution, accountability and governance.

## Guardrails

- Never place sensitive data in tags.
- Exclude protected compliance/audit resources from destructive remediation.
- Require ownership before automatic cleanup.
- Escalate persistent non-compliance below the 95% target.
