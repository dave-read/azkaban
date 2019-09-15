#!/usr/bin/env bash
PGM=$(basename $0)
DIR=$(dirname $0)

PROJECT=azkaban-web-server

# assumes gradle build with target installDist was run to produce folder:
# $PROJECT/build/install/$PROJECT

# path to Dockerfile
DOCKER_FILE=$DIR/Dockerfile
# path to build context
BUILD_CONTEXT=$DIR/build/install/$PROJECT
if [[ ! -d $BUILD_CONTEXT ]];then
    echo "$PGM: Build context folder does not exist:$BUILD_CONTEXT. Make sure you build with installDist target."
    exit 1
fi
docker build -t $PROJECT -f $DOCKER_FILE $BUILD_CONTEXT