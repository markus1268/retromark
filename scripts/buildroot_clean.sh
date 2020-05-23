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

# Protect ${platform} value, if buildroot platform config not supported then quit
if [ -z "${1}" ]; then
    echo "usage: ${0} Platform"
    exit 1
fi

if [ ! -f "${BUILDROOT_DIR}/configs/${platform}_defconfig" ]; then
    echo "Platform ${platform}_defconfig not found"
    exit 1
fi

# check buildroot configuration already done
if [ ! -d "${OUTPUT_DIR}/${platform}/build" ]; then
    echo "Pls. make builroot configuration for ${platform}_defconfig: buildroot_config.sh ${platform}"
    exit 1
fi

echo "Buildroot cleaning...: ${platform}"

# start docker
# check docker image available ?

docker run -it --init --rm -v ${PROJECT_DIR}:/build -v ${DL_DIR}:/build/buildroot/dl -v ${OUTPUT_DIR}/${platform}:/${platform} -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -u ${UID0}:${GID0} batocera/batocera.linux-build make O=/${platform} -C /build/buildroot clean

