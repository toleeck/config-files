#!/bin/sh

#link to iptv-playlist
URL="https://"
#temp for playlist
M3U="/tmp/playlist.m3u"
#location for a new playlist with ffmpeg pipe
M3U_FFMPEG="/home/hts/.hts/tvheadend/m3u/ffmpeg.m3u"

#search text. there will be a pipe in this line. e.g. part of the url from the media stream
STRING=""
#start of ffmpeg pipe
START="pipe:\/\/\/usr\/bin\/ffmpeg -loglevel quiet -i "
#end of ffmpeg pipe
END=" -c copy -tune zerolatency -flags +global_header -strict -2 -f mpegts pipe:1"

#download iptv-playlist
wget -O $M3U $URL
#adding a pipe for lines with links to media streams
sed "/${STRING}/s/.*/${START}&${END}/;s/\r//g" $M3U > $M3U_FFMPEG

chown hts:video $M3U_FFMPEG
