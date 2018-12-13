#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# provision_kali.sh
#
# Install ansible and then provision a system withthe ansible code 
# found in this repo: https://github.com/l50/ansible-provision-kali
#
# Usage: bash provision_kali.sh
#
# Author: Jayson Grace, jayson.e.grace@gmail.com, 12/11/2018
# ----------------------------------------------------------------------------

# Stop execution of script if an error occurs
set -e

install_ansible(){
  # Get Ansible Installer
  wget https://raw.githubusercontent.com/l50/bash-scripts/master/install_ansible.sh -O /tmp/install_ansible.sh
  # Install Ansible
  sudo bash /tmp/install_ansible.sh
}

provision_system(){
  # Clone playbook in /root directory
  sudo -u root /bin/bash -c 'git clone git://github.com/l50/ansible-provision-kali.git "$HOME/.ansible/Workspace/ansible-provision-kali/"'

  # Install external playbooks to ansible-provision-kali roles directory
  sudo -u root /bin/bash -c 'pushd "$HOME/.ansible/Workspace/ansible-provision-kali"; ansible-galaxy install -p roles -r requirements.yml; popd'

  # Configure and provision Kali
  sudo -u root /bin/bash -c 'ansible-playbook "$HOME/.ansible/Workspace/ansible-provision-kali/site.yml" -vvvv'
}

clean_up(){
  # Remove SSH key pairs according to AWS requirements for shared AMIs: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/building-shared-amis.html
  sudo shred -u /etc/ssh/*_key /etc/ssh/*_key.pub
  sudo shred -u /home/ec2-user/.ssh/*
  # Get rid of any history
  sudo shred -u /root/.*history
}

install_ansible
provision_system
clean_up
