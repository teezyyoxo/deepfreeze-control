#!/bin/bash
# Created by MVG (@PBandJamf) for Choate Rosemary Hall
# Queries Deep Freeze status and returns either Frozen, Thawed, or "Not Installed"

# CHANGELOG

# Version 1.2.0a
# - Added more debugging for testing purposes (with bash -x) to identify issues with status interpretation

# Version 1.2.0
# - Further refined status interpretation

# Version 1.1.0
# - Using the /usr/local binary now instead.
# - Fine-tuned the status code interpretation logic.

# Version 1.0.0
# - Initial release

#!/bin/bash

# Get Deep Freeze status
STATUS_OUTPUT=$(/usr/local/bin/deepfreeze status --thawed 2>/dev/null)

# Debug: Print raw output with quotes to identify hidden characters
echo "Raw output: '$STATUS_OUTPUT'"

# Check if the output is empty
if [ -z "$STATUS_OUTPUT" ]; then
    STATUS="Error: No output from deepfreeze"
else
    # Use echo to debug and see what might be causing an issue
    echo "Debugging case options"
    echo "Expected options: 'Thawed', 'Thawed but restart required', 'Frozen'"

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
fi

# Output status as a simple text string
echo "$STATUS"
