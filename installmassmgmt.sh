#!/bin/bash
# -----------------------------------------------------------------------------
# installmassmgmt.sh
# install the components of the massmgmt suite in the correct locations
# Last Edited: 6/13/17
# -----------------------------------------------------------------------------
# make directories
mkdir /usr/local/massmgmt
mkdir /usr/local/massmgmt/bin
mkdir /usr/local/massmgmt/sbin

# /usr/local/massmgmt/bin ---------------------
cd /tmp/massmgmt
cp $file /usr/local/massmgmt/bin


# /usr/local/massmgmt/sbin --------------------
cd /tmp/massmgmt
cp $file1 /usr/local/massmgmt/sbin

# sudo chmod ----------------------------------
cd /usr/local/massmgmt/bin

cd /usr/local/massmgmt/sbin

# chmod ---------------------------------------
cd /usr/local/massmgmt/bin

cd /usr/local/massmgmt/sbin

# create alias to be able to run massmgmt from the command line
ln -s '/usr/local/massmgmt/massmgmt' '/usr/local/bin/'
exit
# -----------------------------------------------------------------------------
