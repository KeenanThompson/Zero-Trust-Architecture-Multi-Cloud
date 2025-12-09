#!/usr/bin/env bash
set -euo pipefail

# Must be run from the root of your Git repo.

# Directories to create
dirs=(
  "azure/entra_id/conditional_access"
  "azure/entra_id/risk_policies"
  "azure/intune/macos"
  "azure/intune/ios_ipados"
  "azure/defender/mde_macos"
  "azure/defender/mde_windows"

  "aws/guardduty"
  "aws/cloudtrail"
  "aws/config"
  "aws/security_hub"
  "aws/iam/roles"
  "aws/iam/policies"
  "aws/scp"
  "aws/scripts"

  "okta/sso"
  "okta/scim"
  "okta/policies"

  "identity/zero_trust"
  "identity/runbooks"
  "identity/jml_lifecycle"

  "endpoints/crowdstrike"
  "endpoints/defender"
  "endpoints/baselines/macos"
  "endpoints/baselines/windows"

  "splunk/dashboards"
  "splunk/saved_searches"
  "splunk/onboarding"

  "docs/design"
  "docs/runbooks"
  "docs/controls_mapping"

  "diagrams/architecture"
  "diagrams/data_flows"

  "scripts/bash"
  "scripts/python"
  "scripts/powershell"
)

# Files to create with minimal placeholders
files=(
  "docs/design/architecture_overview.md"
  "docs/runbooks/incident_response_example.md"
  "docs/controls_mapping/nist_800-171_mapping.md"

  "azure/entra_id/conditional_access/README.md"
  "azure/intune/macos/README.md"
  "azure/intune/ios_ipados/README.md"
  "aws/iam/roles/README.md"
  "aws/iam/policies/README.md"
  "okta/sso/README.md"
  "identity/zero_trust/README.md"
  "endpoints/baselines/macos/README.md"
  "endpoints/baselines/windows/README.md"
  "splunk/dashboards/README.md"
)

echo "Creating directory structure..."

for d in "${dirs[@]}"; do
  mkdir -p "$d"
  # Ensure Git keeps empty dirs
  if [ ! -f "$d/.keep" ]; then
    touch "$d/.keep"
  fi
done

echo "Creating placeholder files..."

for f in "${files[@]}"; do
  if [ ! -f "$f" ]; then
    cat > "$f" <<EOF
# $(basename "$f" .md)

_TODO: Add detailed content for this area._
EOF
  fi
done

echo "Repo structure bootstrapped."

