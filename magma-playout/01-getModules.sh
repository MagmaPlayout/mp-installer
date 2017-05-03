#!/bin/bash -e

function writeMsg {
		echo ""
		echo $1
}

echo ""
echo " ------------------------------- "
echo "Magma Playout - Module downloader"
echo " ------------------------------- "

writeMsg "Creating dir structure..."
mkdir core
mkdir store
mkdir gui

writeMsg "Getting CORE modules..."
git clone https://github.com/MagmaPlayout/mpc-meltedBackend.git core/mpc-meltedBackend/

writeMsg "Getting CORE..."
git clone https://github.com/MagmaPlayout/mp-core.git core/mp-core/

writeMsg "Getting CORE Message Server..."
git clone https://github.com/MagmaPlayout/mp-core-api.git core/mp-core-api/

writeMsg "Getting Playout API Server..."
git clone https://github.com/MagmaPlayout/mp-playout-api.git store/mp-playout-api/

writeMsg "Getting Admin API Server..."
git clone https://github.com/MagmaPlayout/mp-admin-api.git store/mp-admin-api/

writeMsg "Getting MEDIA manager..."
git clone https://github.com/MagmaPlayout/mp-devourer.git store/mp-devourer/

writeMsg "Getting Frontend..."
git clone https://github.com/MagmaPlayout/mp-ui-playout.git gui/mp-ui-playout

writeMsg "Done."
