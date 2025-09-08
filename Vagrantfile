# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box_check_update = false
  
  # Default VirtualBox template for all vagrant instances
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "512"
    vb.cpus = 2
  end

  config.vm.define "freebsd-14" do |k8scluster|
    # FreeBSD 14.1 Release
    k8scluster.vm.box = "freebsd/FreeBSD-14.1-RELEASE"
    k8scluster.vm.hostname = "freebsd-14"
    k8scluster.vm.network "private_network", ip: "192.168.50.14"
    
    # Disable default /vagrant share
    k8scluster.vm.synced_folder ".", "/vagrant", disabled: true
    
    # Increase boot timeout to 20 minutes
    k8scluster.vm.boot_timeout = 1200
    
    # Node-specific VirtualBox settings
    k8scluster.vm.provider "virtualbox" do |vb|
      vb.name = "freebsd-4"
      vb.memory = "2048"
      #vb.gui = true  # Enable GUI to see boot process
      
      # Additional Windows 11 compatibility settings
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
    
    # Provisioning scripts
    k8scluster.vm.provision :shell, path: "scripts/freebsd.sh"
    k8scluster.vm.provision "shell", inline: <<-SHELL
      echo "===================================================================================="
      echo $SHELL
      echo "===================================================================================="
      echo "         \\   ^__^                                                                  "
      echo "          \\  (oo)\\_______                                                          "
      echo "             (__)\\       )\\/\\                                                      "
      echo "                 ||----w |                                                         "
      echo "                 ||     ||                                                         "
    SHELL
  end
end