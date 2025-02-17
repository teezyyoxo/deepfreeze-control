#!/bin/bash
# Created by MVG (@PBandJamf) for Choate Rosemary Hall

# Version 1.0.0
# - Initial release
# Queries Deep Freeze status and returns either Frozen, Thawed, or Deep Freeze Not Installed

# ***** Replace password and user below with your Deep Freeze user and password!!! *****

DFStatus=$(DFXPSWD=**** /Library/Application Support/Faronics/Deep Freeze/deepfreeze -u **** -p status -x | grep -A1 "<key>bootHow</key>"| awk '{gsub("<key>bootHow</key>", "");print}'| awk '{gsub("<integer>", "");print}' | awk '{gsub("</integer>", "");print}')

if [ ! -f /Library/Application Support/Faronics/Deep Freeze/deepfreeze ]; then
    echo "<result>DeepFreeze not installed.</result>"
fi

if [ "$DFStatus" -eq "0" ]; then
            echo "<result>Frozen</result>"
fi

if [ "$DFStatus" -eq "1" ] || [ "$DFStatus" -eq "2" ] ; then
            echo "<result>Thawed</result>"
fi

exit