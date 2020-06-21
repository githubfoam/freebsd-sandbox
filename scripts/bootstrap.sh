#!/bin/sh
set -eox pipefail #safety for script
echo $SHELL # freebsd shell
echo '192.168.50.14 vgnode04 vgnode04.local' | tee -a /etc/hosts
echo '192.168.50.15 vgnode05 vgnode05.local' | tee -a /etc/hosts
cat /etc/hosts
pkg install --yes python37 #Install Python 2.x or Python 3.x
type python3.7
pkg install --yes py37-ansible-2.9.7 #Python 3 version
ansible --version

cat <<EOF | tee freebsd-system-update.yaml
---
   - name: Fetching binary system updates
     when: ansible_facts["os_family"] == "FreeBSD"
     command: freebsd-update --not-running-from-cron fetch
     register: fetch_result
     changed_when: "'No updates needed' not in fetch_result.stdout"

   - name: Checking if Boot Environments are supported
     when: create_be and fetch_result.changed and ansible_facts["distribution_version"] is version("12", ">=")
     command: bectl list -H
     register: bectl_result
     ignore_errors: yes

   - name: Creating a new Boot Environment
     when: bectl_result is not skipped and bectl_result is not failed
     command: bectl create "ansible_{{ansible_date_time.iso8601_basic_short}}_system_update"
     register: bectl_result

   - name: Installing recently fetched binary system updates
     when: fetch_result.changed
     command: freebsd-update --not-running-from-cron install
     register: install_result
     changed_when: "'No updates are available to install' not in install_result.stdout"

   - name: Getting new system version and patch level
     when: install_result.changed
     command: freebsd-version
     register: version_result

   - name: Printing update summary
     when: version_result.changed
     debug:
       msg: System updated from {{ansible_distribution_release}} to {{version_result.stdout}}
EOF
pwd && ls -lai
ansible-playbook freebsd-system-update.yaml
echo "=========================================================================================="
cat <<EOF | tee freebsd-packages-upgrade.yaml
---
 - name: Explicitly updating local repository catalogue
   when: ansible_facts["os_family"] == "FreeBSD"
   command: pkg update
   register: update_result
   changed_when: "'FreeBSD repository update completed' in update_result.stdout"

 - name: Checking for outdated packages
   when: ansible_facts["os_family"] == "FreeBSD"
   command: pkg version -RU -l \<
   register: outdated_result
   changed_when: outdated_result.stdout_lines | length > 0

 - name: Checking if Boot Environments are supported
   when: outdated_result.changed and create_be and ansible_facts["distribution_version"] is version("12", ">=")
   command: bectl list -H
   register: bectl_result
   ignore_errors: yes

 - name: Creating a new Boot Environment
   when: bectl_result is not skipped and bectl_result is not failed
   command: bectl create "ansible_{{ansible_date_time.iso8601_basic_short}}_packages_upgrade"
   register: bectl_result

 - name: Upgrading installed packages
   when: outdated_result.changed
   command: pkg upgrade -y
   register: upgrade_result
   changed_when: "'Your packages are up to date' not in upgrade_result.stdout"

 - name: Printing a list of upgraded packages
   when: upgrade_result.changed
   debug:
     msg: "{{upgrade_result.stdout_lines | select('search', '] Upgrading') | list}}"
EOF
pwd && ls -lai
ansible-playbook freebsd-packages-upgrade.yaml
