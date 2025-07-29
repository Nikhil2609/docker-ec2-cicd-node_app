#!/bin/bash

echo 'before login'

# Pull latest image from ECR
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 677674062026.dkr.ecr.ap-south-1.amazonaws.com

echo 'login sucessfull'

docker pull 677674062026.dkr.ecr.ap-south-1.amazonaws.com/docker-image-repository:latest

# Stop & remove existing container
docker stop node-app || true
docker rm node-app || true

# Run new container
docker run -d -p 3000:3000 --name node-app 677674062026.dkr.ecr.ap-south-1.amazonaws.com/docker-image-repository:latest
