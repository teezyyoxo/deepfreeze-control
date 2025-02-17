#!/bin/bash

###########################################
# macGetsThe(re)Boot
# Created by MVG (@PBandJamf) for Choate Rosemary Hall
# Script to reboot the Mac via Jamf Pro policy and log the operation.
# Meant to be used in conjunction with the "Deep Freeze: Thaw Computer" policy (or any Macs that are in the relevant related Smart Group).
###########################################
# CHANGELOG
# Version 1.0.0
# - Initial release
###########################################
# START

# Logging setup
LOGFILE="/var/log/reboot_mac.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")
echo "[$DATE] - Reboot script started." >> $LOGFILE

# Reboot command
echo "[$DATE] - Rebooting the system..." >> $LOGFILE
/usr/sbin/shutdown -r now

# Log reboot initiated
echo "[$DATE] - Reboot initiated." >> $LOGFILE
echo "[$DATE] - Reboot script finished." >> $LOGFILE

exit 0
###########################################