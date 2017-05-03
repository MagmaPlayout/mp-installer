#!/bin/bash -e

echo "  ---------------------  "
echo " Magma Playout Installer "
echo "  ---------------------  "
echo ""


echo "Installing dependencies..."
cd dependencies
./01-debianPackages.sh
cd -



echo ""
echo "Installing Magma Playout..."
cd magma-playout/
./01-getModules.sh
./02-initNodeModules.sh
./03-buildJavaModules.sh
cd -

echo ""
echo "Done."

