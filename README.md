# buildroot-rpi3

To build the RPI3 distribution for `Brasserie De Toulbroc'h` and retrieve the
sdcard image:

````
$ sh build.sh
$ ls sdcard.img
sdcard.img
````

To flash the image on your `/dev/sdX` sdcard:

````
$ dd if=sdcard.img of=/dev/sdX
````
