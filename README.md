# Zero-Trust-Architecture-Multi-Cloud

This repository documents a complete Zero Trust security architecture spanning Microsoft 365, Entra ID, AWS, Okta, endpoint security platforms, and supporting automation. 
This workflow demonstrates the design, implementation, and validation of modern identity centric and cloud centric security controls across multiple platforms.

Each section provides configuration references, design decisions, diagrams, and scripts used to implement and validate the architecture.

---

## Objectives of the Architecture

1. Build a functional identity and access security foundation.
2. Integrate Microsoft 365, Entra ID, device compliance, and conditional access.
3. Implement AWS account baseline security (IAM, GuardDuty, CloudTrail, Config, Security Hub).
4. Configure endpoint and user protection via CrowdStrike and platform security settings.
5. Integrate Okta for SSO and lifecycle automation.
6. Create automation scripts that support auditing and configuration validation.
7. Document end-to-end architecture for presentation and review.

---

## Identity Security (Entra ID)

- Entra tenant creation.
- MFA enforced for all users.
- Legacy authentication blocked.
- Conditional Access policies created:
  - Require MFA for all users.
  - Require compliant device for access.
  - Geo-blocking and trusted location enforcement.
  - Administrative role protection.
  - Break-glass account protections.
- Authentication strength policies created.
- Identity risk policies configured.
- Device compliance integrated with Conditional Access.
- Okta configured for SAML SSO and basic identity routing.

---

## Endpoint Security

- CrowdStrike Falcon deployed on macOS and mobile devices.
- Prevention policy customized and applied.
- IOA rule created and validated.
- Telemetry and detections reviewed.
- macOS enrolled in Intune with compliance and configuration profiles.
- Device risk posture enforced through Conditional Access.

---

## AWS Security Baseline

- GuardDuty enabled across regions.
- CloudTrail enabled with S3 log storage.
- Config enabled with core rules.
- Security Hub enabled with CIS and foundational best practices.
- IAM roles created:
  - Read-only auditor
  - CloudTrail administrator
  - Operations administrator
- Permissions boundaries tested.
- IAM audit script created (Python):
  - Detect users without MFA
  - Detect old access keys
  - Detect publicly accessible buckets
- Login protection and service restrictions implemented.

---

## Automation and SaaS Hardening

- Python automation scripts created for IAM auditing.
- macOS configuration audit script created for local security controls.
- Okta integrated with AWS through SAML.
- SCIM provisioning enabled where supported.
- Documentation established for:
  - Identity flows
  - Access control decisions
  - Conditional Access logic
  - AWS permission models
  - Device trust posture

---

## What This Repository Contains

- Documentation for each platform and security control.
- Architecture explanations for identity, endpoint, and cloud systems.
- Scripts for auditing IAM and device-level controls.
- Configuration notes for AWS, Entra ID, Okta, and CrowdStrike.
- A structured reference for how zero-trust access and continuous verification are enforced across environments.

This repository demonstrates the ability to design, implement, secure, and integrate multi-cloud and identity-driven environments using practical security engineering methods.

---

## Future Enhancements

- Expanded automation scripts for cloud configuration auditing.
- Infrastructure-as-Code templates (optional future addition).
- Additional endpoint baselines for Windows and Linux.
- Integration notes for SIEM ingestion.

---

## License

This project is provided for demonstration, reference, and educational purposes.
