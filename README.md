# Deep Freeze macOS Management Scripts

This repository contains a small set of bash scripts (for macOS) to integrate with Jamf Pro for remote management of Deep Freeze.
As always, your mileage may vary.
If you have any questions or run into issues, please submit a PR.

## Scripts Overview

### 1. `deepfreeze-STATUS-macOS.sh`
- **Purpose**: This script functions as an extension attribute in Jamf Pro, allowing you to check the status of Deep Freeze on macOS devices.
- **How to Use**: 
  - Add this script as an extension attribute in Jamf Pro.
  - Set the "Data Type" for the extension attribute to `String`.
  - Running `sudo jamf recon` on a machine will force an update of all extension attributes, if needed, for testing.
  
### 2. `deepfreeze-FREEZE-macOS.sh`
- **Purpose**: This script commands Deep Freeze to freeze the computer, making it unchangeable until thawed.
- **How to Use**: 
  - Deploy via a Jamf Pro policy at the desired interval for your organization.
  - You may adjust the policy’s scope and trigger as necessary, depending on your maintenance window.
  - Use this script when you want to ensure no changes are made to the machine during scheduled maintenance.

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

- **Maintenance Windows**: We recommend scoping the Freeze and Thaw scripts to run during predefined maintenance windows when the machines are not actively in use.
- **Reboot Requirement**: The Thaw operation requires a reboot to take effect fully. Ensure that `reboot-macOS.sh` is used after thawing the machine.
- **Jamf Pro Integration**: These scripts are designed to integrate with Jamf Pro. Make sure the policies are set correctly to scope and trigger the scripts as per your organization’s needs.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
