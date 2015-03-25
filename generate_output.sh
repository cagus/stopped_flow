#!/bin/bash
# To run this script you need docker (http://docker.io)

DOCKERIMAGE=./environment # could also be e.g.: 'ubuntu:trusty'
imghash=$(docker build $DOCKERIMAGE | tail -1 | cut -d' ' -f3)
docker run -e HOST_UID=$(id -u) -e HOST_GID=$(id -g) --net='none' -v $(pwd)/input:/input:ro -v $(pwd)/output:/output -w /input -i $imghash ./entrypoint.sh
