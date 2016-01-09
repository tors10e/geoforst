#!/bin/sh
# Creates development version of multiuser edition from production map.
# This script should be run from FSP home.


sed -E -f $GEOFORST_HOME/Scripts/DevToProd/sedrules_qgsProdToDev.txt $GEOFORST_HOME/Maps/GForst_ME.qgs > $GEOFORST_HOME/Maps/GForst_ME_Dev.qgs
