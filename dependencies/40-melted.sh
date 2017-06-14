#!/bin/bash -e

echo "Building melted..."
cd sources/melted
./build-melted.sh

installationPath=../../../magma-playout/core/melted/
today=$(date +%Y%m%d)
output=output
mv $installationPath$today $installationPath$output
echo "Done building melted."
