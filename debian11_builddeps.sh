#!/bin/bash

apt-get install -y git build-essential devscripts libkrb5-dev openssl g++ libssl-dev libcap-dev libtool m4 automake \
                   libcppunit-dev libcppunit-doc pkg-config python3-polib python3-polib default-jre libpam-dev npm \
                   python3-lxml translate-toolkit docker.io locales-all libpng16-16 fontconfig adduser cpio findutils \
                   nano libpoco-dev libcap2-bin openssl inotify-tools procps libubsan1 nasm libgif-dev

apt-get build-dep -y libreoffice
npm i npm@latest -g

# Our extras
apt install -qq -y rsync ccache


