## Salt Vagrant File Confguration 

This vagrant file is used to initialize a SaltStack Server. This SaltStack Server is then installed with Ubuntu MAAS and fully configured to PXE machines using Ubuntu 14.10.

The vagrant file configuraiton expects that you are running Virtualbox < 5.0 and have Vagrant < 1.86 installed. 

The MAAS server has a Provisioning Configuration that allows you to PXE boot instances and have them come up as salt-minions registered in the MAAS server.


###To Run initalize the Vagrant fully configured Maas Server


```
git pull https://github.com/mugithi/saltstack.git
cd saltstack
vagrant up
```


### Getting Other Virtual Machines PXE Booted using Virtual Box Scripts

TODO Virtual Box Scripts 
TODO MAAS configuration script to deploy Salt Minions
