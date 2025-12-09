### AWS Security Architecture

##
AWS Security Architecture Diagram
---

```markdown


This diagram shows the AWS-side security controls and how they interact.

## Components

- **Accounts / Environment**
  - Single AWS account (simulating a secured environment).

- **Networking**
  - VPC with public and private subnets (if represented).
  - Internet Gateway / NAT (logical, optional in the drawing).

- **Identity and Access**
  - IAM users (for demonstration) and IAM roles:
    - Admin
    - Audit_Viewer
    - CloudTrailAdmin
    - Incident_Response_Admin
    - OpsAdmin
    - S3RestrictedAccess
  - MFA enforced for interactive users.
  - Permission policies reflecting least privilege.

- **Logging and Monitoring**
  - CloudTrail:
    - Organization-style or account trail.
    - Logs stored in dedicated S3 bucket.
  - AWS Config:
    - Foundational rules (root MFA, key rotation, public S3 checks, etc.).
  - GuardDuty:
    - Threat detection across regions.
  - Security Hub:
    - Aggregates findings from GuardDuty, Config, and other services.
    - CIS / AWS Security Best Practices standards enabled.

- **Data Stores**
  - S3 buckets:
    - CloudTrail logs bucket.
    - Config bucket.
    - Application/demo buckets (with public access blocked).

- **Guardrails**
  - IAM policies that prevent:
    - Stopping CloudTrail logging.
    - Deleting CloudTrail trails.
    - Disabling GuardDuty.

## Relationships to Show

- IAM identities → Access AWS resources through roles.
- CloudTrail → delivers logs to S3.
- AWS Config → monitors resource configuration and feeds Security Hub.
- GuardDuty → analyzes logs and traffic, feeds findings to Security Hub.
- Security Hub → central view of compliance and security posture.

## Mermaid Sketch

```mermaid
flowchart LR
  subgraph ACC[AWS Account]
    IAM[IAM Users & Roles]
    VPC[VPC / Subnets]
    S3Logs[S3 - CloudTrail Logs]
    S3Config[S3 - Config Data]
    CT[CloudTrail]
    CFG[Config]
    GD[GuardDuty]
    SH[Security Hub]
  end

  IAM --> VPC
  CT --> S3Logs
  CFG --> S3Config
  CT --> SH
  CFG --> SH
  GD --> SH
