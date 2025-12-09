# Entra ID Identity Security Baseline

## Core Controls Implemented
- MFA enforced for all users using Conditional Access.
- Legacy authentication fully blocked.
- Privileged roles require strong MFA (Authentication Strength).
- Named locations configured:
  - Trusted: home IP ranges and approved geographic regions
  - Blocked: selected high-risk countries and IP ranges
- Break-glass accounts:
  - Two emergency accounts
  - Excluded from Conditional Access
  - Strong, long passwords stored securely offline

## Conditional Access Policies
- Require MFA for all interactive sign-ins.
- Block legacy authentication.
- Require MFA for admin roles.
- Block high-risk sign-ins.
- Require MFA or compliant device for medium-risk sign-ins.
- Require compliant device for Microsoft 365 workloads.
- Trusted and blocked location controls enforced.
- Risk-based policies enabled (sign-in risk and user risk).
- Authentication Strength applied to admin roles.

## Authentication Strength
- Phishing-resistant authentication (FIDO2 / passkeys) enabled.
- Passwordless + MFA authentication strength available.
- Basic/legacy authentication removed to eliminate password-only flows.

## Resulting Posture
Identity access decisions now rely on MFA, device compliance signals, risk scoring, strong authentication methods, and trusted/blocked location logic.
This forms a Zero Trust–aligned identity foundation across all authentication flows.
