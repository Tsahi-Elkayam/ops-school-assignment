#!/bin/bash
#add fix to exercise5-server1 here

# generate SSH key
ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""

# Passwordless SSH Configuration
sudo sed  -i  's/#   StrictHostKeyChecking ask/    StrictHostKeyChecking no/i'  /etc/ssh/ssh_config

# SSH Service Restart 
service ssh restart

# ssh copy key to shared directory
cp -a ~/.ssh/ /vagrant/
