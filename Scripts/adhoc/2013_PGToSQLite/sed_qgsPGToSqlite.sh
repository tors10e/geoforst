#!/bin/sh
# Creates the sqlite version from the multiuser edition map.
# This script should be run from FSP home.

sed -E -f Scripts/PGToSQLite/sedrules_PGToSqlite.txt Maps/GForst_ME.qgs > Maps/GForst_Lite.qgs
