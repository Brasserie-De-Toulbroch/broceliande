#! /bin/bash

IMAGE=brasserie-de-toulbroch
TAG=buildroot-rpi3
NAME=brasserie-de-toulbroch-buildroot-rpi3

# mr proper
rm -f sdcard.img

# docker build
docker rmi $IMAGE:$TAG
docker build -t $IMAGE:$TAG .

# retrieve rpi3 image
docker run -itd --name $NAME $IMAGE:$TAG

docker cp $NAME:/root/buildroot-2017.08/output/images/sdcard.img .
docker stop $NAME
docker rm $NAME
