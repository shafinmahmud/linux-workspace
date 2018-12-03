sudo service mysql stop
sudo killall -KILL mysql mysqld_safe mysqld
sudo apt-get remove --purge mysql\*
sudo apt-get --yes autoremove --purge
sudo apt-get autoclean
sudo deluser --remove-home mysql
sudo delgroup mysql
sudo rm -rf /etc/apparmor.d/abstractions/mysql /etc/apparmor.d/cache/usr.sbin.mysqld /etc/mysql /var/lib/mysql /var/log/mysql* /var/log/upstart/mysql.log* /var/run/mysqld
sudo updatedb

