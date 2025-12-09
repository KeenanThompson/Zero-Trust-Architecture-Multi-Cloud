# Intune Device Compliance Policies

## Enrolled Platforms
- macOS
- iOS / iPadOS
- Windows (optional for later expansion)
- Linux (tracked via compliance reporting only; no native Intune MDM)

## Compliance Policies Implemented

### macOS Compliance Rules
- FileVault disk encryption required
- Firewall enabled
- Secure password compliant with organizational rules
- System integrity verification (Gatekeeper)
- Real-time protection active (Defender for Endpoint optional)
- Device must not be jailbroken or tampered

### iOS / iPadOS Compliance Rules
- Passcode required
- Encryption enforced by iOS hardware
- Device must not be jailbroken
- Minimum OS version enforced

### Windows (Optional Mapping)
- BitLocker required
- Defender Antivirus enabled
- Firewall enabled
- Secure Boot required
- Device Health attestation verified

## Compliance Reporting
- Devices monitored through Intune Device Compliance dashboard
- Advanced Analytics and Microsoft Graph used for compliance insights
- Non-compliant devices automatically challenged via Conditional Access


