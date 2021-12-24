#!/bin/bash

# create ngrok user
useradd -m ngrok
mkdir -p /home/ngrok/bin 
chown ngrok /home/ngrok/bin 

# install binary
curl 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz' -o ngrok.tgz
tar -xvf ngrok.tgz
mv ngrok /home/ngrok/bin/

# install script
cp auto-start-ssh.sh /home/ngrok/bin/
chmod 700 /home/ngrok/bin/auto-start-ssh.sh

# install requirements
apt update && apt install -y mailutils sendmail

# set api key
/home/ngrok/bin/ngrok authtoken #put your auth token here

# install service file
cp ngrok-ssh.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable ngrok-ssh.service 
systemctl start ngrok-ssh.service 