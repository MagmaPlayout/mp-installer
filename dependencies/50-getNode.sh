#!/bin/bash -e

echo "Getting Node..."
wget -c https://github.com/nodejs/node/archive/v6.11.2.tar.gz
tar -xf v6.11.2.tar.gz
cd node-6.11.2
 ./configure
 echo "Building Node..."
 make -j4
 sudo make install

echo "Installing Angular..."
sudo npm install -g @angular/cli
