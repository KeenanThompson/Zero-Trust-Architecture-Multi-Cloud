# Conditional Access Policies

## CA01 – Require MFA
Applies MFA to all interactive sign-ins.

## CA02 – Block Legacy Authentication
Blocks basic/legacy authentication protocols across the tenant.

## CA03 – Admin MFA Enforcement
Requires MFA for all privileged roles.

## CA04 – Block High-Risk Sign-ins
Blocks sign-ins where Entra ID evaluates user or sign-in risk as “High.”

## CA05 – Medium-Risk = MFA
Medium-risk sign-ins require MFA to continue.

## CA06 – Require Compliant Device
Enforces device compliance for core Microsoft 365 applications.

## CA08 – Trusted Locations
Applies IP- and GPS-based trusted location rules.

## CA09 – Blocked Countries
Blocks authentication attempts originating from high-risk geographic regions.

## CA10 – Require Compliant Device for Risky Sign-ins
If a sign-in is risky but not blocked, a compliant device is required.

## CA11 – Admin Roles MFA Baseline
Additional MFA requirement applied only to administrative roles.

## Notes
- Break-glass accounts are excluded from all Conditional Access policies.
- Authentication Strength (“phishing-resistant” and “passwordless + MFA”) is applied to relevant policies and admin roles.
