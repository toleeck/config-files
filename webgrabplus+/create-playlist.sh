#!/bin/sh

#этим скриптом подготоавливаю плейлист от провайдера shara.club:
#обновляю ссылку к епг, обновляю пути к логотипам, чтобы использовать свои
#запускаю раз в сутки

#link to iptv-playlist
URL="https://list.sh-tv.pro/tv-m3u/XXXXXXXXXX"
#temp for playlist
M3U="/tmp/playlist.m3u"
#location for a new playlist
NEW_M3U="/var/www/html/m3u/shara.m3u"

#download iptv-playlist
wget -O $M3U $URL

#set playlist
#set logos
sed "s/https:\/\/p.shtv.pro\/picons\/ru/http:\/\/192.168.88.108\/icons\/shara.club/" $M3U > $NEW_M3U
#set logos for empty hd-channels
sed -i "/РЕН HD/s/rentv.png/rentv-hd.png/;/Пятница HD/s/pyatnica.png/pyatnica-hd.png/;/Мир Premium HD/s/mir.png/mir-premium-hd.png/;/Animal Planet HD/s/animal-planet.png/animal-planet-hd.png/;/Discovery Channel HD/s/discoverychannel.ru.png/discoverychannel.ru-hd.png/;/Travel+Adventure HD/s/travel-adventure.png/travel-adventure-hd.png/;/TLC HD/s/tlc.ru.png/tlc.ru-hd.png/;/FOX RUSSIA HD/s/fox.png/fox-hd.png/;/Eurosport 1 HD/s/eurosport1.ru.png/eurosport1.ru-hd.png/;/Nickelodeon HD/s/nickelodeon.png/nickelodeon-hd.png/;/Матч! HD/s/match.png/match-hd.png/;/МАТЧ! Арена HD/s/match-arena.png/match-arena-hd.png/;/МАТЧ! Игра HD/s/match-igra.png/match-igra-hd.png/;/МАТЧ! Футбол 1 HD/s/match-football-1.png/match-football-1-hd.png/;/МАТЧ! Футбол 2 HD/s/match-football-2.png/match-football-2-hd.png/;/Матч! Футбол 3 HD/s/match-football-3.png/match-football-3-hd.png/;/МАТЧ ПРЕМЬЕР HD/s/match-premiere.png/match-premiere-hd.png/" $NEW_M3U
#optional set epg
sed  -i "s/https:\/\/list.sh-tv.pro\/f\/epg.xml.gz/http:\/\/192.168.88.108\/epg\/epg.xml/" $NEW_M3U

rm $M3U
