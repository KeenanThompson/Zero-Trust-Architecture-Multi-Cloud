# CrowdStrike Configuration Summary

## Devices Onboarded

- macOS endpoint
- Windows endpoint
- Linux host(s) where supported

## Policy Configuration

- Standard prevention policy applied to all lab devices.
- Enhanced telemetry/visibility options enabled where available.
- Custom Indicator of Attack (IOA) rule created to block specific behaviors, for example:
  - Blocking execution from temporary paths such as `/tmp` (Linux) or equivalent risky locations.

## Validation and Testing

- Confirmed sensors checked in and reported to the CrowdStrike portal.
- Executed benign commands and simple tests to observe process lineage and telemetry.
- Reviewed:
  - Process trees
  - Network connections
  - Basic detection results

This demonstrates endpoint hardening and detection coverage across macOS, Windows, and Linux endpoints.
