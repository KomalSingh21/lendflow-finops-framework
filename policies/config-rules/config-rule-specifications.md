# AWS Config Rule Specifications — LendFlow

These are implementation specifications. The tag, utilisation, and S3 rules are custom Lambda-backed concepts because the required business logic is broader than a single generic managed rule. AWS Config custom Lambda rules evaluate resources and return compliance results to AWS Config. See AWS documentation: https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_develop-rules_lambda-functions.html

## lendflow-required-tags-compliance

**Rule Type:** Custom AWS Config Lambda rule

**Scope:** All taggable resources in LendFlow production and non-production accounts.

**Trigger:** Configuration change and scheduled evaluation every 24 hours.

**Logic:** Read resource tags and require business_unit, product, environment, cost_centre, and team. Apply conditional requirements for compliance_scope on regulated data services and data_classification on storage/database resources. Return COMPLIANT only when all applicable tags exist and values are non-empty.

**Remediation:** Auto-tag only when a safe default is derivable from account, resource owner mapping, or service metadata. Otherwise create a JIRA remediation ticket.

**Notification:** Responsible team Slack channel; FinOps shared channel for repeated violations; Compliance for regulated-resource exceptions.

## lendflow-ec2-low-utilisation-30d

**Rule Type:** Custom AWS Config Lambda rule backed by CloudWatch metrics

**Scope:** EC2 instances excluding approved low-utilisation workloads and break-glass exemptions.

**Trigger:** Scheduled evaluation daily; query 30-day average CPUUtilization.

**Logic:** Flag NON_COMPLIANT when 30-day average CPUUtilization is below 20% and the instance has existed for at least 30 days. Use workload exclusions for batch, DR, licensed software, and explicitly approved capacity buffers.

**Remediation:** Create a right-sizing ticket with instance metrics, owner, service, and projected savings. Do not auto-stop production instances.

**Notification:** Owning team Slack channel plus weekly FinOps digest. Escalate unresolved production findings after 14 days.

## lendflow-s3-storage-class-validation

**Rule Type:** Custom AWS Config Lambda rule

**Scope:** S3 buckets/objects where inventory and access metrics are available.

**Trigger:** Scheduled weekly evaluation using S3 Inventory plus access/last-access metadata.

**Logic:** Flag Standard-tier objects not accessed for 90+ days when they are not under a retention/legal-hold exception and are eligible for a lower-cost storage class.

**Remediation:** Prefer S3 Lifecycle transition to Standard-IA/Glacier class based on data classification and retrieval requirements. Never transition regulated records without retention/compliance approval.

**Notification:** Bucket owner/data team Slack channel; Compliance on retention-sensitive exceptions.

## lendflow-security-group-permissive-ingress

**Rule Type:** AWS Config managed/custom rule

**Scope:** Security groups attached to production and regulated workloads.

**Trigger:** Configuration change and daily periodic evaluation.

**Logic:** Flag ingress rules exposing 0.0.0.0/0 or ::/0 to sensitive ports such as 22, 3389, database ports, or broad application ranges unless an approved exception tag is present.

**Remediation:** Auto-remediation only for known-safe temporary rules with explicit exception metadata. Otherwise create a JIRA security remediation ticket and notify the service owner.

**Notification:** Security/Compliance Slack channel and responsible engineering team.

