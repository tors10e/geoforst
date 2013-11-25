#!/bin/sh
# Converts the development multiuser edition map to generate the production mulituser map.
# This script should be run from FSP home.

sed -E -f Scripts/DevToProd/sedrules_qgsDevToProd.txt Maps/GForst_ME_Dev.qgs > Maps/GForst_ME.qgs
