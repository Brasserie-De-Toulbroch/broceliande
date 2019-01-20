FROM debian:stable

# Buildroot deps
RUN apt-get update && apt-get install -y \
	bc \
	bzip2 \
	cpio \
	file \
	gcc \
	g++ \
	git \
	gzip \
	make \
	ncurses-dev \
	python \
	unzip \
	wget \
	autotools-dev \
	automake \
	libtool

WORKDIR /root
RUN wget https://buildroot.org/downloads/buildroot-2017.08.tar.gz
RUN tar zxvf buildroot-2017.08.tar.gz

WORKDIR /root/buildroot-2017.08
COPY users.tables users.tables
COPY defconfig configs/embsys_defconfig
COPY busybox.config busybox.config

RUN make embsys_defconfig && make
