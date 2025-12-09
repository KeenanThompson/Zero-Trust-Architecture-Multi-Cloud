# Conditional Access Policy Summary

This section summarizes the Conditional Access policies implemented in Entra ID.

## Policy List

### CA01 – Require MFA
Enforces MFA for standard user sign-ins.

### CA02 – Block legacy authentication
Denies all legacy protocol authentication flows.

### CA03 – Admin MFA enforcement
Targets privileged roles.
Requires strong MFA and modern auth only.

### CA04 – Block high-risk sign-ins
Blocks sign-ins classified as high risk.

### CA05 – Medium-risk requires MFA
Prompts for MFA when sign-in risk is medium.

### CA06 – Require compliant device
Requires Intune-compliant device for selected applications.

### CA08 – Trusted locations
Applies more relaxed controls from trusted locations where appropriate.

### CA09 – Blocked countries
Blocks sign-in from selected high-risk geographic locations or IP ranges.

### CA10 – Require compliant device for risky sign-ins
For risky sign-ins, enforces a combination of MFA and compliant device posture.

### CA11 – Admin roles MFA baseline
Additional enforcement targeting admin roles only, ensuring MFA cannot be bypassed.

These policies work together to enforce strong identity assurance, device trust, and contextual access decisions.
