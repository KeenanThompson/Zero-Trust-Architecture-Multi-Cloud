# File: architecture/data_flow.md

# Authentication and Authorization Data Flow

## 1. User Authentication

1. A user signs in from a macOS, iOS, Windows, or Linux device.
2. The identity request is sent to Entra ID (or Okta, depending on the application).
3. Entra ID evaluates:
   - MFA requirement
   - Device compliance (via Intune)
   - Sign-in risk and user risk
   - Named locations (trusted/blocked)
   - Authentication strength (e.g., FIDO2/passkey)

## 2. Federation to Applications and AWS

- For SaaS and some internal apps:
  - Entra ID or Okta issues SAML/OIDC tokens.
  - Group membership and claims drive authorization inside the app.

- For AWS:
  - Entra ID or Okta acts as the SAML IdP.
  - The user assumes an IAM role mapped from their group or application in the IdP.
  - AWS IAM enforces least-privilege permissions on resources.

## 3. Device and Endpoint Enforcement

- Intune compliance and configuration baselines apply to:
  - macOS and iOS/iPadOS devices.
  - Windows devices where supported.
- CrowdStrike Falcon agents run on:
  - macOS
  - Windows
  - Linux hosts (lab VMs)
- Defender for Endpoint runs on macOS (and can be extended to Windows where applicable).

## 4. Logging and Monitoring

- Entra ID sign-in and audit logs are available for analysis and forwarding.
- AWS CloudTrail and Config send configuration and API activity to S3 and Security Hub.
- GuardDuty provides managed threat detection on AWS.
- Endpoint telemetry is available in the EDR portals (CrowdStrike, Defender).
- Logs can be integrated with SIEM platforms for correlation and alerting.

This flow establishes identity as the front door, device and endpoint as enforcement layers, and logging as the backbone for detection and response.
