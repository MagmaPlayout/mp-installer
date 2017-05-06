#!/bin/bash -e

echo ""
echo "Building mpc-meltedBackend..."
cd core/mpc-meltedBackend/
ant jar
cd -


echo ""
echo "Building mp-core..."
cd core/mp-core/
ant jar
cd -


echo ""
echo "Building mp-devourer..."
cd core/mp-devourer/
ant jar
cd -


echo ""
echo "Done."
