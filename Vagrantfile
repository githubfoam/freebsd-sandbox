# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box_check_update = false

  # vbox template for all vagranth instances
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "512"
    vb.cpus = 2
  end

            config.vm.define "node-4" do |k8scluster|
                k8scluster.vm.box = "freebsd/FreeBSD-12.1-STABLE"
                k8scluster.vm.hostname = "node-4"
                k8scluster.vm.network "private_network", ip: "192.168.50.14"
                #Disabling the default /vagrant share can be done as follows:
                k8scluster.vm.synced_folder ".", "/vagrant", disabled: true
                k8scluster.vm.provider "virtualbox" do |vb|
                    vb.name = "node-4"
                    vb.memory = "2048"
                end
                k8scluster.vm.provision :shell, path: "scripts/freebsd.sh"
                k8scluster.vm.provision "shell", inline: <<-SHELL
                echo "===================================================================================="
                echo $SHELL
                echo "===================================================================================="
                echo "         \   ^__^                                                                  "
                echo "          \  (oo)\_______                                                          "
                echo "             (__)\       )\/\                                                      "
                echo "                 ||----w |                                                         "
                echo "                 ||     ||                                                         "
                SHELL
              end


end
