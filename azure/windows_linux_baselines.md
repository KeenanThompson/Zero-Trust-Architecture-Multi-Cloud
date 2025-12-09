# Windows and Linux Device Baselines

This document extends Intune and configuration baselines to cover Windows and Linux endpoints used within the environment.

## Windows Device Baseline

### Enrollment
- Windows 10/11 devices added via Intune automatic registration.
- Azure AD joined or hybrid joined.

### Compliance Policies
- Secure boot required.
- TPM required where available.
- Device must not be jailbroken/rooted.
- Disk encryption: BitLocker must be enabled.
- Firewall enabled.
- Antivirus (Defender) active and healthy.
- OS version meets minimum requirements.

### Configuration Profiles
- BitLocker policy enforcing AES-XTS 256-bit.
- Firewall configuration and rule hardening.
- Credential Guard enabled.
- Basic attack surface reduction:
  - Block Office macros from Internet.
  - Enforce SmartScreen.
  - Disallow remote PowerShell for standard users.

### Monitoring
- Device health monitored via Intune and Defender.
- EDR onboarding validated in Microsoft Defender for Endpoint.

---

## Linux Device Baseline

### Enrollment
Linux is not Intune-native, so control is applied through:
- CrowdStrike Linux sensor installation.
- Local OS-hardening scripts (e.g., SSH, UFW, auditd).
- Manual or scripted compliance verification.

### Compliance Requirements
- SSH configured with:
  - Password authentication disabled.
  - Key-based authentication only.
  - Fail2ban or equivalent guard.
- Firewall enabled (UFW or firewalld).
- Automatic updates enabled.
- root login disabled.
- Auditd enabled and collecting:
  - Auth events.
  - Privileged command usage.
  - File modification attempts.

### Monitoring and Telemetry
- CrowdStrike collects:
  - Process execution
  - Lateral movement attempts
  - Network anomalies
  - Privilege escalation patterns
- Sysmon for Linux optional for deeper telemetry.

### Logging
- Linux system logs forwarded locally or reviewed manually.
- Alerts generated through EDR for high-risk behavior.

---

## Summary

Windows devices rely heavily on Intune and Defender for baseline enforcement.  
Linux relies on local hardening + CrowdStrike telemetry.  
Both contribute to the Zero Trust security posture through strong configuration, restricted privilege, and continuous monitoring.
