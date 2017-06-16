#!/bin/bash
# -----------------------------------------------------------------------------
# preinstall.sh
# script to remove existing components for updates
# Last Edited: 6/16/17
# -----------------------------------------------------------------------------
# variables
adminUser="$(dscl . list /Users UniqueID | awk '$2 == 501 {print $1}')"
logDir="/Users/$adminUser/Library/Logs/massmgmt"
logFile="/Users/$adminUser/Desktop/installLog.txt"
starDate="$(date)"
hostName="$(hostname)"

# -----------------------------------------------------------------------------
# Script Contents ------------------------------------------------------------
echo "---- $starDate --- $hostName ----" >> "$logFile"
echo >> "$logFile"
echo "Preinstall Script" >> "$logFile"
echo "Removing /usr/local/massmgmt" >> "$logFile"
sudo rm -rf /usr/local/massmgmt >> "$logFile"
echo "Removing /Library/LaunchDaemons/org.massmgmt.plist" >> "$logFile"
sudo rm /Library/LaunchDaemons/org.massmgmt.plist >> "$logFile"
echo "Preinstall Script finished" >> "$logFile"
echo "---- $starDate --- $hostName ----" >> "$logFile"
# -----------------------------------------------------------------------------
