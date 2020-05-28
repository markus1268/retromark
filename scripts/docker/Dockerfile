# This Dockerfile generates the docker image that gets used for building buildroot
# To build it (YYYYMMDD.HHMM is the current date and time in UTC):
#   sudo docker build -t markus1268/retromark-buildroot:YYYYMMDD.HHMM .
#   sudo docker push markus1268/retromark-buildroot:YYYYMMDD.HHMM
FROM ubuntu:18.04

LABEL maintainer="Markus Lin <markus1268@gmail.com>" \
      vendor="LinSoft" \
description="Container with everything needed to run Buildroot & Retromark"

RUN dpkg --add-architecture i386 && \
	apt-get update -y && \
	apt-get install -y --no-install-recommends \
        bc \
        build-essential \
        bzr \
        ca-certificates \
        cmake \
        cpio \
        cvs \
        file \
        g++-multilib \
        git \
        libc6:i386 \
        libncurses5-dev \
        locales \
        mercurial \
        python-flake8 \
        python-nose2 \
        python-pexpect \
        python3 \
        python3-nose2 \
        python3-pexpect \
        qemu-system-arm \
        qemu-system-x86 \
        rsync \
        subversion \
        unzip \
        wget \
		libncurses5:i386 \
		libstdc++6:i386 \
		libssl-dev \
		texinfo \
		zip \
		default-jre \
		imagemagick \
		autoconf \
		automake \
		bison \
		scons \
		libglib2.0-dev \
		mtools \
		u-boot-tools \
		flex \
		dosfstools \
		libtool \
		device-tree-compiler \
		gettext \
        && \
    apt-get -y autoremove && \
    apt-get -y clean
		

# Set locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
	locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Workaround host-tar configure error
ENV FORCE_UNSAFE_CONFIGURE 1

# device-tree-compiler : required for device-trees-aml-s9xx
# libc6:i386 libncurses5:i386 libstdc++6:i386: required for mame2016
# gettext : required for buildstats.sh

RUN mkdir -p /build
WORKDIR /build

CMD ["/bin/bash"]
