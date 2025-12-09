# AWS Guardrails and IAM Controls

This document describes the identity-centric guardrails used to protect logging and core security services.

## Logging Protection Policy

An IAM policy is used to prevent accidental or malicious disabling of key logging and detection services.

Example policy attached to administrative roles:

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
      "Sid": "DenyDisableGuardDuty",
      "Effect": "Deny",
      "Action": [
        "guardduty:DeleteDetector",
        "guardduty:UpdateDetector"
      ],
      "Resource": "*"
    }
  ]
}
