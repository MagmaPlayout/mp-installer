#!/bin/bash -e

echo "Getting Node..."
wget -c https://github.com/nodejs/node/archive/v6.11.2.tar.gz
tar -xf v6.11.2.tar.gz
cd node-6.11.2
 ./configure
 make -j4
 sudo make install


