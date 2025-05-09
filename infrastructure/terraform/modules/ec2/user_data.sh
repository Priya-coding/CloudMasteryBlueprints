#!/bin/bash
set -e  # Exit on any error

# Update system
yum update -y

# Install Docker
amazon-linux-extras enable docker
yum install -y docker
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

# Install AWS CLI (v2)
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
yum install -y unzip
unzip awscliv2.zip
sudo ./aws/install

# Authenticate Docker with ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 442042517591.dkr.ecr.us-east-1.amazonaws.com

# Pull Docker image from ECR
docker pull 442042517591.dkr.ecr.us-east-1.amazonaws.com/cloudmastery-hugo-dev:latest

# Run the container
docker run -d -p 80:80 442042517591.dkr.ecr.us-east-1.amazonaws.com/cloudmastery-hugo-dev:latest
