# AWS Security Services Configuration

Enabled:
- GuardDuty (all regions)
- CloudTrail (organization trail simulation)
- AWS Config with foundational rules
- Security Hub with CIS and AWS benchmarks

IAM Baseline:
- Admin role
- Read-only audit role
- S3-restricted role
- Automation role

Key Guardrails:
- IAM policy preventing deletion of logging services
- Root MFA requirement
- Access Analyzer enabled
