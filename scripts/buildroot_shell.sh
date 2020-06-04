#!/bin/bash
PROJECT_DIR="$(pwd)"
DL_DIR="${PROJECT_DIR}/dl"
OUTPUT_DIR="${PROJECT_DIR}/output"
CCACHE_DIR="${PROJECT_DIR}/buildroot-ccache"
BUILDROOT_DIR="${PROJECT_DIR}/buildroot"
CONFIGS_DIR="${PROJECT_DIR}/configs"
platform=$1

UID0="$(id -u)"
GID0="$(id -g)"
USER0="$(whoami)"

#DOCKER_REPO="batocera"
#DOCKER_IMAGE="batocera.linux-build"
DOCKER_REPO="markus1268"
DOCKER_IMAGE="retromark-buildroot"

# Protect ${platform} value, if buildroot platform config not supported then quit
if [ -z "${1}" ]; then
    echo "usage: ${0} Platform"
    exit 1
fi

if [ ! -f "${CONFIGS_DIR}/retromark-${platform}_defconfig" ]; then
    echo "Platform retromark-${platform}_defconfig not found"
    exit 1
fi

# check buildroot configuration already done
if [ ! -d "${OUTPUT_DIR}/${platform}/build" ]; then
    echo "Pls. make builroot configuration for retromark-${platform}_defconfig: buildroot_config.sh ${platform}"
    exit 1
fi

echo "Entering docker shell...: ${platform}"

# start docker
# check docker image available ?

docker run -it --rm -v ${PROJECT_DIR}:/build -v ${DL_DIR}:/build/buildroot/dl -v ${OUTPUT_DIR}/${platform}:/${platform} -w /${platform} -v ${CCACHE_DIR}:/home/${USER0}/.buildroot-ccache -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -u ${UID0}:${GID0} ${DOCKER_REPO}/${DOCKER_IMAGE} 

