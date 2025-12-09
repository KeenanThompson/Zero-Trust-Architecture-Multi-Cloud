```md
# Linux Endpoint Security and Telemetry

This document describes the security and telemetry approach for Linux hosts in this environment.

## Core Security Controls

### 1. SSH and Access

- Key-based authentication preferred over passwords.
- Root login over SSH disabled.
- SSH configuration hardened to use modern ciphers and protocols.

### 2. Local Firewall

- ufw enabled with:
  - Default deny inbound.
  - Explicit allow rules for required services only.
- Outbound traffic allowed by default, with the option to restrict sensitive services.

### 3. System and Security Logging

- rsyslog configured to collect:
  - auth.log
  - syslog
  - kernel messages (where relevant).
- Logs retained locally and can be forwarded to a SIEM.

### 4. Auditd

- auditd enabled to monitor:
  - Privileged commands.
  - Critical file access.
  - Authentication and session changes.
- Audit rules tuned for:
  - sudo activity.
  - Process execution patterns of interest.

## EDR Strategy

- Near-term:
  - Rely on auditd and system logs as primary telemetry.
- Extension path:
  - Deploy a Linux EDR agent such as CrowdStrike.
  - Use EDR for process lineage, file access, and detection rules.

## Cloud and Identity Integration

- Linux hosts use:
  - IAM roles and keys for AWS CLI access where needed.
  - SSH key management controls for admin access.
- Authentication limited to:
  - Known users.
  - Managed keys.

Linux serves as a hardened host platform with strong logging and auditing, ready to be extended with EDR as needed.
