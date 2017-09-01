#!/bin/bash -e

echo "Getting Redis..."

DEST=../magma-playout/core/
mkdir -p $DEST
cd $DEST
 git clone https://github.com/MagmaPlayout/redis.git

 echo "Building Redis..."
 cd redis
  make
 cd ..
 echo "Done building Redis!!!"
