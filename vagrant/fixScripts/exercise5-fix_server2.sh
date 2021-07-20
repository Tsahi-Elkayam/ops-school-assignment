#!/bin/bash
#add fix to exercise5-server2 here

# Passwordless SSH Configuration
sudo sed  -i  's/#   StrictHostKeyChecking ask/    StrictHostKeyChecking no/i'  /etc/ssh/ssh_config

# SSH Service Restart 
sudo service ssh restart

# copy keys from shared directory to local
cat /vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
mv /vagrant/.ssh/id_rsa /home/vagrant/.ssh/
