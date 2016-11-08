#!/bin/bash

#Create an Account
sudo maas-region-admin createadmin --username karanja --password karanja --email isackaranja@gmail.com


#Login into the system
maas karanja subnet update 192.168.45.0/24 dns_servers=8.8.8.8
key=`maas-region-admin apikey --username karanja | awk '{ print $1}'`
maas login karanja http://192.168.45.39/MAAS/api/1.0 $key


#Update the network
maas karanja subnet update 192.168.45.0/24 gateway_ip=192.168.45.30
maas karanja subnet update 192.168.45.0/24 dns_servers=8.8.8.8

#Configure Subnets

uuid=$(maas karanja node-groups list | grep uuid | cut -d\" -f4)
maas karanja node-group-interface update $uuid eth1 ip_range_high=192.168.45.60 ip_range_low=192.168.45.50 management=2 broadcast_ip=192.168.45.255  router_ip=192.168.45.1


#Download boot image
maas karanja  boot-source-selections create 1 os="ubuntu" release="precise" arches="amd64" subarches="*" labels="*"

#Accept all nodes that PXE boot
maas maas nodes accept-all
