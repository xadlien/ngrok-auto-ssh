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
mv auto-start-ssh.sh /home/ngrok/bin/

# install requirements
apt update && apt install mailutils

# set api key
/home/ngrok/bin/ngrok authtoken #put your auth token here