/ip firewall nat
add action=dst-nat chain=dstnat comment="HTTP to LXC (reverseproxy)" \
    dst-port=80 in-interface-list=WAN protocol=tcp src-address-list=\
    "Access IP" to-addresses=192.168.88.109 to-ports=80
add action=dst-nat chain=dstnat comment="HTTP(S) to LXC (reverseproxy)" \
    dst-port=443 in-interface-list=WAN protocol=tcp src-address-list=\
    "Access IP" to-addresses=192.168.88.109 to-ports=443