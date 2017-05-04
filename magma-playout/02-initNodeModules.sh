#!/bin/bash -e

echo ""
echo "Installing NODEJS packages ..."

cd core/mp-core-api/ && npm install && cd -
cd store/mp-admin-api/ && npm install && cd -
cd store/mp-playout-api/ && npm install && cd -
cd gui/mp-ui-playout/ && npm install && cd -

echo "Done."
