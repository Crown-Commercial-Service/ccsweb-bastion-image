#!/bin/bash
# Packer build script

set -e

# Update system packages
sudo yum update -y

# Setup AWS CW logging
sudo yum install -y awslogs

sudo chown root:root \
    ~ec2-user/awscli.conf \
    ~ec2-user/awslogs.conf

sudo chmod 640 \
    ~ec2-user/awscli.conf \
    ~ec2-user/awslogs.conf

sudo mv -f \
    ~ec2-user/awscli.conf \
    ~ec2-user/awslogs.conf \
    /etc/awslogs/

sudo systemctl enable awslogsd
