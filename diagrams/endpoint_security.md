### Endpoint Security Flow Diagram

##
This diagram focuses on how macOS, Windows, Linux, and iOS/iPadOS devices are secured and how signals flow.

---

```markdown

## Endpoints

- **macOS**
  - Enrolled in Intune.
  - Compliance and configuration profiles applied.
  - Defender for Endpoint installed.
  - CrowdStrike Falcon sensor installed.

- **Windows**
  - Windows 10/11 endpoint.
  - Defender Antivirus and firewall enabled.
  - Hardening baseline (local or Intune-based).
  - CrowdStrike Falcon sensor (where used).

- **Linux**
  - SSH locked down.
  - Auditd and logging configured.
  - Hardening steps enforced.
  - CrowdStrike Falcon sensor.

- **iOS/iPadOS**
  - Enrolled in Intune.
  - Compliance policy (PIN, encryption, OS version).
  - App protection policies where applicable.

## Control Flows

1. **Device Enrollment and Compliance**
   - macOS and iOS/iPadOS report compliance to Intune.
   - Windows reports compliance where enrolled.
   - Compliance state feeds into Entra Conditional Access.

2. **EDR Telemetry**
   - CrowdStrike agents send telemetry (processes, network activity, detections).
   - Defender for Endpoint on macOS sends device health and alerts.

3. **Access Decisions**
   - Entra Conditional Access uses:
     - Device compliance (from Intune).
     - Sign-in risk and user risk.
     - Authentication Strength.
   - High-risk or non-compliant devices can be blocked or forced to remediate.

4. **Monitoring and Response**
   - Alerts and detections are reviewed in the EDR portals.
   - Identity and sign-in logs are available from Entra/M365.
   - Cloud alerts originate from GuardDuty / Security Hub.

## Mermaid Sketch (Optional)

```mermaid
flowchart LR
  subgraph Endpoints
    MAC[macOS<br/>Intune + MDE + CrowdStrike]
    WIN[Windows<br/>Defender + Hardening]
    LNX[Linux<br/>Hardening + CrowdStrike]
    IOS[iOS/iPadOS<br/>Intune]
  end

  subgraph MDM[Intune]
    CMP[Compliance / Config Policies]
  end

  subgraph EDR[Endpoint Security]
    CS[CrowdStrike]
    MDE[Defender for Endpoint]
  end

  subgraph IDP[Entra ID]
    CA[Conditional Access]
  end

  MAC --> CMP
  WIN --> CMP
  IOS --> CMP

  MAC --> CS
  WIN --> CS
  LNX --> CS
  MAC --> MDE

  CMP --> CA
  CS --> CA
  MDE --> CA
