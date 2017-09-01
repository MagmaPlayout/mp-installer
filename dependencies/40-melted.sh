#!/bin/bash -e

echo "Building melted..."
cd sources/melted
 ./build-melted.sh

# Creates a symlink to the melted's installation folder
installationPath=../../../magma-playout/core/melted
cd $installationPath
 today=$(date +%Y%m%d) # Melted's output folder is called like this
 output=installation

 ln -s $today $output
 mkdir $output/etc
cd -

# copy start/stop scripts to destination
cp start-melted-server $installationPath/$output/
cp stop-melted-server $installationPath/$output/

# copy magma playout's melted config to destination
cp melted.conf $installationPath/$output/etc

echo "Done building melted."
