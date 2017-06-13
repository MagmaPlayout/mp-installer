#!/bin/bash -e

echo "Building from sources..."
echo ""
cd sources

echo "Building nasm..."
tar -xf nasm-2.13.01.tar.gz
cd nasm-2.13.01
./configure
make
sudo make install
cd ..
rm -rf nasm-2.13.01
echo "Done building nasm..."

cd ..
./30-stream-m.sh
