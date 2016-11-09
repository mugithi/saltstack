#!/bin/bash
VBoxManage createvm --name $1 --ostype Ubuntu_64 --register
VBoxManage modifyvm $1 --memory 768 --boot1 net --nic1 hostonly --hostonlyadapter1 vboxnet0  --boot2 disk --vram 12
VBoxManage createhd --filename $1".vdi" --size 40000
VBoxManage storagectl $1 --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach $1 --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium $1".vdi"
VBoxManage startvm $1 --type gui
