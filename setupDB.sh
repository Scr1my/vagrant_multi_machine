#!/bin/bash
echo hello
sudo apt update

sudo apt install mysql-server -y

ispresent=`grep "status mysql" .bashrc | wc -l`
if [[ "$ispresent" == "0" ]];
then
	echo "sudo systemctl status mysql" >> /home/vagrant/.bashrc
fi

sudo mysql < "/vagrant/db.sql"
sudo sed -i "s/^bind-address\\s*=\\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql
