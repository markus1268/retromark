#!/bin/bash
PROJECT_DIR="$(pwd)"
DL_DIR="${PROJECT_DIR}/dl"
OUTPUT_DIR="${PROJECT_DIR}/output"
CCACHE_DIR="${PROJECT_DIR}/buildroot-ccache"
BUILDROOT_DIR="${PROJECT_DIR}/buildroot"
platform=$1

UID0="$(id -u)"
GID0="$(id -g)"
USER0="$(whoami)"

#DOCKER_REPO="batocera"
#DOCKER_IMAGE="batocera.linux-build"
DOCKER_REPO="markus1268"
IMAGE_NAME="retromark-buildroot"

# Protect ${platform} value, if buildroot platform config not supported then quit
if [ -z "${1}" ]; then
    echo "usage: ${0} Platform"
    exit 1
fi

if [ ! -f "${BUILDROOT_DIR}/configs/${platform}_defconfig" ]; then
    echo "Platform ${platform}_defconfig not found"
    exit 1
fi

# check output-dir & mkdir -p ${OUTPUT_DIR}/${platform}
if [ ! -d "${OUTPUT_DIR}/${platform}" ]; then
    mkdir -p ${OUTPUT_DIR}/${platform}
fi

# check dl-dir & mkdir -p ${DL_DIR}
if [ ! -d "${DL_DIR}" ]; then
    mkdir -p ${DL_DIR}
fi

echo "Buildroot configuring...: ${platform}_defconfig"

# start docker
# check docker image available ?

# run docker container
docker run -it --init --rm -v ${PROJECT_DIR}:/build -v ${DL_DIR}:/build/buildroot/dl -v ${OUTPUT_DIR}/${platform}:/${platform} -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -u ${UID0}:${GID0} ${DOCKER_REPO}/${DOCKER_IMAGE} make O=/${platform} -C /build/buildroot ${platform}_defconfig

