#!/bin/bash -e

echo "Installing Debian packages..."
echo ""

sudo apt-get -y install figlet ant git wget mariadb-server gnome-terminal \ 
automake autoconf libtool intltool  \
yasm swig libmp3lame-dev libgavl-dev \
clang gcc g++ python2.7 \ # for node
libsamplerate-dev libxml2-dev ladspa-sdk libjack-dev libsox-dev libsdl-dev \ 
libgtk2.0-dev liboil-dev libsoup2.4-dev libqt4-dev libexif-dev libtheora-dev \
libvdpau-dev libvorbis-dev python-dev

sudo dpkg -i debs/* 

