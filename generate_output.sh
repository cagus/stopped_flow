#!/bin/bash
# To run this script you need docker (http://docker.io)
CONT_NAME=kd1080_2015_labbpek
cd $(dirname $0)
DOCKERIMAGE=bjodah/bjodah-scicomp
#DOCKERIMAGE=./environment # could also be e.g.: 'ubuntu:trusty'
if [[ "$DOCKERIMAGE" == ./* ]]; then
    DOCKERIMAGE=$(docker build $DOCKERIMAGE | tee /dev/tty | tail -1 | cut -d' ' -f3)
fi
docker run --name $CONT_NAME -e TERM -e HOST_UID=$(id -u) -e HOST_GID=$(id -g) --net='none' -v $(pwd)/input:/input:ro -v $(pwd)/output:/output -w /input -i $DOCKERIMAGE ./entrypoint.sh
RUN_EXIT=$(docker wait $CONT_NAME)
docker rm $CONT_NAME
if [[ "$RUN_EXIT" != "0" ]]; then
    echo "Failed to build."
else
    echo "Successfully built."
fi
