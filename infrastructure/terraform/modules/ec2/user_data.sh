#!/bin/bash
set -e  # Stop script if an error occurs

# Update system
sudo yum update -y

# Install Nginx
sudo amazon-linux-extras enable nginx1
sudo yum install -y nginx git

# Start and enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Install Go (Required for Hugo)

sudo yum remove -y golang
cd /usr/local
sudo curl -LO https://go.dev/dl/go1.23.5.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.23.5.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc

# Install Hugo
curl -LO https://github.com/gohugoio/hugo/releases/download/v0.125.3/hugo_extended_0.125.3_Linux-64bit.tar.gz
tar -xvzf hugo_extended_0.125.3_Linux-64bit.tar.gz
sudo mv hugo /usr/local/bin/

# Clone Hugo Site from GitHub
cd /home/ec2-user/
rm -rf hugo-site  # Remove old repo (if exists)
git clone https://github.com/Priya-coding/CloudMasteryBlueprints.git hugo-site
cd hugo-site/hugo-site/CloudMastery_Site

# Build Hugo Site
hugo -D

# Deploy to Nginx
sudo rm -rf /usr/share/nginx/html/*
sudo cp -r public/* /usr/share/nginx/html/
sudo chown -R nginx:nginx /usr/share/nginx/html/
sudo chmod -R 755 /usr/share/nginx/html/

# Restart Nginx to apply changes
sudo systemctl restart nginx
