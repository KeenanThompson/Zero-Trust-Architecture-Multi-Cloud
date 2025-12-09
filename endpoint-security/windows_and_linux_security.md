# Windows and Linux Endpoint Security Controls

This document covers the security tools, hardening controls, and monitoring used on Windows and Linux endpoints.

## Windows Endpoint Security

### Defender for Endpoint
- Real-time protection enabled.
- Cloud-delivered protection active.
- Automatic sample submission on.
- Endpoint detection and response enabled.

### Attack Surface Reduction
- Block Office macros from Internet.
- Block executable content from email/webmail.
- Block credential theft (LSASS protection).
- Controlled folder access (optional for lab use).

### Hardening Controls
- Firewall enforced.
- BitLocker full-disk encryption.
- Local admin removed for standard users.
- Remote PowerShell restricted.

### Monitoring
- Defender EDR provides:
  - Process tree traces
  - Network call telemetry
  - Alert investigation timelines

---

## Linux Endpoint Security

### CrowdStrike Falcon Sensor
- Provides behavioral detection:
  - Suspicious shell activity
  - Lateral movement attempts
  - Privilege escalation indicators
  - Network anomalies

### Hardening
- SSH locked down:
  - No password login
  - No root login
  - Fail2ban active
- Firewall rules established.
- SELinux or AppArmor enforced (depending on distro).
- Automatic security updates enabled.

### Logging
- auditd logs privileged commands and authentication changes.
- System logs available for manual review.

### Monitoring Summary
CrowdStrike provides continuous behavioral monitoring, while hardening and logging controls limit the attack surface and support detection.
