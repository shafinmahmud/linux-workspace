#!/bin/bash
sudo dnf -y install https://repo.mysql.com//mysql80-community-release-fc31-1.noarch.rpm
sudo dnf update
sudo systemctl enable --now mysqld.service
sudo grep 'A temporary password' /var/log/mysqld.log |tail -1
sudo mysql_secure_installation
UNINSTALL COMPONENT 'file://component_validate_password';