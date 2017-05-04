#!/bin/sh
## Wally3kadlists
NAMEOFAPP="wally3kadlists"

## Current User
CURRENTUSER="$(whoami)"

## Dependencies Check
sudo bash /etc/piadvanced/dependencies/dep-whiptail.sh

## Variables
source /etc/piadvanced/install/firewall.conf
source /etc/piadvanced/install/variables.conf
source /etc/piadvanced/install/userchange.conf

{ if 
(whiptail --title "$NAMEOFAPP" --yes-button "Skip" --no-button "Proceed" --yesno "Do you want to install $NAMEOFAPP?" 10 80) 
then
echo "User Declined $NAMEOFAPP" | sudo tee --append /etc/piadvanced/install/installationlog.txt
else
echo "User Installed $NAMEOFAPP" | sudo tee --append /etc/piadvanced/install/installationlog.txt
sudo wget https://raw.githubusercontent.com/deathbybandaid/wally3k-adlists.list/master/adlists.list -P /etc/pihole/
fi }

## Unset Temporary Variables
unset NAMEOFAPP
unset CURRENTUSER
