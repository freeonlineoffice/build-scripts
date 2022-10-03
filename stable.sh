#!/bin/bash

SRCDIR="$(realpath `dirname $0`)"

export FREEONLINEOFFICE_BRANCH="7-4"
export CORE_BRANCH="libreoffice-7-4"
export DOCKER_HUB_REPO="freeonlineoffice/online"
export DOCKER_HUB_TAG="nightly"

. $SRCDIR/run_build.sh
