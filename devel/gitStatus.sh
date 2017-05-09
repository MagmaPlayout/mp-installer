#!/bin/bash
function gitStatus {
	git -C $1 status
}

figlet "GIT STATUS"

echo ""
echo "Installer"
cd ../
git status


cd magma-playout/

echo ""
echo "MPC Melted Backend"
gitStatus core/mpc-meltedBackend

echo ""
echo "Core"
gitStatus core/mp-core

echo ""
echo "Core API"
gitStatus core/mp-core-api

echo ""
echo "UI"
gitStatus gui/mp-ui-playout

echo ""
echo "Admin API"
gitStatus store/mp-admin-api

echo ""
echo "Devourer"
gitStatus store/mp-devourer

echo ""
echo "Playout API"
gitStatus store/mp-playout-api

