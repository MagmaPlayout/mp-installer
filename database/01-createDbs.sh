#!/bin/bash

echo ""
echo "Creating mp_admin_schema..."
mysql -u root -p < mp_admin_schema.sql


echo ""
echo "Creating mp_playout_schema..."
mysql -u root -p < mp_playout_schema.sql

echo ""
echo "Inserting initial data..."
mysql -u root -p < initial_data.sql

# TODO: resolver
# echo ""
# echo "CARGANDO DATOS TEMPORALES..."
# mysql -u root -p < temp.sql


echo ""
echo "Done."
