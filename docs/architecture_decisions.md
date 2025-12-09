# Architecture Decision Record

This document captures the major architectural decisions across the multi-cloud Zero Trust implementation.

## Decision 1: Entra ID as Primary Identity Provider
Rationale:
- Strong Conditional Access capabilities.
- Integrated passwordless authentication.
- Risk-based identity protection.

Impact:
- All authentication originates from Entra or passes through it.
- Okta operates as a federated identity hub where needed.

---

## Decision 2: Okta for AWS Federation
Rationale:
- Clean mapping of Okta groups to AWS IAM Identity Center permission sets.
- SCIM support simplifies JIT provisioning and deprovisioning.

Impact:
- AWS access becomes short-lived, role-based, and centrally governed.

---

## Decision 3: GuardDuty + CloudTrail + Config for AWS Monitoring Stack
Rationale:
- Provides baseline Zero Trust detection.
- Ensures auditability for configuration drift and API actions.

Impact:
- All AWS activity becomes fully logged and continuously evaluated.

---

## Decision 4: Intune as Device Compliance Engine
Rationale:
- macOS, iOS, and Windows baselines centrally enforced.
- Device posture directly influences Conditional Access.

Impact:
- Access is dynamically restricted based on device health and security status.

---

## Decision 5: Endpoint EDR (CrowdStrike + Defender)
Rationale:
- Combined behavioral and signature-based detection increases coverage.
- Multi-platform support (macOS, Windows, Linux).

Impact:
- Endpoints generate actionable telemetry feeding into identity and cloud decisions.

---

## Decision 6: Zero Trust as the Overarching Model
Rationale:
- Identity, device, network, and workload validation required for every access.

Impact:
- Minimizes lateral movement.
- Reduces reliance on perimeter security.
