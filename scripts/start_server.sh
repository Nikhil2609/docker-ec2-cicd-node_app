#!/bin/bash

echo 'before login'

# Pull latest image from ECR
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 677674062026.dkr.ecr.ap-south-1.amazonaws.com

echo 'after login'

echo 'before docker pull'

sudo docker pull 677674062026.dkr.ecr.ap-south-1.amazonaws.com/docker-image-repository:latest
echo 'after docker pull'

# Stop & remove existing container
sudo docker stop node-app || true
sudo docker rm node-app || true

echo 'before container run'
# Run new container
sudo docker run -d -p 3000:3000 --name node-app 677674062026.dkr.ecr.ap-south-1.amazonaws.com/docker-image-repository:latest
echo 'after container run'