# Zero Trust Architecture Overview

This environment implements a practical Zero Trust reference architecture across:

- Microsoft 365 / Entra ID
- Azure AD Conditional Access
- AWS (GuardDuty, CloudTrail, Config, Security Hub, IAM)
- Okta (SAML, SCIM)
- Endpoint security (Intune, CrowdStrike, Defender for Endpoint)
- Linux and Windows host hardening

## Core Principles

- Verify explicitly
  - Strong authentication (MFA, passkeys, conditional access)
  - Device compliance and posture
  - Sign-in risk, user risk, and location awareness

- Use least privilege access
  - Role-based access control
  - Just-enough access roles in AWS IAM
  - Conditional Access for admin roles and high-risk sessions

- Assume breach
  - Centralized logging and monitoring
  - GuardDuty, CloudTrail, AWS Config
  - M365 audit logs and advanced hunting
  - Endpoint telemetry from CrowdStrike and Defender

## Main Components

- Identity plane: Entra ID as primary identity provider with Conditional Access, plus Okta as a federated IdP for SAML/SCIM.
- Cloud plane: AWS workloads protected by IAM, GuardDuty, CloudTrail, Config, and Security Hub benchmarks.
- Endpoint plane: macOS, iOS/iPadOS, Windows, and Linux devices hardened and monitored.
- SaaS plane: SSO/SAML and SCIM-based provisioning for selected SaaS applications.
- Automation: Python and shell scripts used for IAM auditing and host hardening checks.
