# Authentication Strengths and Methods

This document describes the authentication strengths and methods configured in Entra ID and how they relate to Conditional Access.

## Authentication Methods Enabled

- Password + MFA (standard modern auth).
- FIDO2 security keys / passkeys where supported.
- Microsoft Authenticator for push-based MFA and passwordless sign-in.

## Authentication Strengths

### 1. Phishing-Resistant Authentication

Configured strength to require:

- FIDO2 / passkey-based authentication.
- No SMS or voice-based MFA.
- Intended for:
  - Admin roles.
  - High-value access scenarios.
  - Sensitive resource access.

Used in Conditional Access for:

- Admin role sign-ins.
- Certain high-risk or sensitive sign-in paths.

### 2. Passwordless + MFA

Authentication strength that allows:

- Microsoft Authenticator passwordless sign-in.
- FIDO2 + additional factor where applicable.
- Designed for:
  - Daily user access to core applications.
  - Scenarios where stronger-than-password + OTP is desired.

Used in:

- CA policies enforcing stronger auth on specific apps.
- Flows where user experience and security must be balanced.

### 3. Strong MFA

Covers:

- Modern MFA methods (authenticator app, push notifications, app passwords avoided).
- Excludes weaker options such as SMS if configured that way.

Applied to:

- General user MFA enforcement.
- Medium-risk sign-ins where additional verification is required.

## Usage in Conditional Access

- Admin policies:
  - Require phishing-resistant or strong MFA strengths.
- User policies:
  - Require MFA at minimum.
  - Stronger strength applied to higher-risk applications or conditions.
- Risk-based policies:
  - High-risk sign-ins can be blocked outright.
  - Medium-risk sign-ins require MFA or a stronger authentication strength.

Authentication strengths are used to enforce not just “MFA on/off,” but specific, resistant methods aligned with best practices.
