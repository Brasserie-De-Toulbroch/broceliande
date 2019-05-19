FROM debian:stable

# Buildroot deps
RUN apt-get update && apt-get install -y \
	bc \
	bzip2 \
	cpio \
	file \
	gcc \
	gettext \
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
COPY package/Config.in package/Config.in
COPY package/bard package/bard
COPY package/druid package/druid

RUN echo "dtoverlay=w1-gpio, gpiopin=4" >> package/rpi-firmware/config.txt

RUN make embsys_defconfig && make
