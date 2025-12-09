### Checks firewall status
### Checks disk encryption
### Checks guest account
### Checks SSH settings (Linux)
### Prints results

#!/bin/bash

echo "=== macOS Hardening Check ==="

echo "[1] Firewall Status:"
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate

echo "[2] FileVault Status:"
fdesetup status

echo "[3] Gatekeeper (App Download Restriction):"
spctl --status

echo "[4] Guest Account Enabled:"
defaults read /Library/Preferences/com.apple.loginwindow GuestEnabled

echo "[5] Automatic Login:"
defaults read /Library/Preferences/com.apple.loginwindow autoLoginUser

echo "[6] System Integrity Protection:"
csrutil status

echo "[7] Security Updates Auto-Install:"
defaults read /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload
defaults read /Library/Preferences/com.apple.commerce AutoUpdate
defaults read /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall

echo "=== Check Complete ==="

