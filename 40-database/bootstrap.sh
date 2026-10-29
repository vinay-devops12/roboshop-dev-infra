#!/bin/bash#!/bin/bash
component=$1      # mongodb
environment=$2    # dev


dnf install ansible -y


mkdir -p /var/log/roboshop/
chown -R ec2-user:ec2-user /var/log/roboshop
chmod -R 755 /var/log/roboshop
touch /var/log/roboshop/ansible.log


cd /home/ec2-user
if [ -d "project-ansible-2" ]; then
    cd project-ansible-2
    git pull
else
    git clone https://github.com/vinay-devops12/project-ansible-2.git
    cd project-ansible-2
fi

ansible-playbook -e env=$environment 01-${component}.yaml &>>/var/log/roboshop/ansible.log