Get-MpComputerStatus | Select-Object AMServiceEnabled, RealTimeProtectionEnabled
(Get-BitLockerVolume -MountPoint "C:").VolumeStatus
Get-NetFirewallProfile | Select-Object Name, Enabled
