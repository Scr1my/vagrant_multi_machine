# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_IMAGE = "ubuntu/jammy64"

WEB_MACHINE_NAME = "web.m340"
DB_MACHINE_NAME = "db.m340"

BASE_INT_NETWORK = "10.10.20"
BASE_HOST_ONLY_NETWORK = "192.168.56"

Vagrant.configure("2") do |config|
  
  config.vm.define "web" do |web|
    web.vm.box = BOX_IMAGE
	web.vm.provision "shell", path: "setupWeb.sh"
	
	web.vm.hostname = WEB_MACHINE_NAME
	
	web.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10",
      virtualbox__intnet: true
	  
	web.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10",
      virtualbox__hostonly: true
	
	web.vm.synced_folder "website", "/var/www/html"
	
	web.vm.provider "virtualbox" do |vb|
	  vb.name = WEB_MACHINE_NAME
	  vb.cpus = 2
	  vb.memory = 2048
	end
  end

  config.vm.define "db" do |db|
    db.vm.box = BOX_IMAGE
	db.vm.provision "shell", path: "setupDB.sh"
	
	db.vm.hostname = DB_MACHINE_NAME
	db.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11",
      virtualbox__intnet: true
	
	db.vm.provider "virtualbox" do |vb|
	  vb.name = DB_MACHINE_NAME
	  vb.cpus = 2
	  vb.memory = 2048
	end
  end
  

end
