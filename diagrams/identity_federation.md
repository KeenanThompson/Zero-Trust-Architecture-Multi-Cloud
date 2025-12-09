### Identity Federation and Access Flow Diagram

---

```markdown

This diagram focuses on how authentication and authorization flow across Entra ID, Okta, AWS, and SaaS applications.

## Actors

- Users on:
  - macOS (Intune + Defender + CrowdStrike)
  - Windows
  - Linux
  - iOS/iPadOS

- Identity Providers:
  - Entra ID
  - Okta

- Targets:
  - Microsoft 365
  - SaaS applications (SAML/OIDC)
  - AWS (via SAML roles)

## Flow 1: Entra ID Direct Access

1. User accesses a Microsoft 365 app or Entra-protected SaaS app.
2. Entra enforces:
   - MFA
   - Device compliance (Intune)
   - Risk and location-based Conditional Access
   - Authentication strength (FIDO2, passwordless + MFA)
3. On success, Entra issues a token.
4. Application authorizes access using roles/claims in the token.

## Flow 2: Entra → Okta Federation

1. User authenticates to Entra ID.
2. Entra applies Conditional Access and strong auth.
3. Entra issues a token to Okta as a federated IdP or app.
4. Okta uses that identity:
   - To provide SAML/OIDC to downstream SaaS.
   - To drive group-based access and SCIM provisioning.

## Flow 3: Okta → AWS (SAML)

1. User initiates AWS console access from Okta.
2. Okta sends SAML assertion to AWS.
3. AWS IAM maps SAML attributes (groups/roles) to IAM roles:
   - Admin
   - Audit_Viewer
   - Incident_Response_Admin
   - OpsAdmin
   - S3RestrictedAccess
4. User receives short-lived console session with least-privilege access.

## Flow 4: Entra → AWS (Alternative Path)

1. Entra ID acts as SAML IdP for AWS.
2. Conditional Access runs before token issuance.
3. SAML assertion maps to IAM roles similar to Okta flow.
4. IAM enforces least privilege in AWS.

## Mermaid Sketch

```mermaid
sequenceDiagram
  participant User
  participant Device
  participant Entra as Entra ID
  participant Okta
  participant AWS
  participant SaaS

  User->>Device: Sign-in from macOS/Windows/Linux/iOS
  Device->>Entra: Auth request (MFA, device state, location)
  Entra-->>Device: Token (if CA passed)

  alt Direct M365 / SaaS
    Device->>SaaS: Token from Entra
    SaaS-->>User: Access granted
  else Entra to Okta
    Device->>Okta: Token from Entra
    Okta->>SaaS: SAML/OIDC assertion
    SaaS-->>User: Access granted
  end

  User->>Okta: Request AWS access
  Okta->>AWS: SAML assertion (roles/groups)
  AWS-->>User: Temporary console access
