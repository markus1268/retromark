#!/bin/bash

DOCKER_REPO="markus1268"
DOCKER_IMAGE="retromark-buildroot"

#check retromark image available ?

#build docker image
docker push ${DOCKER_REPO}/${DOCKER_IMAGE}:latest
