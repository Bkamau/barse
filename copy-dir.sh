#!/bin/sh

# Create app directory
sudo mkdir -p /usr/src/apps
sudo mkdir -p /etc/caddy

mkdir /etc/caddy
chown -R root:www-data /etc/caddy
mkdir /etc/ssl/caddy
chown -R www-data:root /etc/ssl/caddy
chmod 0770 /etc/ssl/caddy

# Bundle app source
sudo cp -rf ../letsencrypt /etc
sudo cp -rf ../ParseServer /usr/src/apps
sudo cp -rf ../Caddy/caddy /usr/bin
sudo cp -rf ../Caddy/Caddyfile /etc/caddy
sudo cp -rf ../Caddy/caddy.service /etc/systemd/system
sudo cp -rf ../Mongodb/mongodb.service /etc/systemd/system

# Enable & start mongo server
sudo systemctl enable mongodb.service
sudo systemctl start mongodb.service

#Install server
cd /usr/src/apps/ParseServer
sudo chown -R ubuntu /usr/src/apps
sudo npm install

# Provision server
pm2 start /usr/src/apps/ParseServer/start.sh --name="ParseServer"
pm2 startup ubuntu
sudo su -c "env PATH=$PATH:/usr/bin pm2 startup ubuntu -u ubuntu --hp /home/ubuntu"
pm2 save

# Enable & start caddy web server
sudo systemctl enable caddy.service
sudo systemctl start caddy.service

# Enjoy
echo "Wait 30  secs for server to start"
