#!/bin/bash

SRCDIR="$(realpath `dirname $0`)"

export FREEONLINEOFFICE_BRANCH="7-5"
export CORE_BRANCH="libreoffice-7-5"
export DOCKER_HUB_REPO="ghcr.io/freeonlineoffice/online"
export DOCKER_HUB_TAG="$FREEONLINEOFFICE_BRANCH"

. $SRCDIR/run_build.sh
