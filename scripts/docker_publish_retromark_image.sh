#!/bin/bash

DOCKER_REPO="markus1268"
IMAGE_NAME="retromark-buildroot"

#check retromark image available ?

#build docker image
docker push ${DOCKER_REPO}/${IMAGE_NAME}:latest
