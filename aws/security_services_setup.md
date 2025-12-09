# AWS Security Services Configuration

## Services Enabled

- GuardDuty enabled in the active region.
- CloudTrail configured with a dedicated S3 bucket.
- AWS Config enabled with foundational rules.
- Security Hub enabled with:
  - CIS AWS Foundations Benchmark
  - AWS Foundational Security Best Practices
  - (Optionally) NIST 800-53 where available in the console.

## Logging and Monitoring

- CloudTrail writes to a central S3 bucket dedicated to logs.
- AWS Config tracks configuration drift and resource compliance.
- GuardDuty provides managed threat detection on IAM, EC2, S3, and other services.
- Security Hub aggregates findings from GuardDuty, Config, and other sources.

## IAM and Guardrails

- IAM roles and users created for:
  - Administration
  - Read-only auditing
  - CloudTrail administration
  - Incident response
  - Restricted S3 access

- Additional IAM guardrail policies used to:
  - Prevent disabling key logging services (implemented as IAM permissions restrictions).
  - Enforce MFA and strong access patterns where applicable.

This configuration reflect a baseline for monitoring and securing an AWS account in a controlled lab.
