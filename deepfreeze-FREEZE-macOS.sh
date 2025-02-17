#!/bin/bash

# Created by MVG (@PBandJamf) for Choate Rosemary Hall
# Bash script to freeze a Mac with Deep Freeze installed.

# -------------------------------------------
# CHANGELOG
#
# Version 1.0.1
# - Updated status check to use "deepfreeze status --thawed".
# Version 1.0.0
# - Initial release.
# -------------------------------------------

# Check if Deep Freeze is installed
if ! command -v deepfreeze &> /dev/null; then
    echo "Deep Freeze command not found. Exiting."
    exit 1
fi

# Check if the computer is already frozen
status=$(deepfreeze status --thawed)
if [[ "$status" == "Frozen" ]]; then
    echo "Computer is already frozen. Exiting."
    exit 0
fi

# Freeze the computer
echo "Freezing the computer..."
deepfreeze freeze --computer

# Check for success
if [[ $? -eq 0 ]]; then
    echo "Computer has been frozen successfully."
else
    echo "Failed to freeze the computer."
    exit 1
fi
