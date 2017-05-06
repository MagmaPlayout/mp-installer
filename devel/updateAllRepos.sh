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



echo ""
echo "Updating Node projects dependencies..."
../magma-playout/02-initNodeModules.sh

echo ""
echo "Building java modules..."
../magma-playout/03-buildJavaModules.sh

echo ""
echo "Done."
