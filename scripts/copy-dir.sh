#!/bin/sh

# Create app directory
sudo mkdir -p /usr/src/apps
sudo mkdir -p /etc/caddy

# Bundle app source
sudo cp -rf ../ParseServer /usr/src/apps
sudo cp -rf ../Caddy/caddy /usr/bin
sudo cp -rf ../Caddy/Caddyfile /etc/caddy
sudo cp -rf ../Caddy/caddy.service /etc/systemd/system

cd /usr/src/apps/ParseServer
sudo chown -R ubuntu /usr/src/apps
sudo npm install

pm2 start /usr/src/apps/ParseServer/start.sh --name="ParseServer"
pm2 startup ubuntu
sudo su -c "env PATH=$PATH:/usr/bin pm2 startup ubuntu -u ubuntu --hp /home/ubuntu"
pm2 save

sudo systemctl enable caddy.service
sudo systemctl start caddy.service

echo "Wait 30  secs for server to start"
