#!/bin/bash
# -----------------------------------------------------------------------------
# installmassmgmt.sh
# install the components of the massmgmt suite in the correct locations
# Last Edited: 6/15/17
# -----------------------------------------------------------------------------
# variables
adminUser="$(dscl . list /Users UniqueID | awk '$2 == 501 {print $1}')"
logDir="/Users/$adminUser/Library/Logs/massmgmt"

logFile="/Users/$adminUser/Desktop/installLog.txt"
starDate="$(date)"
hostName="$(hostname)"
# -----------------------------------------------------------------------------
# Script Contents -------------------------------------------------------------

echo "$starDate -- $hostName ----" >> "$logFile"
echo >> "$logFile"

# make directories
echo "Generating directories" >> "$logFile"
mkdir /usr/local/massmgmt >> "$logFile"
mkdir /usr/local/massmgmt/bin >> "$logFile"
mkdir /usr/local/massmgmt/sbin >> "$logFile"
mkdir /usr/local/massmgmt/mconfig >> "$logFile"
mkdir "$logDir" >> "$logFile"
echo "Directories generated" >> "$logFile"

# /usr/local/massmgmt/ ------------------------
echo "Copying main script" >> "$logFile"
cd /tmp/massmgmt >> "$logFile"
cp massmgmt /usr/local/massmgmt/ >> "$logFile"

# /usr/local/massmgmt/bin ---------------------
copyLoc="/usr/local/massmgmt/bin"
echo "Copying scripts to $copyLoc" >> "$logFile"
cd /tmp/massmgmt >> "$logFile"
cp autoUpdate "$copyLoc" >> "$logFile"
cp chrome "$copyLoc" >> "$logFile"
cp enableSSH "$copyLoc" >> "$logFile"
cp enableARD "$copyLoc" >> "$logFile"
cp setHostname "$copyLoc" >> "$logFile"
cp setTimezone "$copyLoc" >> "$logFile"
cp checkChrome.py "$copyLoc" >> "$logFile"

# /usr/local/massmgmt/sbin ---------------------
copyLoc="/usr/local/massmgmt/sbin"
cd /tmp/massmgmt >> "$logFile"
cp uninstallmassmgmt.sh "$copyLoc" >> "$logFile"

# chmod ----------------------------------------
cd /usr/local/massmgmt/bin
echo "CHMOD scripts" >> "$logFile"
sudo chmod +x autoUpdate >> "$logFile"
sudo chmod +x chrome >> "$logFile"
sudo chmod +x enableSSH >> "$logFile"
sudo chmod +x enableARD >> "$logFile"
sudo chmod +x setHostname >> "$logFile"
sudo chmod +x setTimezone >> "$logFile"
chmod +x checkChrome.py >> "$logFile"
sudo chmod +x uninstallmassmgmt.sh >> "$logFile"

# move daemon into place
echo "Moving daemon into /Library/LaunchDaemons" >> "$logFile"
sudo cp /tmp/massmgmt/org.massmgmt.plist /Library/LaunchDaemons >> "$logFile"

# create alias to be able to run massmgmt from the command line
ln -s '/usr/local/massmgmt/massmgmt' '/usr/local/bin/' >> "$logFile"
echo >> "$logFile"
echo "$starDate -- $hostName ----" >> "$logFile"
exit
# -----------------------------------------------------------------------------
