# CI Cost Gate

Recommended pipeline stages:

```text
Terraform fmt/validate
        |
Terraform plan
        |
Infracost breakdown/diff
        |
Parse monthly cost delta
        |
 +------v------+
 | delta <=    |----> PASS
 | threshold?  |
 +------+------+
        |
       NO
        |
FinOps exception approval
        |
   +----+----+
   |         |
 approved  rejected
   |         |
  PASS      FAIL
```

The cost gate must use the same threshold definition across repositories and should distinguish:
- new monthly run-rate;
- monthly delta;
- one-time charges;
- savings from removed resources.

Never bypass the gate merely because a resource is technically valid.
