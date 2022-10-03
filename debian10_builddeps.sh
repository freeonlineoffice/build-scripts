#!/bin/bash

# From https://wiki.documentfoundation.org/Development/BuildingOnline#Prerequisites_for_building_on_Debian_11_.28Bullseye.29
apt-get install -y git build-essential devscripts libkrb5-dev openssl g++ libssl-dev libcap-dev libtool m4 automake libcppunit-dev libcppunit-doc pkg-config python-polib python3-polib default-jre libpam-dev npm python-lxml python3-lxml translate-toolkit docker.io locales-all libpng16-16 fontconfig adduser cpio findutils nano libpoco-dev libcap2-bin openssl inotify-tools procps libubsan1
apt-get build-dep -y libreoffice
npm i npm@latest -g

# Our extras
apt install -qq -y rsync ccache
