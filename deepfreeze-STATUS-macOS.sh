#!/bin/bash
# Created by MVG (@PBandJamf) for Choate Rosemary Hall

# CHANGELOG
# Version 1.1.0
# - Using the /usr/local binary now instead.
# - Fine-tuned the status code interpretation logic.

# Version 1.0.0
# - Initial release
# Queries Deep Freeze status and returns either Frozen, Thawed, or Deep Freeze Not Installed

# Get Deep Freeze status
STATUS_CODE=$(/usr/local/bin/deepfreeze status --thawed 2>/dev/null)

# Interpret status code
case "$STATUS_CODE" in
    0)
        STATUS="Thawed"
        ;;
    1)
        STATUS="Thawed but restart required"
        ;;
    2)
        STATUS="Frozen"
        ;;
    *)
        STATUS="Error: Unknown status code ($STATUS_CODE)"
        ;;
esac

# Output as an XML for Jamf Pro Extension Attribute
cat <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<result>$STATUS</result>
EOF