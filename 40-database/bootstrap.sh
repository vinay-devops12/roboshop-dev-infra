# #!/bin/bash

# component=$1 #mongodb
# environment=$2 #dev
# dnf install ansible -y
# mkdir -p /var/log/roboshop/
# chown -R ec2-user:ec2-user /var/log/roboshop
# chmod -R 755 /var/log/roboshop
# touch /var/log/roboshop/ansible.log

# cd /home/ec2-user
# git clone https://github.com/daws-90s/ansible-project-v3.git
# cd ansible-project-v3
# git pull
# ansible-playbook -e component=$component -e env=$environment roboshop.yaml

#!/bin/bash
set -ex
component=$1
environment=$2

## specify path for ansible-palybook 
export PATH="/usr/local/bin:/usr/bin:/bin:$PATH"

dnf install python3-pip git -y

pip3 install --break-system-packages ansible botocore boto3 || pip3 install ansible botocore boto3

mkdir -p /var/log/roboshop/
chown -R ec2-user:ec2-user /var/log/roboshop
chmod -R 755 /var/log/roboshop

cd /home/ec2-user
rm -rf ansible-project-v3
git clone https://github.com/vinay-devops12/ansible-project-v3.git
cd ansible-project-v3

ansible-playbook -e component=$component -e env=$environment roboshop.yaml 2>&1 | tee -a /var/log/roboshop/ansible.log