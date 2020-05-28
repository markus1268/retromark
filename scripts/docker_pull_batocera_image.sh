#!/bin/bash

DOCKER_REPO="markus1268"
IMAGE_NAME="retromark-buildroot"

#check batocera image available ?

#pull batocera image from dockerhub
docker pull ${DOCKER_REPO}/${IMAGE_NAME}