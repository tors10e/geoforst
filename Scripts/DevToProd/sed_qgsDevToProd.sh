#!/bin/sh
# Converts the development multiuser edition map to generate the production mulituser map.
# This script should be run from FSP home.

sed -E -f $GEOFORST_HOME/Scripts/DevToProd/sedrules_qgsDevToProd.txt $GEOFORST_HOME/Maps/GForst_ME_Dev.qgs > $GEOFORST_HOME/Maps/GForst_ME.qgs
