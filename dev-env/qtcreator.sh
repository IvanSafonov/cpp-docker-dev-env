#!/bin/bash
set -ex

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

IMAGE=<your docker registry>:5000/dev-env
CONTAINER_NAME=qtcreator
FAKE_HOME=$SCRIPTDIR/dev-env-home

mkdir -p $FAKE_HOME

FONTCONF=.config/fontconfig/fonts.conf
if [ ! -e  $FAKE_HOME/$FONTCONF ] ; then
    mkdir -p `dirname $FAKE_HOME/$FONTCONF`
    cp $HOME/$FONTCONF $FAKE_HOME/$FONTCONF
fi

xhost +
docker run --rm --name $CONTAINER_NAME --privileged --net=host \
    -u `id -u`:`id -g` -e DISPLAY -e LANG=C.UTF-8 -e LC_ALL=C.UTF-8 \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$FAKE_HOME:/home/$(id -un)" \
    $IMAGE
