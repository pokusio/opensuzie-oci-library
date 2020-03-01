## Release Bill Of Material

Here are the released (fixed) openSUSE containers :

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
