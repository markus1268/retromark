#!/bin/bash

DOCKER_REPO="markus1268"
IMAGE_NAME="retromark-buildroot"

#check retromark image available ?

#build docker image
docker build . -t ${DOCKER_REPO}/${IMAGE_NAME}
