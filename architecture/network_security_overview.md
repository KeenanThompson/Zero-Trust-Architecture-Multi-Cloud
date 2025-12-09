# Network Security Overview

This document provides a detailed view of how network security controls are applied across AWS, Microsoft 365, Entra ID, Okta, and endpoints. The design follows Zero Trust principles, focusing on segmentation, explicit verification, and minimizing lateral movement.

## Core Objectives
- Restrict all unnecessary network pathways.
- Enforce identity-aware access to cloud resources.
- Protect remote devices and roaming users.
- Detect and block anomalous or unauthorized activity.
- Maintain auditability for all network-layer decisions.

## AWS Network Controls

### Virtual Private Cloud (VPC) Structure
- Separate VPCs used to simulate segmentation:
  - Management VPC (IAM, logging sinks)
  - Application / workload VPC
  - Security tooling VPC (GuardDuty, Security Hub data flows)

### Subnet Isolation
- Public subnets: Only for required ingress/egress (NAT, bastion).
- Private subnets: All workloads; default deny inbound.

### Routing Rules
- East–west traffic restricted using security groups.
- Internet egress routed through controlled NAT paths.
- No direct inbound access without explicit security group rules.

### Security Groups
- Least-privilege inbound/outbound.
- Administrative access only via IAM + SSM Session Manager.
- No open ports exposed to 0.0.0.0/0 unless explicitly required.

### Network ACLs
- Optional layer of stateless filtering.
- Used to enforce coarse-grain segmentation and block known-bad IP space.

### DNS Security
- Route53 Resolver integrated with GuardDuty DNS protection.
- DNS query logging enabled for threat analysis.

### AWS Security Services Supporting Network Controls
- **GuardDuty**: DNS anomaly detection, port scanning, EC2 network attack identification.
- **VPC Flow Logs**: Layer-3/4 visibility for traffic baselines and investigations.
- **CloudTrail**: Captures network configuration changes (SG, NACL, VPC edits).

---

## Microsoft 365 / Entra ID Network Controls

### Named Locations
- Trusted GPS/IP locations defined.
- High-risk countries blocked.
- Impossible travel detection enabled.

### Conditional Access Influence
- Access permitted only from compliant devices in key scenarios.
- Authentication strength varies based on network context (trusted, unknown, high-risk).

### Secure Remote Access
- No traditional VPN dependency; identity-driven access is used.
- Device compliance + app enforced restrictions limit exposure.

---

## Okta Network Controls

### Network Zones
- IP-based grouping for conditional access in Okta.
- Used to add extra checks for SSO/SAML apps and AWS federation.

### App-Level Network Enforcement
- Okta policies ensure that high-risk apps require:
  - Strong MFA
  - Verified locations
  - No legacy protocols

---

## Endpoint Network Controls

### macOS
- Firewall enabled and enforced via Intune.
- CrowdStrike Falcon monitors:
  - Outbound network calls
  - Command-and-control patterns
  - Lateral movement indicators

### Windows
- Defender Firewall enabled.
- Network protection blocks malicious domains.
- Defender for Endpoint monitors process-driven network activity.

### Linux
- Local firewall (UFW or firewalld) configured.
- CrowdStrike Linux sensor provides:
  - Network threat detection
  - Remote command execution detection

---

## Network Visibility and Logging

### AWS
- VPC Flow Logs streamed to CloudWatch/S3.
- DNS logs collected by Route53.
- GuardDuty alerts reviewed in Security Hub.

### Entra / M365
- Sign-in logs capture IP data for all identity events.
- Audit logs capture network-related admin changes.

### Endpoint EDR
- CrowdStrike: DNS, connection attempts, suspicious traffic.
- Defender: Network events tied to process lineage.

---

## Summary

This network design enforces strong segmentation, identity-aware access, and continuous monitoring. Controls across AWS, Entra ID, Okta, and endpoints operate as a unified Zero Trust network posture: no implicit trust, full logging, and monitored pathways at every boundary.
