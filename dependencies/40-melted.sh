#!/bin/bash -e

echo "Building melted..."
cd sources/melted
./build-melted.sh

installationPath=../../../magma-playout/core/melted
today=$(date +%Y%m%d) # Melted's output folder is called like this
output=installation

# Creates a symlink to the melted's installation folder
cd $installationPath
ln -s $today $output
mkdir $output/etc
ymlPath=$(pwd)/$output/etc
cd -

# copy start/stop scripts to destination
cp start-melted-server $installationPath/$output/
cp stop-melted-server $installationPath/$output/

# copy magma playout's melted config to destination
cp melted.conf $installationPath/$output/etc
cp multi-decklink-udp.yml $installationPath/$output/etc

echo "uadd multi:$ymlPath/multi-decklink-udp.yml" >> $installationPath/$output/etc/melted.conf

echo "Done building melted."
