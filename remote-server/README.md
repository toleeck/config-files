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
