# AWS Logging and Monitoring Architecture

This file documents the full monitoring stack implemented in AWS to support Zero Trust detection and auditability.

## CloudTrail Configuration
- Organization-style trail simulated for a single account.
- Logs all management and data events.
- S3 bucket hardened:
  - Block public access
  - Access logging enabled
  - Versioning enabled

## AWS Config
- Tracks configuration drift for:
  - IAM policies
  - Security groups
  - S3 bucket ACLs
  - CloudTrail status
- Integrated with Security Hub.

## GuardDuty
- Enabled in all available regions.
- Findings include:
  - Unauthorized access attempts
  - DNS exfiltration
  - Compromised IAM role usage
  - EC2 port scanning (simulated)

## Security Hub
Frameworks enabled:
- CIS AWS Foundations Benchmark
- AWS Foundational Security Best Practices

Findings aggregated from:
- GuardDuty
- Config
- IAM Access Analyzer
- S3 public access checks

## IAM Access Analyzer
- Monitors cross-account and external resource access.
- Alerts for unintended exposure.

## Logging Summary
AWS logs feed into:
- CloudTrail S3 bucket
- CloudWatch Logs for runtime visibility
- GuardDuty console
- Security Hub unified findings

This creates a multilayer detection and audit system aligned to Zero Trust monitoring requirements.
