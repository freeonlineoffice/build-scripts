#!/bin/bash

set -e

ONLINE_SOURCE="https://github.com/freeonlineoffice/online"
CORE_SOURCE="https://github.com/LibreOffice/core"
GIT_MITIGATIONS="--depth=1 -c protocol.version=2"

# Setup caches
mkdir -p caches/external
EXTERNAL_CACHES="$(realpath caches/external)"

[ -x /usr/bin/ccache ] && (
  # Create and set ccache dir
  mkdir -p caches/ccache
  ccache -o "cache_dir=$(realpath caches/ccache)"
  # Enlarge maximum cache size
  if ccache -p | grep 'max_size = 5.0G' > /dev/null; then
    ccache -M 30G
  fi
  # Zero stats
  ccache -z
  # Add ccache to path
  echo "$PATH" | grep 'ccache' > /dev/null || export PATH="/usr/lib/ccache:$PATH"
)

# Clone from master so that build script is always up-to-date
[ ! -d online ] && git clone $GIT_MITIGATIONS --branch=master $ONLINE_SOURCE
cd online || exit 1
git config pull.ff only
git fetch origin
# be consistent if user switched branch
git pull origin "$(git branch | cut -d ' ' -f 2)"

cd docker/from-source || exit 1
mkdir -p builddir
cd builddir || exit 1
[ ! -d online ] && git clone $GIT_MITIGATIONS --branch="$FREEONLINEOFFICE_BRANCH" $ONLINE_SOURCE
[ ! -d core ] && git clone $GIT_MITIGATIONS --branch="$CORE_BRANCH" $CORE_SOURCE
cd core || exit 1
git config pull.ff only
git submodule init
git -c protocol.version=2 submodule update --depth=1
cd ../.. || exit 1

# Restore from caches
[ -d "$EXTERNAL_CACHES" ] && (
  rsync -a "${EXTERNAL_CACHES}/" builddir/core/external
)

./build.sh

# Copy to cache
mkdir -p "$EXTERNAL_CACHES"
rsync -a builddir/core/external/tarballs "$EXTERNAL_CACHES"
