#!/bin/bash

# Created by MVG (@PBandJamf) for Choate Rosemary Hall
# Bash script to thaw a Mac with Deep Freeze installed.

# -------------------------------------------
# CHANGELOG
#
# Version 1.0.1
# - Added handling for "Thaw (restart required)" status after thaw command.
# Version 1.0.0
# - Initial release.
# -------------------------------------------

# Check if Deep Freeze is installed
if ! command -v deepfreeze &> /dev/null; then
    echo "Deep Freeze command not found. Exiting."
    exit 1
fi

# Check if the computer is already thawed
status=$(deepfreeze status --thawed)
if [[ "$status" == "Thawed" ]]; then
    echo "Computer is already thawed. Exiting."
    exit 0
fi

# Thaw the computer
echo "Thawing the computer..."
deepfreeze thaw --computer

# Check for success and reboot status
status_after_thaw=$(deepfreeze status --thawed)
if [[ "$status_after_thaw" == "Thaw (restart required" ]]; then
    echo "Computer has been thawed successfully, but a restart is required to complete the thaw process. Please reboot the machine manually."
else
    echo "Failed to thaw the computer."
    exit 1
fi
