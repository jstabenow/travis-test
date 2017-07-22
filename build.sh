#!/bin/sh

# ./build.sh 3.1 3.2

FFMPEG_VERSIONS=$@

for VERSION in $FFMPEG_VERSIONS
do

    # build amd64 image
    docker build --build-arg FFMPEG_VERSION=$VERSION -f Dockerfile_AMD64 -t datarhei/ffmpeg:$VERSION .
    docker push datarhei/ffmpeg:$VERSION
    
    # build armhf image
    docker build --build-arg FFMPEG_VERSION=$VERSION -f Dockerfile_ARMHF -t datarhei/ffmpeg:$VERSION-armhf .
    docker push datarhei/ffmpeg:$VERSION-armhf
    
    # build armhf omx image
    docker build --build-arg FFMPEG_VERSION=$VERSION -f Dockerfile_ARMHF_OMX -t datarhei/ffmpeg:$VERSION-armhf .
    docker push datarhei/ffmpeg:$VERSION-armhf-omx
    
done
