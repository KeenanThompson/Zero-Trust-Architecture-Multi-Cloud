# Compliance Overview

This document summarizes how the architecture, identity controls, cloud guardrails, and endpoint security measures align to common security and compliance frameworks, including NIST 800-171, NIST CSF, and Zero Trust principles.  
It provides a high-level view of the implemented safeguards without repeating the detailed control mappings documented in *nist_800-171_mapping.md*.

---

## 1. Identity & Access Compliance

**Relevant Framework Areas:**  
- NIST 800-171 (3.1 Access Control, 3.5 Identification & Authentication)  
- NIST CSF (PR.AC, PR.AA)  
- Zero Trust: “Verify Explicitly”

**Implemented Controls:**  
- MFA enforced for all users and privileged roles.  
- Phishing-resistant authentication (FIDO2/passkeys).  
- Conditional Access enforcement using:  
  - Device compliance  
  - Sign-in risk  
  - User risk  
  - Geographic restrictions  
  - Authentication Strength policies  
- Break-glass accounts with strict isolation.  
- Legacy authentication fully disabled.  

**Outcome:**  
Identity decisions rely on strong authentication, contextual signals, and modern access control measures that reduce password-based risk and enforce least privilege across all systems.

---

## 2. Device & Endpoint Compliance

**Relevant Framework Areas:**  
- NIST 800-171 (3.7 System Maintenance, 3.13 System & Communications Protection)  
- NIST CSF (PR.IP, PR.PT)  
- Zero Trust: “Assume Breach” / “Trust Requires Verification”

### macOS  
- Full-disk encryption (FileVault).  
- Firewall enabled.  
- Gatekeeper and software integrity controls.  
- Intune compliance + configuration baselines.  
- Defender for Endpoint telemetry.  
- CrowdStrike prevention and visibility.

### Windows  
- BitLocker encryption.  
- Defender AV + EDR.  
- Firewall enforcement.  
- Hardening baselines applied.  

### Linux  
- Hardening and auditing applied manually or via scripts.  
- CrowdStrike sensor deployed where supported.  
- SSH and authentication hardened.  

**Outcome:**  
Devices cannot access corporate applications unless they meet encryption, security configuration, and telemetry requirements. This reduces attack surface and ensures endpoint trust at authentication.

---

## 3. Cloud Security & AWS Compliance

**Relevant Framework Areas:**  
- NIST 800-171 (3.3 Audit and Accountability, 3.13 System Protection)  
- NIST CSF (DE.AE, PR.PT, PR.DS)  
- Zero Trust: “Assume Breach”

**Implemented Controls:**  
- GuardDuty enabled across all regions.  
- CloudTrail logging with log-protection guardrails.  
- AWS Config with CIS/AWS foundational rules.  
- Security Hub with CIS + AWS Benchmarks.  
- IAM roles built on least-privilege principles.  
- SCP/guardrails preventing disabling of logging.  

**Outcome:**  
AWS environments maintain continuous logging, configuration monitoring, and managed threat detection, preventing unseen drift and enforcing essential operational guardrails.

---

## 4. SaaS & Federation Compliance

**Relevant Framework Areas:**  
- NIST 800-171 (3.1, 3.5)  
- Zero Trust: “Use least privilege” / “Continuous monitoring”

**Implemented Controls:**  
- Okta ↔ Entra ID federation using SAML.  
- SCIM provisioning for role-based AWS access.  
- GitHub SAML SSO onboarding.  
- Strict role and group mapping for access control.  

**Outcome:**  
SaaS authentication is scoped via identity provider policy, eliminating standalone credential silos and centralizing access governance.

---

## 5. Logging, Monitoring, and Detection

**Relevant Framework Areas:**  
- NIST 800-171 (3.3 Audit & Accountability, 3.14 System Monitoring)  
- NIST CSF (DE.CM, DE.AE)  
- Zero Trust: “Assume Breach”

**Implemented Controls:**  
- Entra ID sign-in and audit logs.  
- AWS CloudTrail → Security Hub pipeline.  
- AWS GuardDuty anomalies.  
- Endpoint telemetry from CrowdStrike and Defender.  
- Centralized visibility across identity, device, and cloud events.  

**Outcome:**  
Security teams can detect anomalous activity across endpoint, identity, and cloud layers, ensuring rapid investigation and containment.

---

## 6. Configuration & Change Governance

**Relevant Framework Areas:**  
- NIST 800-171 (3.4 Configuration Management)  
- NIST CSF (PR.IP-1, PR.IP-3)

**Implemented Controls:**  
- AWS Config rules across all monitored resources.  
- Enforcement of device configuration baselines in Intune.  
- SCP guardrails ensuring immutable logging.  

**Outcome:**  
Misconfigurations are detected early, configuration drift is minimized, and essential protections cannot be bypassed.

---

## Summary

This architecture applies layered security controls across identity, device, cloud, and SaaS systems, producing a Zero Trust–aligned environment consistent with modern compliance expectations.  
Each control area contributes to a defensible security posture through visibility, strong authentication, device trust, continuous monitoring, and hardened cloud guardrails.

