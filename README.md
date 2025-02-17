# Deep Freeze macOS Management Scripts

This repository contains a small set of bash scripts (for macOS) to integrate with Jamf Pro for remote management of Deep Freeze.
As always, your mileage may vary.
If you have any questions or run into issues, please submit a PR.

BTW, because I had to figure this out on my own, this is the secret to getting your Extension Attributes (strings, specifically) to print properly: variations of `echo "<result>$string</result>"`.
Hopefully that saves you a bit of trouble when you make your own :)
---
## Scripts Overview

### 1. `deepfreeze-STATUS-macOS.sh`
- **Purpose**: This script functions as an Extension Attribute in Jamf Pro, allowing you to check the status of Deep Freeze on macOS devices.
- **How to Use**: 
  - Add this script as an extension attribute in Jamf Pro.
  - Set the "Data Type" for the extension attribute to `String`.
  - Running `sudo jamf recon` on a machine will force an update of all extension attributes, if needed, for testing.
  
### 2. `deepfreeze-FREEZE-macOS.sh`
- **Purpose**: This script commands Deep Freeze to freeze the computer, making it unchangeable until thawed.
- **How to Use**: 
  - Deploy via a Jamf Pro policy at the desired interval for your organization.
  - You may adjust the policy’s scope and trigger as necessary, depending on your maintenance window.
  - Use this script to either freeze a machine that is Thawed, or to ensure that no further changes can be applied until after the next thaw operation is fully processed.

### 3. `deepfreeze-THAW-macOS.sh`
- **Purpose**: This script commands Deep Freeze to thaw the computer, allowing changes to be made. It requires a reboot to fully process the thaw operation.
- **How to Use**: 
  - Deploy via Jamf Pro policy, typically when maintenance or updates are complete.
  - **Important**: A reboot is required after running this script in order to complete the thaw operation.

### 4. `reboot-macOS.sh`
- **Purpose**: This script reboots the computer after Deep Freeze has been thawed. It provides a heads-up dialog with a 20-second countdown before the reboot happens.
- **How to Use**: 
  - This script is meant to be used in conjunction with the `deepfreeze-THAW-macOS.sh` script.
  - It ensures the machine reboots after the thaw operation has been completed.

## Usage Notes

- **Maintenance Windows**: I recommend scoping the Freeze and Thaw scripts to run during predefined maintenance windows when the machines are not actively in use.
- **Reboot Requirement**: The Thaw operation requires a reboot to take effect fully. Ensure that `reboot-macOS.sh` is deployed after confirming the machine has been thawed.

## Suggestions & Considerations

1. **Smart Groups in Jamf Pro**: 
   - Create smart groups for machines that are frozen and thawed. 
   - For frozen Macs, use the "is Frozen" criteria.
   - For thawed Macs, use the "like Thawed" criteria. The "Thawed" status can either be "Thawed" or "Thaw (requires restart)". Alternatively, you can use two separate "is" conditions.
   - This will help better identify which machines are "eligible" to receive either the Freeze or Thaw policies, providing more granular control over policy deployment.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
