# Authentication and Authorization Data Flow

1. User attempts login from device.
2. Entra ID evaluates:
   - MFA requirement
   - Device compliance
   - Sign-in risk
   - Location controls
   - Authentication strength
3. Okta or Entra federates SAML/SCIM to SaaS or AWS.
4. AWS applies IAM role-based access.
5. Logging is collected through CloudTrail, GuardDuty, and M365 logs.
6. CrowdStrike provides endpoint telemetry and prevention data.
