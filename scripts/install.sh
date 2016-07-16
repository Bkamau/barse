#!/bin/sh

#fix locale
echo "export LC_ALL=en_US.UTF-8" >> ~/.bash_profile
echo "export LANG=en_US.UTF-8" >> ~/.bash_profile
echo "export LC_CTYPE=en_US.UTF-8" >> ~/.bash_profile
echo "export LANGUAGE=en_US.UTF-8" >> ~/.bash_profile
. ~/.bash_profile

#install ubuntu updates
sudo apt update && apt -y  upgrade

#set timezone
sudo timedatectl set-timezone Europe/Helsinki

#install nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install MongoDB
sudo apt adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 -y
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt -y update 
sudo apt -y install --allow-unauthenticated mongodb-org

# Install PM2
sudo npm install pm2 -g

sh copy-dir.sh
