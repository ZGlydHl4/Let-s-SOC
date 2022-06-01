#! /bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

mkdir /usr/share/kibana/data
chown -R kibana:kibana /usr/share/kibana
cd /usr/share/kibana
sudo -u kibana /usr/share/kibana/bin/kibana-plugin install https://packages.wazuh.com/4.x/ui/kibana/wazuh_kibana-4.3.2_7.17.3-1.zip
setcap 'cap_net_bind_service=+ep' /usr/share/kibana/node/bin/node
systemctl daemon-reload
systemctl enable kibana
systemctl start kibana