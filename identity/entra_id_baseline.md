# Entra ID Identity Security Baseline

## Core Controls

- MFA enforced for all users via Conditional Access.
- Legacy authentication protocols blocked.
- Admin and privileged roles require strong MFA.
- Named locations:
  - Trusted: home and primary regions.
  - Blocked: selected high-risk countries and IP ranges.
- Break-glass accounts:
  - At least one emergency account excluded from all Conditional Access.
  - Strong, long, non-expiring password and out-of-band storage.

## Conditional Access Highlights

- Require MFA for all interactive sign-ins.
- Require compliant device for key Microsoft 365 workloads.
- Require compliant device or MFA for risky sign-ins.
- Block sign-ins from blocked countries/IP ranges.

## Authentication Strength

- Phishing-resistant strength configured (FIDO2/passkeys).
- Passwordless + MFA combination allowed where supported.
- Legacy/basic auth blocked to remove password-only flows.

This baseline provides a realistic identity control set aligned with Zero Trust principles and common enterprise practices.
