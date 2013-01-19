#!/bin/sh
# This script should be run from FSP home.

sed -E -f Scripts/DevToProd/sedrules_qgsProdToDev.txt Maps/FSP_PG.qgs > Maps/FSP_PGLocal.qgs
