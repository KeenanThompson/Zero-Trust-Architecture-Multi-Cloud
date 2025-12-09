# Privileged Access Model

This document describes the architecture, controls, and operational practices used to manage privileged access across Entra ID, AWS, Okta, and endpoint environments.

## Guiding Principles
- Privilege is granted only when required.
- Administrative actions require strong authentication.
- Privileged accounts must be isolated from daily-use credentials.
- Continuous monitoring applies to all privileged operations.

## Entra ID Privileged Access Controls

### Privileged Roles Defined
- Global Administrator
- Security Administrator
- Conditional Access Administrator
- Intune Administrator
- Exchange Administrator

### Controls Applied
- Strong MFA (Authentication Strength MFA requirements).
- Sign-in risk protection.
- Device compliance enforcement for admin portals.
- Conditional Access policies dedicated to privileged roles.
- No persistent elevation—admin roles used only as needed.

### Break-Glass Accounts
- Two accounts maintained offline.
- Excluded from Conditional Access.
- Strong, long passwords stored securely.

---

## AWS Privileged Access Controls

### IAM Role Structure
- Admin role (full administrative power).
- CloudTrailAdmin for logging configurations.
- OpsAdmin for operational tasks.
- Incident_Response_Admin for forensics and snapshots.
- S3Restricted role for tightly-scoped bucket operations.

### Safeguards
- MFA required for all IAM principals.
- No inline policies on users—roles only.
- IAM Access Analyzer enabled.
- SCPs or IAM guardrails to prevent deletion of logging services.

---

## Okta Privileged Access Controls

### Key Admin Roles
- Super Admin
- App Admin
- Directory Admin

### Controls
- Admin roles require MFA.
- API token usage monitored.
- SAML/SCIM roles follow least privilege.

---

## Endpoint Privileged Access

### macOS
- Standard users only; sudo elevated actions monitored.
- CrowdStrike IOA policies prevent privilege escalation behaviors.

### Windows
- Defender EDR monitors suspicious administrative activity.
- Local admin rights disabled except for lab-specific exceptions.

### Linux
- Sudo logs monitored.
- Restricted sudoers policies.

---

## Summary
This privileged access design ensures administrators are strongly authenticated, scoped to least privilege, and monitored continuously across all identity, cloud, and endpoint systems.
