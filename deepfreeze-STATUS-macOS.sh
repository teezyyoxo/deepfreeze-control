#!/bin/bash
# Created by MVG (@PBandJamf) for Choate Rosemary Hall
# Queries Deep Freeze status and returns either Frozen, Thawed, or "Not Installed"

# CHANGELOG

# Version 1.2.3
# Added handling for presence of deepfreeze binary; exit with code 3 and print "Not installed" if not found. Else, proceed.

# Version 1.2.2
# Further refined case handling logic.

# Version 1.2.1
# - Fixed interpretation issue once and for all by adding xargs to remove leading/trailing whitespace that was resulting in blank/nonsensical output.

# Version 1.2.0a
# - Added more debugging for testing purposes (with bash -x) to identify issues with status interpretation

# Version 1.2.0
# - Further refined status interpretation

# Version 1.1.0
# - Using the /usr/local binary now instead.
# - Fine-tuned the status code interpretation logic.

# Version 1.0.0
# - Initial release
# --------
# READY? SET? GO!

# Check if Deep Freeze binary exists
if [ ! -x "/usr/local/bin/deepfreeze" ]; then
    echo "Not installed"
    exit 3
fi

# Get Deep Freeze status
STATUS_OUTPUT=$(/usr/local/bin/deepfreeze status --thawed 2>/dev/null)

# Remove any leading/trailing whitespace from the output
STATUS_OUTPUT=$(echo "$STATUS_OUTPUT" | xargs)

# Interpret status output
case "$STATUS_OUTPUT" in
    "Thawed")
        STATUS="Thawed"
        ;;
    "Thaw (restart required)"
        STATUS="Thawed, pending reboot"
        ;;
    "Frozen")
        STATUS="Frozen"
        ;;
    *)
        # Output the value
        echo "$STATUS_OUTPUT"
        ;;
esac