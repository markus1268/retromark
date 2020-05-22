#!/bin/bash
PROJECT_DIR="$(pwd)"
DL_DIR="${PROJECT_DIR}/dl"
OUTPUT_DIR="${PROJECT_DIR}/output"
CCACHE_DIR="${PROJECT_DIR}/buildroot-ccache"
device=$1

UID0="$(id -u)"
GID0="$(id -g)"
USER0="$(whoami)"

# check ${device} value
# check configuration or output build exist
# check and create ccache directory
echo "Building:  ${device}_defconfig"

docker run -it --rm -v ${PROJECT_DIR}:/build -v ${DL_DIR}:/build/buildroot/dl -v ${OUTPUT_DIR}/${device}:/${device} -v ${CCACHE_DIR}:/home/${USER0}/.buildroot-ccache -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -u ${UID0}:${GID0} batocera/batocera.linux-build make O=/${device} -C /build/buildroot

