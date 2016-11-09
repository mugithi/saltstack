########################
#####Install MAAS server
########################

#Install the MAAS repo
base:
  pkgrepo.managed:
    - ppa: maas/stable

#Install the Maas server
  pkg.latest:
    - refresh: True
    - pkgs:
      - maas
      - maas-dns
      - maas-dhcp

#Configure MaaS server
Configure Maas Server:
  cmd.run:
    - name: /srv/salt/maas_configure_script.sh
    - cwd: /
