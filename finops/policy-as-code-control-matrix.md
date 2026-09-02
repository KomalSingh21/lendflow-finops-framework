# Policy-as-Code Control Matrix

| Control | Mechanism | Intent | Automation | Key risk boundary |
|---|---|---|---|---|
| Mandatory tags | SCP + Terraform validation | Allocation and ownership | Preventive | Approved exceptions |
| Approved regions | SCP | Data locality and governance | Preventive | Explicit region policy |
| GPU restrictions | SCP | Prevent expensive unintended capacity | Preventive | Approved ML workloads |
| Instance-count guardrail | Request control + Config/automation | Capacity governance | Preventive/detective | Fleet-wide count requires external state |
| Low-utilisation EC2 | Config | Identify waste | Detective | Performance validation before action |
| Old Standard S3 objects | Config | Lifecycle optimisation | Detective | Retention/compliance exclusions |
| Security groups | Config | Reduce unsafe exposure | Detective | Security change approval |
| Cost-aware Terraform | Infracost + CI | Cost visibility before merge | Preventive | Thresholds and review |
