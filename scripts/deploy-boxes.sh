#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "========================================================================================="
vagrant plugin install vagrant-libvirt #The vagrant-libvirt plugin is required when using KVM on Linux
vagrant plugin install vagrant-mutate #Convert vagrant boxes to work with different providers

vagrant box add "freebsd/FreeBSD-12.1-STABLE" --provider=virtualbox
vagrant mutate "freebsd/FreeBSD-12.1-STABLE" libvirt
vagrant up --provider=libvirt "vg-freebsd-02"
# vagrant ssh vgnode04 -c "hostnamectl"


#The most common cause for this is using a shell that is unavailable on the system.
# vagrant box add "bento/freebsd-12" --provider=virtualbox
# vagrant mutate "bento/freebsd-12" libvirt
# vagrant up --provider=libvirt "vg-freebsd-01"


vagrant box list #veridy installed boxes
vagrant status #Check the status of the VMs to see that none of them have been created yet
vagrant status
virsh list --all #show all running KVM/libvirt VMs
