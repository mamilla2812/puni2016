#!/usr/bin/env bash
#DEPLOY="false"
DEPLOY="true"
IMAGE=project6
#VERSION=latest
VERSION=1.0-SNAPSHOT

OPTIONS=""
OPTIONS="--no-cache --force-rm"
#OPTIONS="--no-cache"
#OPTIONS="--force-rm"

docker build ${OPTIONS} -t ivonet/${IMAGE}:${VERSION} .
if [ "$?" -eq 0 ] && [ ${DEPLOY} == "true" ]; then
    docker push ivonet/${IMAGE}:${VERSION}
fi