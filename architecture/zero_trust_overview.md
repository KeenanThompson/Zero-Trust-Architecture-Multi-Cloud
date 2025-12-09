# Zero Trust Architecture Overview

This document outlines the overall Zero Trust design implemented across Microsoft 365, Entra ID, AWS, Okta, and endpoint platforms.

Key Principles:
- Verify explicitly (identity, device, location, risk)
- Enforce least privilege (role-based access, conditional access)
- Assume breach (continuous monitoring, detection, and auditing)

Core Components:
- Identity as the primary control plane (Entra ID + Okta)
- Device trust via Intune and CrowdStrike
- Cloud guardrails in AWS through IAM, GuardDuty, Config, CloudTrail, Security Hub
- SaaS security via SAML, SCIM, and access policies
- Automation for consistency and auditability
