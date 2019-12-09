# freebsd-bento-sandbox
~~~~
vagrant up
~~~~
shared folder cfg
~~~~
windows host ==> "."
vagrant vm guest ==> "/tmp/vagrant"

verify after login
>vagrant ssh
$ ls /
COPYRIGHT       boot            entropy         home            libexec         mnt             proc            root            sys             usr             zroot
bin             dev             etc             lib             media           net             rescue          sbin            tmp             var

$ ls /tmp/vagrant
README.md               Vagrantfile             Vagrantfile.orig        playbook.yml            provisioning            vagrant-shell

$ ls /tmp/vagrant/provisioning/
deploy.yml              roles                   servers_list.yml

Vagrantfile:
config.vm.synced_folder ".", "/tmp/vagrant"
~~~~
~~~~

$ pkg search ansible
py27-ansible-2.8.5             Radically simple IT automation
py27-ansible-lint-4.1.0_2      Checks playbooks for sub-optimal practices and behaviour
py27-ansible-runner-1.4.4      Extensible embeddable ansible job runner
py27-ansible1-1.9.6_5          Radically simple IT automation
py27-ansible23-2.3.3.0_4       Radically simple IT automation
py27-ansible24-2.4.6.0_3       Radically simple IT automation
py27-ansible25-2.5.15_2        Radically simple IT automation
py27-ansible26-2.6.18          Radically simple IT automation
py27-ansible27-2.7.13          Radically simple IT automation
py27-ploy_ansible-1.4.1        Plugin to integrate Ansible with ploy
py36-ansible-2.8.5             Radically simple IT automation
py36-ansible-lint-4.1.0_2      Checks playbooks for sub-optimal practices and behaviour
py36-ansible-runner-1.4.4      Extensible embeddable ansible job runner
py36-ansible-sysrc-0.1         Ansible module to set sysvars in rc.conf
py36-ansible23-2.3.3.0_4       Radically simple IT automation
py36-ansible24-2.4.6.0_3       Radically simple IT automation
py36-ansible25-2.5.15_2        Radically simple IT automation
py36-ansible26-2.6.18          Radically simple IT automation
py36-ansible27-2.7.13          Radically simple IT automation
~~~~
python virtual environment
~~~~

$ sudo pkg install --yes --quiet python36 py36-pip
$ sudo pip-3.6 install virtualenv

% which python3.6
/usr/local/bin/python3.6  
% python3.6-version
Python 3.6.9

$ sudo pip-3.6 install virtualenv
$ virtualenv --version
16.7.8

$ virtualenv /home/vagrant/venvansible

$ . /home/vagrant/venvansible/bin/activate
(venvansible) $ deactivate
$

(venvansible) $ pip install ansible

sudo pip freeze > /tmp/vagrant/requirements.txt
pip freeze > requirements.txt
pip install -r requirements.txt

~~~~
