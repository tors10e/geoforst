#!/bin/sh
# Creates development version of multiuser edition from production map.
# This script should be run from FSP home.


sed -E -f Scripts/DevToProd/sedrules_qgsProdToDev.txt Maps/GForst_ME.qgis > Maps/FSP_PGLocal.qgs
