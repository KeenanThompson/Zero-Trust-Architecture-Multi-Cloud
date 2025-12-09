# NIST 800-171 Control Mapping

This document maps implemented controls in the lab environment to the corresponding NIST 800-171 requirements.

--------------------------------------------------
Control 3.1.2  
"Authenticate users with multi-factor authentication."

Implementation:
- Enforced via Microsoft Entra Conditional Access for all identities.
- MFA also required for AWS IAM access.
- Passkeys and phishing-resistant authentication configured.

--------------------------------------------------
Control 3.3.1  
"Audit logging and monitoring."

Implementation:
- AWS CloudTrail enabled across all regions and stored in S3.
- Microsoft 365 unified audit log enabled.
- Intune device compliance audit events captured.
- Optional forwarding to Splunk for analysis.

--------------------------------------------------
Control 3.4.2  
"Least privilege enforced."

Implementation:
- AWS IAM roles designed with restricted permissions.
- Conditional Access restricts admin role sign-ins.
- Entra ID Privileged Role settings enforce MFA and limited access.
- CrowdStrike and Defender enforce application execution policies.

--------------------------------------------------
Control 3.13.11  
"Detect and respond to anomalous behavior."

Implementation:
- AWS GuardDuty provides account anomaly detection.
- Microsoft Entra sign-in risk policies detect impossible travel and atypical behavior.
- Device-level anomalies monitored through Defender for Endpoint and CrowdStrike.

--------------------------------------------------
Control 3.14.6  
"System security configurations and baselines."

Implementation:
- macOS and iOS enforced with Intune compliance policies.
- FileVault, firewall, and Gatekeeper settings enforced.
- Windows and Linux can be added as optional platforms for extended compliance coverage.

