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

#Configure MaaS server
Configure Maas Server:
  cmd.run:
    - name: /srv/salt/mass_configure_script.sh
    - cwd: /
