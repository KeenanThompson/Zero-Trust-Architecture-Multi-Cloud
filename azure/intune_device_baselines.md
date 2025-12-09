# File: azure/intune_device_baselines.md

# Intune Device Compliance and Configuration Baselines

## Enrolled Platforms

- macOS
- iOS/iPadOS
- Windows (where supported in the lab)
- Linux (tracked and hardened, but not enrolled via Intune; managed through local baselines and scripts)

## Compliance Policies

Applied via Intune where supported (macOS, iOS/iPadOS, Windows):

- Disk encryption required (FileVault on macOS, BitLocker where available on Windows).
- Firewall enabled.
- Secure password/passcode policies.
- OS version and system integrity checks where available.

Linux:

- Local hardening and audit configuration managed outside Intune using scripts and system settings.

## Configuration Profiles (Intune)

macOS:

- Firewall configuration profile.
- FileVault enforcement profile.
- Gatekeeper-related application execution settings.
- Login window and basic security restrictions.

iOS/iPadOS:

- Basic device compliance checks.
- Enrollment via Company Portal application.

Windows:

- Enrollment and basic compliance checks where possible.

## Additional Features

- Company Portal used for enrollment and user-driven device registration.
- Reporting and visibility through:
  - Device compliance reports.
  - Endpoint analytics and advanced analytics where licensed.

This gives a realistic cross-platform baseline: Apple and Windows devices via Intune, and Linux documented via host-level hardening.
