# Okta SSO and SCIM Integration

## Integrations Implemented

- Okta acting as an IdP for selected applications.
- Okta SAML integration with AWS.
- Federation between Entra ID and Okta.
- SCIM provisioning configured where supported for test users and roles.

## SAML Configuration Highlights

- SAML application created in Okta.
- Assertion Consumer Service (ACS) URL and Entity ID configured according to the service (e.g., AWS, custom app).
- X.509 certificate provided by the IdP and imported where required.
- Attribute mappings set for:
  - NameID (usually user principal name or email).
  - Given name and surname.
  - Group or role attributes used to map to AWS IAM roles or app roles.

## SCIM Provisioning

- SCIM endpoint configured for automatic user and group provisioning where supported.
- Basic tests executed:
  - Create user in Okta → user appears in downstream system.
  - Deactivate user in Okta → deprovisioning occurs downstream.

This integration demonstrates identity lifecycle and SSO patterns using Okta in conjunction with other identity providers and cloud platforms.
