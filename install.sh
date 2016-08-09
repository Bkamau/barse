#!/bin/sh

#fix locale
echo "export LC_ALL=en_US.UTF-8" >> ~/.bash_profile
echo "export LANG=en_US.UTF-8" >> ~/.bash_profile
echo "export LC_CTYPE=en_US.UTF-8" >> ~/.bash_profile
echo "export LANGUAGE=en_US.UTF-8" >> ~/.bash_profile
. ~/.bash_profile


#set timezone
sudo timedatectl set-timezone Europe/Helsinki

#set up users
sudo useradd -m git
sudo useradd -m ubuntu

sudo groupadd -g 33 www-data
sudo useradd \
  -g www-data --no-user-group \
  --home-dir /var/www --no-create-home \
  --shell /usr/sbin/nologin \
  --system --uid 33 www-data



#install ubuntu updates
sudo apt update 

#install nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install MongoDB
sudo apt-get -y remove mongodb
sudo apt-get -y autoremove
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt -y install --allow-unauthenticated mongodb-org

# Install PM2
sudo npm install pm2 -g

sh copy-dir.sh
