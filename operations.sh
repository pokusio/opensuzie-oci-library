#!/bin/sh


export PORTUS_RELEASE_TAG=${PORTUS_RELEASE_TAG:-'opensuzie/portus:2.5'}
export DOCKER_BUILD_CONTEXT=docker-containers/derived_images/portus

set +x 

git clone git@gitlab.com:second-bureau/pegasus/docker/docker-containers.git


sed -i "s#15.0#15.1#g" Dockerfile

echo "--------------------------------"
echo "reset lines in Dockerfile : "
echo "--------------------------------"
cat Dockerfile |grep '15.1'
echo "--------------------------------"
docker build $DOCKER_BUILD_CONTEXT -t opensuzie/portus:2.5



