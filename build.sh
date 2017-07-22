#!/bin/sh

# ./build.sh 3.1 3.2

FFMPEG_VERSIONS=$@

for VERSION in $FFMPEG_VERSIONS
do

    # build armhf image
    docker build --build-arg FFMPEG_VERSION=$VERSION -f Dockerfile_ARMHF -t ffmpeg:$VERSION-armhf .
    
done
