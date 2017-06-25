#!/bin/bash

function updateDir {
	git -C $1 pull
}



figlet "GIT PULLING"

echo ""
echo "Installer"
cd ../
git pull


cd magma-playout/

echo ""
echo "MPC Melted Backend"
updateDir core/mpc-meltedBackend

echo ""
echo "MP Melted Status"
updateDir core/mp-melted-status

echo ""
echo "Core"
updateDir core/mp-core

echo ""
echo "Core API"
updateDir core/mp-core-api

echo ""
echo "UI"
updateDir gui/mp-ui-playout

echo ""
echo "Admin API"
updateDir store/mp-admin-api

echo ""
echo "Devourer"
updateDir store/mp-devourer

echo ""
echo "Playout API"
updateDir store/mp-playout-api


# Check if any of the package.json files have changed before trying to run the initNodeModules.sh
function checkUpdate {
    find $1 -mmin -2 -type f -print | grep package.json
}

ca=$(checkUpdate core/mp-core-api)
ap=$(checkUpdate store/mp-admin-api/ )
pa=$(checkUpdate store/mp-playout-api/)
up=$(checkUpdate gui/mp-ui-playout/)

echo ""
if [ -n "$ca" ] || [ -n "$ap" ] || [ -n "$pa" ] || [ -n "$up" ]; then
    echo "Updating Node projects dependencies..."
    ../magma-playout/02-initNodeModules.sh
else
    echo "No need to run initNodeModules..."
fi


echo ""
echo "Building java modules..."
../magma-playout/03-buildJavaModules.sh
if [ $? -ne 0 ]; then
	echo "Building java modules ended with error!!!"
	exit 1
fi

echo ""
echo "UpdateAllRepos Done."
