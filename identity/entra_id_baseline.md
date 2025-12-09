# Entra ID Identity Security Baseline

Controls implemented:

## Core Authentication
- MFA enforced for all users.
- Passkeys and FIDO2 authentication enabled.
- Authentication Strengths configured:
  - Phishing-resistant only
  - Passwordless + MFA
  - Strong MFA

## Legacy Access Control
- Legacy authentication blocked globally.
- SMTP basic and older Exchange protocols disabled.

## Privileged Access
- Admin roles require MFA.
- Separate break-glass accounts established with exclusions.
- Administrative units prepared for future scoping.

## Conditional Access Policies
- Require MFA for all users.
- Require compliant device for key applications.
- Block high-risk sign-ins.
- Medium-risk sign-ins require MFA.
- Trusted locations defined (IP/GPS-based).
- Blocked countries enforced.
- Risk-based CA (sign-in risk and user risk) enabled.
- Authentication strength applied to admin roles.

## Device Integration
- Intune compliance signals enforced for macOS, i
