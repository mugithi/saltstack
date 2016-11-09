#!/bin/bash
isthere=`vboxmanage list runningvms | grep $1 | awk '{print $1}' |  sed -e 's/^"//' -e 's/"$//'`
if [ "$isthere" = "$1" ]; then
  VBoxManage controlvm $1 poweroff
  sleep 5
  VBoxManage unregistervm $1 --delete
  sleep 2
  rm -rf $1.box
  echo -e "\n"
  echo -e "Here is the list of currently running VMs in Virtualbox"
  vboxmanage list runningvms
  echo -e "\n"
else
  echo -e $1 "cannot be found in virtualbox"
  echo -e "\n"
  echo -e "Here is the list of currently running VMs in Virtualbox"
  vboxmanage list runningvms
  echo -e "\n"
fi
