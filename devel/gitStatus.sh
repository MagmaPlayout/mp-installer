#!/bin/bash
function gitStatus {
	git -C $1 status
}

figlet "GIT STATUS"

echo ""
echo "Installer"
cd ../
echo ""
echo "cd "$(pwd)
git status


cd magma-playout/

echo ""
echo "MP Libconfig"
echo "cd ../magma-playout/core/mp-libconfig"
echo ""
gitStatus core/mp-libconfig

echo ""
echo "MPC Melted Backend"
echo "cd ../magma-playout/core/mpc-meltedBacked"
echo ""
gitStatus core/mpc-meltedBackend

echo ""
echo "MP Melted Status Monitor"
echo "cd ../magma-playout/core/mp-melted-status"
echo ""
gitStatus core/mp-melted-status

echo ""
echo "Core"
echo "cd ../magma-playout/core/mp-core"
echo ""
gitStatus core/mp-core

echo ""
echo "Core API"
echo "cd ../magma-playout/core/mp-core-api"
echo ""
gitStatus core/mp-core-api

echo ""
echo "UI"
echo "cd ../magma-playout/gui/mp-ui-playout"
echo ""
gitStatus gui/mp-ui-playout

echo ""
echo "Admin API"
echo "cd store/mp-admin-api"
echo ""
gitStatus ../magma-playout/store/mp-admin-api

echo ""
echo "Devourer"
echo "cd ../magma-playout/store/mp-devourer"
echo ""
gitStatus store/mp-devourer

echo ""
echo "Playout API"
echo "cd ../magma-playout/store/mp-playout-api"
echo ""
gitStatus store/mp-playout-api

