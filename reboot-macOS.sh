#!/bin/bash

###########################################
# macGetsThe(re)Boot
# Created by MVG (@PBandJamf) for Choate Rosemary Hall
# Script to reboot the Mac via Jamf Pro policy and log the operation.
# Meant to be used in conjunction with the "Deep Freeze: Thaw Computer" policy (or any Macs that are in the relevant related Smart Group).
###########################################
# CHANGELOG

# Version 1.1.0
# - Added 20-second timeout and user message
# Version 1.0.0
# - Initial release
###########################################
# START

# Logging setup
LOGFILE="/var/log/reboot_mac.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")
echo "[$DATE] - Reboot script started." >> $LOGFILE

# Display a message to the user
osascript -e 'display dialog "The system will reboot in 20 seconds. Save your work." buttons {"OK"} default button 1 with icon stop'

# Wait for 20 seconds (timeout) for the user to acknowledge
sleep 20

# Reboot command
echo "[$DATE] - Rebooting the system..." >> $LOGFILE
/usr/sbin/shutdown -r now

# Log reboot initiated
echo "[$DATE] - Reboot initiated." >> $LOGFILE
echo "[$DATE] - Reboot script finished." >> $LOGFILE

exit 0
###########################################
