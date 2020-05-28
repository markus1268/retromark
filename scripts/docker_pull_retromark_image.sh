#!/bin/bash

DOCKER_REPO="markus1268"
DOCKER_IMAGE="retromark-buildroot"

#check markus1268/retromark-buildroot image available ?

#pull batocera image from dockerhub
docker pull ${DOCKER_REPO}/${DOCKER_IMAGE}