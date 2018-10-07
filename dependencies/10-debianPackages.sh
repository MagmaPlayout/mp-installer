#!/bin/bash -e

echo "Installing Debian packages..."
echo ""

echo "Installing deps..."
sudo apt-get -y --force-yes install figlet ant git wget mariadb-server gnome-terminal build-essential checkinstall automake autoconf libtool intltool yasm swig libmp3lame-dev libgavl-dev clang gcc g++ python2.7 libsamplerate-dev libxml2-dev ladspa-sdk libjack-dev libsox-dev libsdl-dev libgtk2.0-dev libsoup2.4-dev libqt4-dev libexif-dev libtheora-dev libvdpau-dev libvorbis-dev python-dev tmux  libpango1.0-0 libpangox-1.0-0


#cd debs
#echo "Installing local debs 1..."
#ls -1 | grep -v "libgstreamer-plugins-base0.10-0_0.10.36-2_amd64.deb\|libswfdec-0.7-1_0.7.4-1build1_amd64.deb\|libswfdec-0.7-1-dbg_0.7.4-1build1_amd64.deb"| xargs -i sudo dpkg -i {}

#echo "Installing local debs 2..."
#ls -1 | grep "libswfdec-0.7-1_0.7.4-1build1_amd64.deb\|libswfdec-0.7-1-dbg_0.7.4-1build1_amd64.deb\|libgstreamer-plugins-base0.10-0_0.10.36-2_amd64.deb"| xargs -i sudo dpkg -i {}

sudo dpkg -i debs/*

### sudo kill -9 4048
