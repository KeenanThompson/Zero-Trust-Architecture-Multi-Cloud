# AWS Logging and Monitoring Architecture

This document describes how logging and monitoring are configured in AWS.

## Core Services

### 1. AWS CloudTrail

- CloudTrail enabled to record:
  - Management events (control plane).
  - Read and write actions.
- Logs delivered to:
  - Dedicated S3 bucket for CloudTrail logs.
- Key configuration:
  - Log file validation enabled where applicable.
  - Multi-region coverage to avoid blind spots.

### 2. AWS Config

- AWS Config enabled to track:
  - Resource configuration history.
  - Configuration changes over time.
- Rules enabled to check for:
  - Root account MFA enabled.
  - Public S3 buckets.
  - Unrestricted security groups (where configured).
- Configuration history stored and can be tied into Security Hub.

### 3. Security Hub

- Security Hub enabled with:
  - CIS AWS Foundations Benchmark.
  - AWS Foundational Security Best Practices.
- Findings aggregated from:
  - GuardDuty.
  - Config rules.
  - Other participating services.
- Dashboards used to:
  - Monitor compliance status.
  - Track security posture over time.

### 4. GuardDuty

- GuardDuty enabled for:
  - IAM anomaly detection.
  - EC2, EKS, and VPC-level findings.
  - S3 access anomaly detection (where configured).
- Findings integrated into Security Hub.

## Log Storage and Access

- S3 buckets used for:
  - CloudTrail logs.
  - Config snapshots.
- Access restricted by:
  - IAM roles and policies for read access.
  - Deny policies to prevent public access.
- Lifecycle policies can be applied for:
  - Archival.
  - Retention management.

## Consumption and Analysis

- Security teams or admin roles can:
  - Query CloudTrail via the AWS console or Athena.
  - Review Security Hub findings.
  - Investigate GuardDuty alerts.
- Logs and findings can be:
  - Exported for external SIEM correlation.
  - Used to validate controls against frameworks like NIST 800-171.

This architecture ensures that all significant AWS activity is captured, retained, and surfaced through centralized security views.
