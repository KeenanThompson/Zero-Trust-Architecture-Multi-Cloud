# Zero Trust Architecture Overview

This documentation defines the Zero Trust architecture implemented across Microsoft 365, Entra ID, AWS, Okta, and endpoint platforms.

Core Principles:
- Explicit identity verification
- Device trust validation
- Least-privilege enforcement
- Continuous monitoring and logging

Components:
- Identity Control Plane: Entra ID + Okta
- Device Trust: Intune + CrowdStrike + Defender
- Cloud Guardrails: AWS IAM, GuardDuty, CloudTrail, Config, Security Hub
- SaaS Security: SAML, SCIM, access policies
- Automation: Scripts for auditing and configuration checks

## Authentication and Authorization Data Flow

1. User initiates authentication.
2. Entra ID evaluates:
   - MFA requirements
   - Device compliance
   - Sign-in risk
   - Location rules
   - Authentication strength
3. Federation to AWS or SaaS applications through Entra or Okta.
4. AWS enforces IAM role permissions.
5. Logging:
   - CloudTrail
   - GuardDuty
   - Entra ID logs
   - CrowdStrike telemetry
   - Intune device reports
