#!/bin/bash

# This is assuming that the user is using Ubuntu
sudo apt-get update -y && apt-get upgrade -y
sudo apt-get install -y java

# Change the timezone
sudo unlink /etc/localtime 
sudo ln -s /usr/share/zoneinfo/Europe/London /etc/localtime

echo "testing.local" >> /etc/hostname

sudo shutdown -r now
