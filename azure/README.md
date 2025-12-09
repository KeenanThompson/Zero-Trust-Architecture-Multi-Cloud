# Intune Device Compliance and Baselines

Enrolled Platforms:
- macOS
- iOS / iPadOS
- Windows 11
- Linux (manual reporting, but included for completeness)

Compliance Policies:
- Disk encryption required (FileVault / BitLocker)
- Firewall must be enabled
- Password complexity required
- System integrity and OS version checks

Configuration Profiles:
- macOS firewall
- macOS FileVault enforcement
- macOS Gatekeeper (App Store + identified developers)
- macOS login window restrictions
- Windows Defender configuration baseline
- Windows BitLocker baseline
- Linux CIS manual hardening (documented in /scripts)

Additional Features:
- Company Portal enrollment
- Advanced analytics access configured
- Device compliance reporting enabled

# Microsoft 365 Security Controls

Configured:
- Safe Attachments
- Safe Links
- Anti-phishing policies
- Anti-spam rules
- DKIM enabled
- SPF and DMARC validated
