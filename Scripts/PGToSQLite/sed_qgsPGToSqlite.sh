#!/bin/sh
# This script should be run from FSP home.

sed -E -f Scripts/PGToSQLite/sedrules_PGToSqlite.txt Maps/FSP_PG.qgs > Maps/GF_SQLITE.qgs
