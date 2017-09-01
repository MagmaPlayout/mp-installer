#!/bin/bash -e
start=`date +%s`

echo "  ---------------------  "
echo " Magma Playout Installer "
echo "  ---------------------  "
echo ""


echo "Installing dependencies..."
cd dependencies
 ./10-debianPackages.sh
 ./20-buildSources.sh # calls 30-getRedis.sh and 40-melted.sh
cd -

echo "Creating DataBases..."
cd database
 ./01-createDbs.sh
cd -

echo ""
echo "Installing Magma Playout..."
cd magma-playout/
 ./01-getModules.sh || true
 ./02-initNodeModules.sh
 ./03-buildJavaModules.sh
cd -

cd ..
ln -s mp-installer/magma-playout/ MagmaPlayout || true


end=`date +%s`
runtime=$((end-start))
echo ""
echo "Done in $runtime seconds"


