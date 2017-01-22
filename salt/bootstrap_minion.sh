#!/bin/bash

# install required packages to run salt
echo "Installing add-apt-repository dependencies"
sudo apt-get install -y software-properties-common python-software-properties build-essential
sudo apt-get update

echo "Adding saltstack repository"
sudo add-apt-repository -y ppa:saltstack/salt
sudo apt-get update

# install text editor
echo "Installing VIM text editor"
sudo apt-get install -y vim

# install salt-master and other salt related stuff
echo "Installing salt-master"
sudo apt-get install salt-master salt-minion  -y

# configure master file
echo "Configure master file"
service salt-master stop
echo "interface: $1" >> /etc/salt/master
#sudo sed -i.bak 's/#interface:\ 0.0.0.0/interface $1/g' /etc/salt/master
sudo salt-master -d

#Configure Minion
echo "Configure Minion"
service salt-minion stop
echo "master: $1" >> /etc/salt/minion
echo "id: $2" >> /etc/salt/minion
  #statements
#sudo sed -i.bak 's/#master:\ salt/master: $1/g' /etc/salt/minion
sudo salt-minion -d

#configure VIM editor
#echo "export EDITOR=/usr/bin/vim" >> /etc/profile.d/editor.sh

sleep 15
sudo salt-key -y -A

sleep 15
sudo salt '*' state.highstate
