#!/bin/sh
set -eox pipefail #safety for script
echo "=========================================================================================="
echo $SHELL # freebsd shell
ls /
ls /tmp/vagrant
echo "===================python virtual environment======================================================================="
sudo pkg install --yes --quiet python36 py36-pip
sudo pip-3.6 install virtualenv
which python3.6
virtualenv --version
virtualenv /home/vagrant/venvansible
. /home/vagrant/venvansible/bin/activate
pip install ansible
ansible --version
udo pip freeze > /tmp/vagrant/requirements.txt
cat /tmp/vagrant/requirements.txt
deactivate
echo "===================ansible======================================================================="
pkg search ansible
sudo pkg install --yes --quiet py36-ansible-2.8.5
ansible --version
echo "=========================================================================================="
