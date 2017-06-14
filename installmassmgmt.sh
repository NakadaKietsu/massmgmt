#!/bin/bash
# -----------------------------------------------------------------------------
# installmassmgmt.sh
# install the components of the massmgmt suite in the correct locations
# Last Edited: 6/13/17
# -----------------------------------------------------------------------------
# variables
adminUser="$(dscl . list /Users UniqueID | awk '$2 == 501 {print $1}')"
logDir="/Users/$adminUser/Library/Logs/massmgmt"
# -----------------------------------------------------------------------------
# Script Contents -------------------------------------------------------------

# make directories
mkdir /usr/local/massmgmt
mkdir /usr/local/massmgmt/bin
mkdir /usr/local/massmgmt/sbin
mkdir "$logDir"

# /usr/local/massmgmt/ ------------------------
cd /tmp/massmgmt
cp massmgmt /usr/local/massmgmt

# /usr/local/massmgmt/bin ---------------------
copyLoc="/usr/local/massmgmt/bin"
cd /tmp/massmgmt
cp chrome "$copyLoc"
cp enableSSH "$copyLoc"
cp enableARD "$copyLoc"
cp setHostname "$copyLoc"
cp setTimezone "$copyLoc"

# /usr/local/massmgmt/sbin --------------------
copyLoc="/usr/local/massmgmt/sbin"
cd /tmp/massmgmt
cp $file1 "$copyLoc"

# sudo chmod ----------------------------------
cd /usr/local/massmgmt/bin
sudo chmod +x chrome
sudo chmod +x enableSSH
sudo chmod +x enableARD
sudo chmod +x setHostname
sudo chmod +x setTimezone

cd /usr/local/massmgmt/sbin

# chmod ---------------------------------------
cd /usr/local/massmgmt/bin

cd /usr/local/massmgmt/sbin

# move daemon into place

# create alias to be able to run massmgmt from the command line
ln -s '/usr/local/massmgmt/massmgmt' '/usr/local/bin/'
exit
# -----------------------------------------------------------------------------
