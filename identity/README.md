# Entra ID Identity Security Baseline

Implemented Controls:
- MFA enforced for all users
- Legacy authentication blocked
- Privileged role MFA enforcement
- Conditional Access policies:
  - Require compliant device
  - Block high-risk sign-ins
  - Medium-risk = MFA
  - Trusted location allow list
  - Blocked countries
  - Admin MFA baseline
- Break-glass accounts (2 created)
- Authentication Strength Policies:
  - Phishing-resistant only
  - Passwordless + MFA

Conditional Access Summary:
- CA01 Require MFA
- CA02 Block legacy authentication
- CA03 Admin MFA
- CA04 Block high-risk sign-ins
- CA05 Medium-risk = MFA
- CA06 Require compliant device
- CA08 Trusted locations
- CA09 Blocked countries
- CA10 Require compliant device for risky sign-ins
- CA11 MFA for admin roles baseline
