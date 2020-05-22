#!/bin/bash
PROJECT_DIR="$(pwd)"
DL_DIR="${PROJECT_DIR}/dl"
OUTPUT_DIR="${PROJECT_DIR}/output"
CCACHE_DIR="${PROJECT_DIR}/buildroot-ccache"

UID0="$(id -u)"
GID0="$(id -g)"
USER0="$(whoami)"

echo "Project directory:  ${PROJECT_DIR}"
echo "Download directory: ${DL_DIR}"
echo "Build directory:    ${OUTPUT_DIR}"
docker run -it --rm -v ${PROJECT_DIR}:/build -v ${DL_DIR}:/build/buildroot/dl -v ${OUTPUT_DIR}/rpi4:/rpi4 -w /rpi4 -v ${CCACHE_DIR}:/home/${USER0}/.buildroot-ccache -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -u ${UID0}:${GID0} batocera/batocera.linux-build 

