#!/bin/bash
# Created by MVG (@PBandJamf) for Choate Rosemary Hall
# Queries Deep Freeze status and returns either Frozen, Thawed, or "Not Installed"

# CHANGELOG

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

# Get Deep Freeze status
STATUS_OUTPUT=$(/usr/local/bin/deepfreeze status --thawed 2>/dev/null)

# Remove any leading/trailing whitespace from the output
STATUS_OUTPUT=$(echo "$STATUS_OUTPUT" | xargs)

# Interpret status output
case "$STATUS_OUTPUT" in
    "Thawed")
        STATUS="Thawed"
        ;;
    "Thawed but restart required")
        STATUS="Thawed but restart required"
        ;;
    "Frozen")
        STATUS="Frozen"
        ;;
    *)
        STATUS="Error: Unknown status ($STATUS_OUTPUT)"
        ;;
esac

# Output status as a simple text string
echo "$STATUS"