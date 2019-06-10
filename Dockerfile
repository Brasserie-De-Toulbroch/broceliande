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
RUN rm -rf dl
COPY dl dl
COPY post-image.sh board/raspberrypi3/post-image.sh
RUN chmod a+x board/raspberrypi3/post-image.sh
COPY rootfs-overlay board/raspberrypi3/rootfs-overlay/
COPY defconfig configs/druid_defconfig
COPY busybox.config busybox.config
COPY package/Config.in package/Config.in
COPY package/bard package/bard
COPY package/druid package/druid
COPY package/idesk package/idesk

RUN make druid_defconfig && make
