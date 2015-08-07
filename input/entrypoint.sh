#!/bin/bash

./build.sh
BUILD_EXIT=$?

# The docker script is run as root (UID=0, GID=0)
# the docker environment has the environment variables
# HOST_UID and HOST_GID set which we may use to change
# the ownership of the generated output:
chown -R $HOST_UID:$HOST_GID ../output
exit $BUILD_EXIT
