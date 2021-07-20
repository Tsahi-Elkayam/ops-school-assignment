#!/bin/bash
#add fix to exercise3 here

sudo sed -i 's/Require all denied/Require all granted/i' /etc/apache2/sites-enabled/000-default.conf
