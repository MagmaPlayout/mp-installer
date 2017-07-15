#!/bin/bash
function gitPush {
	git -C $1 push
}

figlet "GIT PUSH"

echo ""
echo "Installer"
cd ../
echo ""
echo "cd "$(pwd)
git push


cd magma-playout/

echo ""
echo "MP Libconfig"
echo "cd ../magma-playout/core/mp-libconfig"
echo ""
gitPush core/mp-libconfig

echo ""
echo "MPC Melted Backend"
echo "cd ../magma-playout/core/mpc-meltedBacked"
echo ""
gitPush core/mpc-meltedBackend

echo ""
echo "MP Melted Status Monitor"
echo "cd ../magma-playout/core/mp-melted-status"
echo ""
gitPush core/mp-melted-status

echo ""
echo "Core"
echo "cd ../magma-playout/core/mp-core"
echo ""
gitPush core/mp-core

echo ""
echo "Core API"
echo "cd ../magma-playout/core/mp-core-api"
echo ""
gitPush core/mp-core-api

echo ""
echo "UI"
echo "cd ../magma-playout/gui/mp-ui-playout"
echo ""
gitPush gui/mp-ui-playout

echo ""
echo "Admin API"
echo "cd store/mp-admin-api"
echo ""
gitPush ../magma-playout/store/mp-admin-api

echo ""
echo "Devourer"
echo "cd ../magma-playout/store/mp-devourer"
echo ""
gitPush store/mp-devourer

echo ""
echo "Playout API"
echo "cd ../magma-playout/store/mp-playout-api"
echo ""
gitPush store/mp-playout-api

