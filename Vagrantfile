# -*- mode: ruby -*-
# vi: set ft=ruby :
$boot_script = <<SCRIPT
# Install envoy
sudo pkg update
sudo pkg install --yes --quiet python36 py36-pip
sudo pip-3.6 install virtualenv
sudo virtualenv /home/vagrant/venvansible
# . /home/vagrant/venvansible/bin/activate && pip install ansible
echo ". /home/vagrant/venvansible/bin/activate"
pip install ansible
# pip install -r /tmp/vagrant/requirements.txt
cat <<EOT | sudo tee /home/vagrant/requirements.txt
ansible==2.9.2
cffi==1.13.2
cryptography==2.8
Jinja2==2.10.3
MarkupSafe==1.1.1
pycparser==2.19
PyYAML==5.2
six==1.13.0
paramiko==2.7.0
EOT
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "bento/freebsd-12"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "512"
  end
  # config.vm.synced_folder "./.", "/home/vagrant"
  config.vm.synced_folder ".", "/tmp/vagrant"
  config.ssh.shell = "sh"
  config.vm.provision "shell", inline: $boot_script, privileged: false
  config.vm.provision "shell", inline: <<-SHELL
  echo "======================================================"
  uname -a
  echo "======================================================"
  SHELL
end
