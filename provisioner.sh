#!/bin/bash

sudo atp-get update -y
sudo apt-get install -y java

sudo unlink /etc/localtime 
sudo ln -s /usr/share/zoneinfo/Europe/London /etc/localtime

echo "testing.local" >> /etc/hostname

sudo shutdown -r now
