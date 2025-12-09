# AWS Guardrails and Service Control Policies (SCP)

This document outlines identity-centric and logging-centric guardrails used to strengthen AWS account security. 
The implementation uses IAM policies and (optionally) SCPs in AWS Organizations. 
If SCPs are not supported (due to single-account or free-tier limitations), apply these as IAM policies instead.

------------------------------------------------------------
1. Logging Protection Guardrail
Prevents disabling or deleting logging services.

Policy:
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyStopCloudTrail",
      "Effect": "Deny",
      "Action": [
        "cloudtrail:StopLogging",
        "cloudtrail:DeleteTrail"
      ],
      "Resource": "*"
    },
    {
      "Sid": "DenyGuardDutyDisable",
      "Effect": "Deny",
      "Action": [
        "guardduty:DeleteDetector",
        "guardduty:UpdateDetector"
      ],
      "Resource": "*"
    }
  ]
}
```
Purpose:
- Ensures CloudTrail and GuardDuty cannot be disabled.
- Protects forensic visibility.
- Aligns with NIST 800-171 logging requirements.

------------------------------------------------------------
2. Root Account Restrictions
Root must not perform daily operations.

Recommended settings:
- Require MFA for root
- Block creating new access keys
- Prevent root from accessing IAM except break-glass scenarios

Optional SCP (use IAM if SCP unavailable):
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyRootActions",
      "Effect": "Deny",
      "Action": "*",
      "Principal": {
        "AWS": "arn:aws:iam::<ACCOUNT-ID>:root"
      },
      "Condition": {
        "BoolIfExists": {
          "aws:MultiFactorAuthPresent": "false"
        }
      }
    }
  ]
}
```
------------------------------------------------------------
3. Region Control Guardrail (Optional)
Restrict resource creation to approved AWS regions.

IAM example:
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyUnsupportedRegions",
      "Effect": "Deny",
      "Action": "*",
      "Resource": "*",
      "Condition": {
        "StringNotEquals": {
          "aws:RequestedRegion": [
            "us-east-1",
            "us-west-2"
          ]
        }
      }
    }
  ]
}
```
------------------------------------------------------------
4. Enforced Use of IAM Roles
Blocks IAM user access keys unless explicitly allowed.

Policy:
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyAccessKeyCreation",
      "Effect": "Deny",
      "Action": [
        "iam:CreateAccessKey",
        "iam:UpdateAccessKey"
      ],
      "Resource": "*"
    }
  ]
}
```
Purpose:
- Encourages SSO, federation, and role-based access.
- Eliminates long-lived credentials.

------------------------------------------------------------
5. S3 Public Access Guardrail

Ensure no bucket becomes publicly accessible.

Policy:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyPublicS3",
      "Effect": "Deny",
      "Action": [
        "s3:PutBucketAcl",
        "s3:PutBucketPolicy",
        "s3:PutObjectAcl"
      ],
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "s3:x-amz-acl": [
            "public-read",
            "public-read-write"
          ]
        }
      }
    }
  ]
}
```
------------------------------------------------------------
6. Required Logging Baseline

Your AWS environment includes:
- CloudTrail enabled (multi-region)
- GuardDuty enabled
- AWS Config enabled
- S3 logging buckets with restricted access
- Security Hub with CIS + AWS Foundational Benchmarks

These guardrails reinforce and protect those services by ensuring:
- Logs cannot be disabled
- Monitoring cannot be turned off
- Public exposure is prevented
- IAM access remains least-privilege

------------------------------------------------------------
Resulting Posture

These guardrails enforce mandatory controls for identity, logging, monitoring, and policy compliance. 
They create a defensive baseline aligned with Zero Trust principles and NIST 800-171, without requiring complex infrastructure or automation.
