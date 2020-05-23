#!/bin/bash

DOCKER_REPO="batocera"
IMAGE_NAME="batocera.linux-build"

#check batocera image available ?

#pull batocera image from dockerhub
docker pull $(DOCKER_REPO)/$(IMAGE_NAME)