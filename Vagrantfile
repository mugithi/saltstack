# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
 ip='192.168.45.30'
 config.vm.define :maas do |maas_config|
   maas_config.vm.box = "ubuntu/trusty64"
   maas_config.vm.hostname = "maas"
   #maas_config.vm.network "public_network", bridge: "en0"
   maas_config.vm.network "private_network", ip: "192.168.45.30"
   maas_config.vm.synced_folder "salt/", "/srv/salt"
   maas_config.vm.provision "shell", path: "salt/bootstrap.sh", args: "'192.168.45.30' 'maas'"
   maas_config.vm.provider "virtualbox" do |prl|
     prl.name = "maas"
     prl.linked_clone = true
     prl.memory = 1536
     prl.cpus = 1
   end

 end

 # config.vm.define :node01 do |node01_config|
 #   node01_config.vm.box = "ubuntu/trusty64"
 #   node01_config.vm.hostname = "node01"
 #   #node01_config.vm.network "public_network", bridge: "en0"
 #   node01_config.vm.network "private_network", ip: "192.168.45.31"
 #   node01_config.vm.synced_folder "salt/", "/svr/salt"
 #   #node01_config.vm.provision "shell", path: "http://192.168.1.26/bootstrap.sh"
 #   node01_config.vm.provider "virtualbox" do |prl|
 #     prl.name = "node01"
 #     prl.linked_clone = true
 #     prl.memory = 768
 #     prl.cpus = 1
 #   end
 # end

end
