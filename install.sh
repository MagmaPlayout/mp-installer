#!/bin/bash -e
start=`date +%s`

echo "  ---------------------  "
echo " Magma Playout Installer "
echo "  ---------------------  "
echo ""

# Deny execution if the user is root
user=`id -u`
if [[ $user -eq 0 ]]; then
	echo "Don't run this script as root!!!";
	echo "Aborting, bye.";
	exit 1;
fi

echo "Installing dependencies..."
cd dependencies
 ./10-debianPackages.sh
 ./15-getJava.sh
 ./30-getRedis.sh
 ./40-melted.sh
 ./50-getNode.sh
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
 ./04-moduleConfigFiles.sh
cd -

cd ..
ln -s mp-installer/magma-playout/ MagmaPlayout || true


end=`date +%s`
runtime=$((end-start))
echo ""
echo "Magma Playout is installed"
echo "Done in $runtime seconds"


