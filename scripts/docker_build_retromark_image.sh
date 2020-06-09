#!/bin/bash

DOCKER_REPO="markus1268"
DOCKER_IMAGE="retromark-buildroot"

#check markus1268/retromark-buildroot image available ?

#build docker image
#docker build --pull --no-cache -t ${DOCKER_REPO}/${DOCKER_IMAGE} scripts/docker
docker build --pull -t ${DOCKER_REPO}/${DOCKER_IMAGE} scripts/docker
