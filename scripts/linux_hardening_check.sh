#!/bin/bash
echo "Firewall:"
sudo ufw status
echo "Disk Encryption (LUKS check):"
lsblk -f
echo "SELinux/AppArmor:"
sudo aa-status 2>/dev/null || sudo getenforce 2>/dev/null
