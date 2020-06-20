#!/bin/sh
set -eox pipefail #safety for script
echo $SHELL # freebsd shell

echo "=============================ansible ============================================================="
make -C /usr/ports/sysutils/ansible install # install from ports
# pkg install py27-ansible #Python 2 version
# pkg install py36-ansible #Python 3 version
ansible --version
cat <<EOF | sudo tee ansible-local.yml
---
  - name: "Run ansible locally localhost"
    hosts: localhost
    connection: local
    tasks:

    - name: "run ls -lrt command"
      shell: "ls -lrt"
      register: "output"

    - debug: var=output.stdout_lines
EOF
pwd && ls -lai
ansible-playbook ansible-local.yml
echo "=========================================================================================="
