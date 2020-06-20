#!/bin/bash
set -eox pipefail #safety for script

echo "=============================Install kvm qemu libvirt============================================================="
apt-get -qq update
apt-get install -y cpu-checker bridge-utils dnsmasq-base ebtables libvirt-bin libvirt-dev qemu-kvm qemu-utils ruby-dev
systemctl status libvirtd
libvirtd --version
egrep -c '(vmx|svm)' /proc/cpuinfo #If 0 it means that your CPU doesn't support hardware virtualization.If 1 or more it does - but you still need to make sure that virtualization is enabled in the BIOS.
addgroup libvirtd
adduser  $(id -un) libvirtd #ensure that your username is added to the group libvirtd
kvm-ok
echo "=============================Install Vagrant============================================================="
export VAGRANT_CURRENT_VERSION="$(curl -s https://checkpoint-api.hashicorp.com/v1/check/vagrant | jq -r -M '.current_version')"
apt-get install -qqy unzip jq
wget -nv https://releases.hashicorp.com/vagrant/${VAGRANT_CURRENT_VERSION}/vagrant_${VAGRANT_CURRENT_VERSION}_x86_64.deb
dpkg -i vagrant_${VAGRANT_CURRENT_VERSION}_x86_64.deb
vagrant version
echo "=============================Install Vagrant============================================================="
vagrant plugin install vagrant-libvirt #The vagrant-libvirt plugin is required when using KVM on Linux
vagrant plugin install vagrant-mutate #Convert vagrant boxes to work with different providers
vagrant box add "freebsd/FreeBSD-12.1-STABLE" --provider=virtualbox
vagrant mutate "freebsd/FreeBSD-12.1-STABLE" libvirt
vagrant status
virsh list --all #show all running KVM/libvirt VMs
vagrant box list #veridy installed boxes
vagrant status #Check the status of the VMs to see that none of them have been created yet
vagrant up --provider=libvirt node-4
vagrant status
virsh list --all #show all running KVM/libvirt VMs
