# freebsd-sandbox

Travis (.com) branch:
[![Build Status](https://travis-ci.com/githubfoam/freebsd-sandbox.svg?branch=master)](https://travis-ci.com/githubfoam/freebsd-sandbox)  

Travis (.com) dragonflybsd branch:
[![Build Status](https://travis-ci.com/githubfoam/freebsd-sandbox.svg?branch=feature_dragonflybsd)](https://travis-ci.com/githubfoam/freebsd-sandbox)  

Travis (.com) hardenedbsd branch:
[![Build Status](https://travis-ci.com/githubfoam/freebsd-sandbox.svg?branch=feature_hardenedbsd)](https://travis-ci.com/githubfoam/freebsd-sandbox)  

freebsd docker-base image(experimental)
~~~~
hostnamectl
  Static hostname: vg-docker-01
        Icon name: computer-vm
          Chassis: vm
       Machine ID: 3e886f65de8e45aa99bd9f0f2d00ad51
          Boot ID: 37046bf1cd014fb8aac7a4deb9444c17
   Virtualization: kvm
 Operating System: CentOS Linux 7 (Core)
      CPE OS Name: cpe:/o:centos:centos:7
           Kernel: Linux 3.10.0-1062.9.1.el7.x86_64
     Architecture: x86-64


$ docker --version
Docker version 19.03.5, build 633a0ea     

$ ls -l /vagrant/dockerfiles/freebsd/
total 217469
-rw-rw-rw-. 1 vagrant vagrant 161218776 Nov  1 05:11 base.txz
-rwxrwxrwx. 1 vagrant vagrant       401 Jan 19 00:03 Dockerfile.freebsd

$ wget https://download.freebsd.org/ftp/releases/amd64/12.1-RELEASE/base.txz

$ cat /vagrant/dockerfiles/freebsd/Dockerfile.freebsd
# http://ftp.freebsd.org/pub/FreeBSD/releases/amd64/amd64/12.1-RELEASE/
# https://stackoverflow.com/questions/54158342/cannot-run-freebsd-terminal-in-docker-container
# host must be FreeBSD

FROM scratch
LABEL Description="FreeBSD 12.1-RELEASE base installation"

ADD base.txz /
CMD ["/bin/sh"]

$ sudo docker image ls
freebsd                         12.2                e6cf098a1ce8        31 hours ago        1.13GB

$ sudo docker run --rm -it freebsd:12.2 /bin/sh

~~~~

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
~~~~

https://www.freebsd.org/
https://www.dragonflybsd.org/
https://hardenedbsd.org/

vagrant boxes

https://github.com/chef/bento/tree/main/os_pkrvars/freebsd

https://portal.cloud.hashicorp.com/vagrant/discover/bento/freebsd-14.0

https://portal.cloud.hashicorp.com/vagrant/discover/bento/hardenedbsd-11

https://portal.cloud.hashicorp.com/vagrant/discover/dragonflybsd/dragonfly520
~~~~