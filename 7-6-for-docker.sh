#!/bin/bash

SRCDIR="$(realpath `dirname $0`)"

export FREEONLINEOFFICE_BRANCH="7-6"
export CORE_BRANCH="libreoffice-7-6"
export DOCKER_HUB_REPO="freeonlineoffice/online"
export DOCKER_HUB_TAG="$FREEONLINEOFFICE_BRANCH"

. $SRCDIR/run_build.sh
