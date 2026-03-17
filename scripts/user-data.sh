#!/bin/bash

sudo apt update -y
sudo apt install nginx -y

echo "<h1>Welcome to Scalable AWS Web App</h1>" > /var/www/html/index.html

systemctl start nginx
systemctl enable nginx
