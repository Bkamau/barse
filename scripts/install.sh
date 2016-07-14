#!/bin/sh

#fix locale
echo "export LC_ALL=en_US.UTF-8" >> ~/.bash_profile
echo "export LANG=en_US.UTF-8" >> ~/.bash_profile
echo "export LC_CTYPE=en_US.UTF-8" >> ~/.bash_profile
echo "export LANGUAGE=en_US.UTF-8" >> ~/.bash_profile
. ~/.bash_profile

#install ubuntu updates
sudo apt-get upgrade -y

#set timezone
sudo timedatectl set-timezone Europe/Helsinki

#ppa nginx mainline
echo "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://nginx.org/packages/mainline/ubuntu/ trusty nginx" | sudo tee -a /etc/apt/sources.list

#install nginx
wget http://nginx.org/keys/nginx_signing.key
sudo apt-key add nginx_signing.key
sudo apt-key update -y
sudo apt-get update -y
sudo apt-get install -y nginx

#install nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 -y
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update -y
sudo apt-get install -y mongodb-org
sudo service mongod start

# Install PM2
sudo npm install pm2 -g

sh copy-dir.sh
