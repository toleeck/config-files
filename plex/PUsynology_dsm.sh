#!/bin/bash
#plex update bash-script on dsm
#run as root!!

#set variables
#directory for temporary file
DIR=/volume1/tmp
#temporary file name
SPK=plex.spk
#download link. do not change this
LINK="https://plex.tv/downloads/latest/1?channel=8&build=linux-ubuntu-x86_64&distro=synology"
#if you have plexpass, you can download earlier versions. for this fill the token.
#how to find plex-token https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token/
#if not, then leave the TOKEN as it is
TOKEN=""

echo "update PlexMediaServer script"
echo "stop plex"
"/var/packages/Plex Media Server/scripts/start-stop-status" stop
echo "remove the previous installation file"
rm $DIR/$SPK
echo "download the latest version of the installation file"
wget -O $DIR/$SPK "${LINK}&X-Plex-Token=${TOKEN}"
echo "run the installation process"
synopkg install $DIR/$SPK
clear
echo "start plex"
"/var/packages/Plex Media Server/scripts/start-stop-status" start
