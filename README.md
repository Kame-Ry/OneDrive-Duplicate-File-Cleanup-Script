# OneDrive Duplicate File Cleanup Script

## Overview
This PowerShell script is a strategic solution to an issue observed with OneDrive's synchronization process. Some users have reported that OneDrive can create duplicate files when syncing across multiple devices. This script aims to clean up these unnecessary duplicate shortcut files (.lnk, .url, .html) that may clutter your desktop due to OneDrive's syncing behavior.

## Purpose
The script is specifically designed to address clutter caused by duplicate shortcut files on the desktop, a situation that can occur when OneDrive syncs across devices. By identifying and removing these duplicated files, the script helps maintain a clean and organized desktop space.

## Key Features
- **Efficient Duplication Handling**: Targets and removes duplicate files created as a result of OneDrive's synchronization.
- **Wide Compatibility**: Functional with both standard desktops and those synchronized with OneDrive.
- **Detailed Logging**: Maintains a log of all operations, documenting removed files for user review.
- **Smart Log Management**: Automatically manages log files to prevent excessive accumulation by implementing a rotation policy.
- **User Customization**: Allows adjustment of file pattern matching for targeting specific duplication patterns.

## Usage Instructions
1. **Adjust File Patterns**: Update the script to target the specific file types and naming patterns of the duplicates you wish to remove.
2. **Script Placement**: Store the script in a convenient location on your computer.
3. **Execution**: Run the script through Windows PowerShell. Administrative rights are generally not required.
4. **Log Review**: Inspect the log directory within your Documents folder to review the script's actions and the files it has removed.

## Safety and Disclaimer
The script is provided "as is," with no guarantees. It operates on files present on your desktop based on predefined patterns, which could potentially affect important files. Users are advised to thoroughly understand the script's mechanism and conduct a trial run in a secure environment before regular use.

## Contributing
Contributions, feedback, and improvements are highly appreciated. They enhance the script's effectiveness and support others potentially facing similar issues with OneDrive synchronization.

This initiative is a community effort aimed at addressing and providing a workaround for the duplication issue observed with OneDrive, enhancing desktop management for affected users.
