#!/bin/bash
# This docker script is run as root (UID=0, GID=0)
# the docker environment has the environment variables
# HOST_UID and HOST_GID set which we may use to change
# the ownership of the generated output:
addgroup --gid $HOST_GID mygroup
adduser --disabled-password --uid $HOST_UID --gid $HOST_GID --gecos '' myuser
su -m myuser -c ./build.sh
BUILD_EXIT=$?
exit $BUILD_EXIT
