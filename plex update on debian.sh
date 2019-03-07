#!/bin/bash
#plex update bash-script on debian

#set variables
#directory for temporary file
DIR=/tmp
#temporary file name
DEB=plex.deb
#download link. do not change this
LINK="https://plex.tv/downloads/latest/1?channel=8&build=linux-ubuntu-x86_64&distro=ubuntu"
#if you have plexpass, you can download earlier versions. for this fill the token.
#how to find plex-token https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token/
#if not, then leave the TOKEN as it is
TOKEN=""

echo "update PlexMediaServer script"
echo "stop plex"
service plexmediaserver stop
echo "remove the previous installation file"
rm $DIR/$DEB
echo "download the latest version of the installation file"
wget -O $DIR/$DEB "${LINK}&X-Plex-Token=${TOKEN}"
echo "run the installation process"
dpkg -i $DIR/$DEB
clear
echo "start plex"
service plexmediaserver start