#!/bin/bash

SRCDIR="$(realpath `dirname $0`)"

export FREEONLINEOFFICE_BRANCH="master"
export CORE_BRANCH="master"
export DOCKER_HUB_REPO="freeonlineoffice/online"
export DOCKER_HUB_TAG="nightly"

. $SRCDIR/run_build.sh
