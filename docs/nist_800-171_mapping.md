# File: docs/nist_mapping.md

# NIST 800-171 Control Mapping (Lab Implementation)

This document maps selected NIST 800-171 controls to implementations in a multi-platform environment.

## Control 3.1.2 – Multi-Factor Authentication

Implementation:

- Entra ID Conditional Access requires MFA for user sign-ins.
- Admin roles have additional MFA enforcement.
- AWS IAM users and roles use MFA where applicable.

## Control 3.3.1 – Audit and Accountability

Implementation:

- AWS CloudTrail enabled and logging to a dedicated S3 bucket.
- AWS Config records configuration changes.
- GuardDuty and Security Hub provide security findings.
- Microsoft 365 audit logging enabled for identity and collaboration activity.

## Control 3.4.2 – Least Privilege

Implementation:

- AWS IAM roles created with task-focused permissions (admin, audit, CloudTrail admin, operations, restricted S3).
- Conditional Access policies restrict access based on risk, device compliance, and location.
- Okta and Entra group-based access used for SSO and SAML role mapping.

## Control 3.13.11 – Anomalous Behavior Detection

Implementation:

- GuardDuty enabled to detect anomalous AWS activity.
- Identity risk and sign-in risk evaluated by Entra ID.
- Endpoint telemetry available from CrowdStrike and Defender for investigating suspicious host behavior.

## Control 3.14.6 – System and Communications Protection

Implementation:

- Intune enforces compliance on macOS, iOS/iPadOS, and Windows devices where applicable.
- macOS and Windows hardening includes firewall and disk encryption.
- Linux hosts are hardened via local configuration and shell scripts.
- Secure protocols and modern authentication enforced (MFA, blocking legacy auth).

These mappings control coverage using cloud identity, endpoint management, and AWS security services.
