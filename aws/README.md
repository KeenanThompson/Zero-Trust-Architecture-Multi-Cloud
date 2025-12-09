# AWS Security Services Configuration

Enabled Services:
- GuardDuty (all regions)
- CloudTrail (multi-region)
- AWS Config with foundational rules
- Security Hub with CIS AWS Foundations and AWS Foundational Best Practices

IAM Baseline:
- Admin role
- Audit_Viewer role
- CloudTrailAdmin role
- Incident_Response_Admin role
- OpsAdmin role
- S3RestrictedAccess role

Security Controls:
- IAM policy preventing deletion or disabling of logging services
- Root MFA requirement verified
- AWS Access Analyzer enabled
- IAM Credential Report verified

Least-Privilege Examples:
- CloudTrail admin cannot delete trails
- S3RestrictedAccess can access only specific buckets
