# Windows Endpoint Security and EDR Strategy

This document describes the current and planned state for Windows endpoint protection.

## Current Controls

### 1. Windows Defender Antivirus

- Real-time protection enabled.
- Regular signature updates.
- Scanning configured for:
  - On-access.
  - On-demand where triggered.

### 2. Windows Defender Firewall

- Firewall enabled on all profiles.
- Inbound connections restricted by default.
- Only necessary services allowed.

### 3. Account and OS Hardening

- Strong local account passwords.
- Reduced reliance on local administrator usage.
- Updates applied via Windows Update.

## EDR Strategy

Where licensing and edition allow, the following model applies:

- Microsoft Defender for Endpoint:
  - Onboard Windows devices for advanced telemetry.
  - Use device risk signals in Conditional Access.
- CrowdStrike (optional extension):
  - Deploy sensor to Windows endpoints.
  - Use policy-based control and IOA rules consistent with macOS and Linux strategy.

## Identity Integration

- Entra ID used for:
  - Sign-in protection via MFA.
  - Conditional Access policies.
- Device-based access:
  - Preferred path is to rely on compliant device posture when Intune and MDE integration are available.
