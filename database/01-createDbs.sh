#!/bin/bash

echo ""
echo "Creating mp_admin_schema..."
mysql -u root -p < mp_admin_schema.sql


echo ""
echo "Creating mp_playout_schema..."
mysql -u root -p < mp_playout_schema.sql

echo ""
echo "Done."
