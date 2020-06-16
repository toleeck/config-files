#!/bin/bash

apt install git curl build-essential libssl-dev zlib1g-dev -y
git clone https://github.com/TelegramMessenger/MTProxy.git
cd MTProxy
make
cp objs/bin/mtproto-proxy /usr/bin/
chmod 777 /usr/bin/mtproto-proxy
cd /etc
mkdir mtproto-proxy
cd mtproto-proxy
curl -s https://core.telegram.org/getProxySecret -o proxy-secret
curl -s https://core.telegram.org/getProxyConfig -o proxy-multi.conf
