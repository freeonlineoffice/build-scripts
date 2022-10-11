#!/bin/bash

# Install node from nodesource since newer versions give error
[ ! -f /etc/apt/sources.list.d/nodesource.list ] && (
  curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
  apt-get install -y nodejs
)

# From https://wiki.documentfoundation.org/Development/BuildingOnline#Prerequisites_for_building_on_Debian_11_.28Bullseye.29
apt-get install -y git build-essential devscripts libkrb5-dev openssl g++ libssl-dev libcap-dev libtool m4 automake \
                   libcppunit-dev libcppunit-doc pkg-config python-polib python3-polib default-jre libpam-dev \
                   python-lxml python3-lxml translate-toolkit docker.io locales-all libpng16-16 fontconfig adduser \
                   cpio findutils nano libpoco-dev libcap2-bin openssl inotify-tools procps libubsan1 nasm libgif-dev
apt-get build-dep -y libreoffice

# Our extras
apt install -qq -y rsync ccache
