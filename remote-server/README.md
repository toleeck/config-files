## to install mtproto-proxy:
install proxy
```bash
cd /tmp
wget https://raw.githubusercontent.com/toleeck/config-files/master/remote-server/install_mtproto.sh
chmod +x install_mtproto.sh
./install_mtproto.sh
```
install service to autostart mtproto
```bash
wget -O /etc/systemd/system/mtproto-proxy.service https://raw.githubusercontent.com/toleeck/config-files/master/remote-server/mtproto-proxy.service
systemctl daemon-reload
systemctl restart mtproto-proxy
systemctl enable mtproto-proxy
```
It remains only through the bot @MTProxybot in the telegram to register your proxy. The proxy is ready. He works at port 1945. It can be changed to another. The link to add to the application will look like this:
```
https://t.me/proxy?server=SERVER-IP&port=PORT&secret=XXXXXXXXXXX
```
"secret" is a combination of characters after the "-S" in the mtproto service launch file
