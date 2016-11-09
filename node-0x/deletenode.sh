#!/bin/bash
VBoxManage controlvm $1 poweroff
sleep 5
VBoxManage unregistervm $1 --delete
sleep 2
vboxmanage list runningvms
