#!/bin/bash
echo hello
sudo apt update

sudo apt-get install -y apache2 php libapache2-mod-php php-mysql
sudo systemctl restart apache2

ispresent=`grep "status mysql" .bashrc | wc -l`
if [[ "$ispresent" == "0" ]];
then
	echo "sudo systemctl status apache2" >> /home/vagrant/.bashrc
fi
