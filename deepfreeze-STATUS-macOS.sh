#!/bin/bash
# Created by MVG (@PBandJamf) for Choate Rosemary Hall
# Queries Deep Freeze status and returns either Frozen, Thawed, or "Not Installed"

# CHANGELOG

# Version 1.2.0
# - Further refined status interpretation

# Version 1.1.0
# - Using the /usr/local binary now instead.
# - Fine-tuned the status code interpretation logic.

# Version 1.0.0
# - Initial release

# Get Deep Freeze status
STATUS_CODE=$(/usr/local/bin/deepfreeze status --thawed 2>/dev/null)

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

# Output as an XML for Jamf Pro Extension Attribute
cat <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<result>$STATUS</result>
EOF