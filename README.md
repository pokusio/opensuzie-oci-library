# Portus OCI container images library

## Why

I have startedworking with [`Portus`](https://github.com/SUSE/portus) in November `2019`, and
very soon, ended up fixing multiple issues with other community users like :

* https://github.com/Ashtonian
* https://github.com/diranged
* https://github.com/robgiovanardi
* The nice https://github.com/Kulturserver Tech Team, and Alex Klotz

You may read examples of those issues here : https://github.com/SUSE/Portus/issues?utf8=%E2%9C%93&q=is%3Aissue+lasselle

All in all I finally decided to re-design

## What is this

This repo contains all defintions of :
* the OCI container images to run [`Portus`](https://github.com/SUSE/portus)
* all of the images you will find in this repo are modifications of OCI image defintions from https://github.com/openSUSE/docker-containers
* https://github.com/openSUSE/docker-containers is mirrored by a repo I own, https://gitlab.com/pokus-io/opensuse/docker-containers
* the difference is that for every release of this repo :
  * for every OCI image defintion, the release notes give an exiting tag, on the https://gitlab.com/pokus-io/opensuse/docker-containers repository
  * so this tag points at an inambiguous commit hash from https://github.com/openSUSE/docker-containers
  *

## Releases Bill Of Material


### Release `0.0.1` :

| Image name              | Component of     | Notes             |
|------------------------ |----------------- |------------------ |
| `opensuzie/portus:2.5`  | `portus`         | `OpenSUSE` Team publishes that with generic mame `opensuse/portus:2.5` |

## How to use

### Building a `portus` image

This image is used torun both the main `portus` server, and its `background` companion.

To build a release of that container, execute the following :

```bash

export SUZIE_OCI_LIBRARY_GIT_URI=git@github.com:pokusio/opensuzie-oci-library.git
export WORK_FOLDER=$(mktemp -d /tmp/suzie.oci.library.XXXXXXXX)
# define image tag
export PORTUS_RELEASE_TAG=${PORTUS_RELEASE_TAG:-'opensuzie/portus:2.5'}
git clone

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
