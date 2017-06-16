#!/bin/bash
# -----------------------------------------------------------------------------
# uninstallmassmgmt
# uninstall massmgmt suite
# Last Edited: 6/15/17
# -----------------------------------------------------------------------------
# variables
adminUser="$(dscl . list /Users UniqueID | awk '$2 == 501 {print $1}')"

# -----------------------------------------------------------------------------
# Script Contents -------------------------------------------------------------

printf "Uninstall the massmgmt suite? (y/n) -> "
read A
if [ "$A" == "n" ] ; then
    exit
elif [ "$A" == "y" ] ; then
    sudo rm /usr/local/bin/massmgmt                      # remove symbolic link
    sudo rm /Library/LaunchDaemons/org.massmgmt.plist    # remove the launch daemon
    sudo rm -rf /Users/$adminUser/Library/Logs/massmgmt  # remove the log directory
    sudo rm -rf /usr/local/massmgmt                      # nuke program directory
    echo "massmgmt is now removed from your system"
    exit
else
    exit
fi
exit
# -----------------------------------------------------------------------------
