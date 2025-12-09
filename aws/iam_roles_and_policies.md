# IAM Roles and Permission Sets

## Roles and Users Created

- Admin
- Audit_Viewer
- CloudTrailAdmin
- Incident_Response_Admin
- OpsAdmin
- S3RestrictedAccess

These represent common operational roles in a production environment.

## Permissions Model

- Admin  
  - Broad administration rights for lab purposes.

- Audit_Viewer  
  - Read-only access to CloudTrail, Config, GuardDuty, Security Hub, and key resource metadata.

- CloudTrailAdmin  
  - Permissions focused on managing CloudTrail configuration and log delivery, without broad resource control.

- Incident_Response_Admin  
  - Elevated read and containment actions aligned with investigation (e.g., some security and logging services).

- OpsAdmin  
  - Operational access for managing common resources, excluding global security and billing actions.

- S3RestrictedAccess  
  - Limited rights to access selected S3 buckets required for application or logging tasks.

## Guardrail Policies

- IAM policies applied to restrict destructive actions against:
  - CloudTrail trails.
  - GuardDuty detectors.
  - Critical log buckets.

This  demonstrates least-privilege thinking and separation of duties within a single AWS account.
