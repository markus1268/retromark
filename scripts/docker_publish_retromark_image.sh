#!/bin/bash

DOCKER_REPO="markus1268"
DOCKER_IMAGE="retromark-buildroot"

#check markus1268/retromark-buildroot image available ?

#publish docker image to docker hub
docker push ${DOCKER_REPO}/${DOCKER_IMAGE}:latest
