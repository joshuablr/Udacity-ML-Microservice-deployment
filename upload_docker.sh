#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=udacity-housing-prediction
tag=v1.0

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

source .env

#Autenticating
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USER" --password-stdin

#tagging image
docker tag $dockerpath:latest $DOCKER_USER/$dockerpath:$tag

# Step 3:
# Push image to a docker repository
docker push $DOCKER_USER/$dockerpath:$tag