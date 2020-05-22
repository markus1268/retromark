#!/bin/bash
PROJECT_DIR="$(pwd)"
DL_DIR="${PROJECT_DIR}/dl"
OUTPUT_DIR="${PROJECT_DIR}/output"
CCACHE_DIR="${PROJECT_DIR}/buildroot-ccache"
device=$1

UID0="$(id -u)"
GID0="$(id -g)"
USER0="$(whoami)"

# Protect ${device} value, if buildroot not supported then quit
# check output-dir & mkdir -p ${OUTPUT_DIR}/${device}
echo "Building buildroot: ${device}_defconfig"

docker run -it --init --rm -v ${PROJECT_DIR}:/build -v ${DL_DIR}:/build/buildroot/dl -v ${OUTPUT_DIR}/${device}:/${device} -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -u ${UID0}:${GID0} batocera/batocera.linux-build make O=/${device} -C /build/buildroot ${device}_defconfig

