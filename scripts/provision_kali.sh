#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# provision.sh
#
# Install ansible and then provision a system withthe ansible code 
# found in this repo: https://github.com/l50/ansible-provision-kali
#
# Usage: bash provision.sh
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
  git clone git://github.com/l50/ansible-provision-kali.git "$HOME/.ansible/Workspace/ansible-provision-kali/"
  cd "$HOME/.ansible/Workspace/ansible-provision-kali"

  # Install external playbooks
  sudo ansible-galaxy install -r requirements.yml -p roles

  # Configure and provision Kali
  sudo ansible-playbook ~/.ansible/Workspace/ansible-provision-kali/site.yml -vvvv
}

clean_up(){
  # Remove SSH key pairs according to AWS requirements for shared AMIs: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/building-shared-amis.html
  sudo shred -u /etc/ssh/*_key /etc/ssh/*_key.pub
  sudo shred -u /home/ec2-user/.ssh/*
}

install_ansible
provision_system
clean_up
