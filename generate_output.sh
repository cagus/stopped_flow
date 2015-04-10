#!/bin/bash
# To run this script you need docker (http://docker.io)

DOCKERIMAGE=./environment # could also be e.g.: 'ubuntu:trusty'
if [[ "$DOCKERIMAGE" == ./* ]]; then
    DOCKERIMAGE=$(docker build $DOCKERIMAGE | tee /dev/tty | tail -1 | cut -d' ' -f3)
fi
docker run -e TERM -e HOST_UID=$(id -u) -e HOST_GID=$(id -g) --net='none' -v $(pwd)/input:/input:ro -v $(pwd)/output:/output -w /input -i $DOCKERIMAGE ./entrypoint.sh
