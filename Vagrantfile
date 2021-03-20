# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# This is a sample Vagrantfile for a reference environment.  It has a 
# standard set of scripts to install packages, get code and set things 
# up.  You can edit this Vagrantfile if you need to, but most configuration
# for specific projects can probably done just by editing the scripts in
# /scripts.

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "uomsystemsbiology/base64-vbox"
  
    config.vm.provider :virtualbox do |v|
      v.gui = true
      v.memory = 2048
    end

    #Connection details
    config.ssh.username = "sbl"
    config.ssh.password = "sbl"
    config.ssh.insert_key = false
  
    # Synchronise folers
    config.vm.synced_folder ".", "/vagrant", type: "virtualbox", disabled: true

    #Copying the contents of /data to a temporary directory on the environment
    config.vm.provision "shell", inline: "sudo rm -rf ~/temp;sudo mkdir ~/temp -p;chmod 777 ~/temp"
    config.vm.provision "file", source: "./data", destination: "~/temp"

    #Provisioning the environment	
    config.vm.provision "shell", path: "scripts/1_init.sh", privileged: false
    config.vm.provision "shell", path: "scripts/2_install_core.sh", privileged: false
    #config.vm.provision "shell", path: "scripts/3_install_desktop.sh", privileged: false
    config.vm.provision "shell", path: "scripts/4_configure_core.sh", privileged: false
    config.vm.provision "shell", path: "scripts/5_configure_desktop.sh", privileged: false
    config.vm.provision "shell", path: "scripts/6_finish.sh", privileged: false	
  end