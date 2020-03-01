# Portus OCI container images library

## Why

I have startedworking with [`Portus`](https://github.com/SUSE/portus) in November `2019`, and
very soon, ended up fixing multiple issues with other community users like :

* https://github.com/Ashtonian
* https://github.com/diranged
* https://github.com/robgiovanardi
* https://github.com/shqear93
* https://github.com/ogra
* The nice https://github.com/Kulturserver Tech Team, and Alex Klotz

You may read examples of those issues here : https://github.com/SUSE/Portus/issues?utf8=%E2%9C%93&q=is%3Aissue+lasselle

All in all, we had many problems, most of them becoming hellfests because of lack of industrialization, or communication on it.

So I finally decided to re-design the whole devops factory for portus.

This repo is one of the many repo required to run that Devops factory.

## What is this

This repo contains all defintions of :
* the OCI container images to run [`Portus`](https://github.com/SUSE/portus)
* All of the images you will find in this repo are modifications or fix of OCI image defintions from https://github.com/openSUSE/docker-containers
* For every release of this repo :
  * for every OCI image defintion, the release notes give an existing tag, on the https://gitlab.com/pokus-io/opensuse/docker-containers repository
  * so this tag points at an inambiguous commit hash from https://github.com/openSUSE/docker-containers


## Releases Bill Of Material


### Release `0.0.1` :

Here are the released (fixed) openSUSE `Portus` OCI container images  :

| Image name              | Component of     | Notes             |
|------------------------ |----------------- |------------------ |
| `opensuzie/portus:2.5`  | `portus`         | `OpenSUSE` Team publishes that with generic mame `opensuse/portus:2.5` |

Tag marking the exact version from which the `0.0.1` relase of `opensuzie/portus:2.5` : https://gitlab.com/pokus-io/opensuse/docker-containers/-/tags/DEVOPS_PORTUS_2.5_REPAIRMAN


## How to use

### Building a `portus` image

This image is used torun both the main `portus` server, and its `background` companion.

To build a release of that container, execute the following :

```bash
export SUZIE_OCI_LIBRARY_RELEASE=0.0.1
export SUZIE_OCI_LIBRARY_GIT_URI=git@github.com:pokusio/opensuzie-oci-library.git
export SUZIE_OCI_LIBRARY_GIT_URI="https://github.com/pokusio/opensuzie-oci-library.git"
export WORK_FOLDER=$(mktemp -d /tmp/suzie.oci.library.XXXXXXXX)
# define image tag
export PORTUS_RELEASE_TAG=${PORTUS_RELEASE_TAG:-'opensuzie/portus:2.5'}
git clone $SUZIE_OCI_LIBRARY_GIT_URI $WORK_FOLDER
cd $WORK_FOLDER
git checkout $SUZIE_OCI_LIBRARY_RELEASE

docker build library/portus -t $PORTUS_RELEASE_TAG


```
