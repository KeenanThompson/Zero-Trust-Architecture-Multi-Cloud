# Okta Lifecycle and Provisioning Model

This document explains how Okta handles lifecycle management and provisioning for integrated services such as AWS and federated applications.

## User Lifecycle Stages

### 1. Creation
- User created manually or via CSV import.
- Assigned to baseline groups:
  - Employees
  - Contractors
  - Admins (if applicable)

### 2. Provisioning to AWS
- SCIM enabled for AWS IAM Identity Center.
- Okta groups map to AWS permission sets:
  - AWS-Admin
  - AWS-Audit
  - AWS-ReadOnly
  - AWS-S3Restricted

### 3. Attribute Management
Okta synchronizes attributes:
- email
- firstName
- lastName
- department
- groupAssignments

### 4. Access via SAML
- Okta serves as the SAML IdP.
- Users authenticate, then assume AWS roles using short-lived credentials.

### 5. Deprovisioning
- User disabled in Okta.
- SCIM removes AWS role assignments automatically.
- Any active sessions revoked.

## Governance Benefits
- Centralized group-based authorization.
- Automated provisioning and deprovisioning.
- Reduced exposure to orphaned permissions.
- Short-lived credentials ensure minimal standing privilege.
