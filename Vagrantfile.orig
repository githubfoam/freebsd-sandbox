# -*- mode: ruby -*-
# vi: set ft=ruby :
$boot_script = <<SCRIPT
# Install envoy
sudo pkg update
sudo pkg install --yes --quiet python36 py36-pip
sudo pip-3.6 install virtualenv
sudo virtualenv /home/vagrant/venvansible
# . /home/vagrant/venvansible/bin/activate && pip install ansible
# echo ". /home/vagrant/venvansible/bin/activate"
# pip install ansible
# pip install -r /tmp/vagrant/requirements.txt
# cat <<EOT | sudo tee /home/vagrant/requirements.txt
# ansible==2.9.2
# cffi==1.13.2
# cryptography==2.8
# Jinja2==2.10.3
# MarkupSafe==1.1.1
# pycparser==2.19
# PyYAML==5.2
# six==1.13.0
# paramiko==2.7.0
# EOT
SCRIPT
Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "512"
    vb.cpus = 1
  end

  config.vm.define "vg-freebsd-01" do |bsdcluster|
    bsdcluster.vm.box = "freebsd/FreeBSD-12.1-RELEASE" # vagrant cloud
    bsdcluster.vm.hostname = "vg-freebsd-01"
    bsdcluster.vm.network "private_network", ip: "192.168.45.39"
    bsdcluster.vm.network "forwarded_port", guest: 80, host: 8839
    bsdcluster.vm.provider "virtualbox" do |vb|
        vb.name = "vb-freebsd-01"
        vb.memory = "512"
    end

    bsdcluster.vm.provision "shell", inline: <<-SHELL
    echo "===================================================================================="
                              hostnamectl status
    echo "===================================================================================="
    echo "         \   ^__^                                                                  "
    echo "          \  (oo)\_______                                                          "
    echo "             (__)\       )\/\                                                      "
    echo "                 ||----w |                                                         "
    echo "                 ||     ||                                                         "
    SHELL

    # webtier.vm.provision "ansible_local" do |ansible|
    # ansible.playbook = "deploy.yml"
    # ansible.become = true
    # end

   end

end
