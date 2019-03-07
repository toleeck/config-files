#!/bin/bash
#plex update bash-script on centos

#set variables
#directory for temporary file
DIR=/tmp
#temporary file name
RPM=plex.rpm
#download link. do not change this
LINK="https://plex.tv/downloads/latest/1?channel=16&build=linux-ubuntu-x86_64&distro=centos"
#if you have plexpass, you can download earlier versions. for this fill the token.
#how to find plex-token https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token/
#if not, then leave the TOKEN as it is
TOKEN=""

echo "update PlexMediaServer script"
echo "stop plex"
systemctl stop plexmediaserver.service
echo "remove the previous installation file"
rm $DIR/$RPM
echo "download the latest version of the installation file"
wget -O $DIR/$RPM "${LINK}&X-Plex-Token=${TOKEN}"
echo "run the installation process"
rpm -ivh $DIR/$RPM
clear
echo "start plex"
systemctl start plexmediaserver.service
