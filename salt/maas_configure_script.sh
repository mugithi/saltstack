#!/bin/bash

#Create an Account

PROFILE="karanja"

sleep 15

sudo maas-region-admin createadmin --username $PROFILE --password $PROFILE --email $PROFILE@gmail.com


#Login into the system

key=`maas-region-admin apikey --username $PROFILE | awk '{ print $1}'`
maas login $PROFILE http://192.168.45.30/MAAS/api/1.0 $key
maas $PROFILE subnet update 192.168.45.0/24 dns_servers=8.8.8.8


#Update the network and rename the fabrics
maas $PROFILE subnet update 192.168.45.0/24 gateway_ip=192.168.45.1
maas $PROFILE subnet update 192.168.45.0/24 dns_servers=8.8.8.8

maas $PROFILE fabric update 0 name=fab-management
maas $PROFILE fabric update 1 name=fab-external

#Configure space
#TODO Finish configuration on Spaces
#Configure Subnets

uuid=$(maas $PROFILE node-groups list | grep uuid | cut -d\" -f4)
maas $PROFILE node-group-interface update $uuid eth0 management=0 ip=10.0.2.15 subnet_mask=255.255.255.0 router_ip=10.0.2.1
maas $PROFILE node-group-interface update $uuid eth1 ip_range_high=192.168.45.60 ip_range_low=192.168.45.50 management=2 broadcast_ip=192.168.45.255  router_ip=192.168.45.1


#Download boot image
maas $PROFILE  boot-source-selections create 1 os="ubuntu" release="14.04 LTS" arches="amd64" subarches="*" labels="*"

#Download the profile
maas $PROFILE boot-resources import

#Accept all nodes that PXE boot
maas $PROFILE nodes accept-all
