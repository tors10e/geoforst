#!/bin/sh
# This script should be run from FSP home.

sed -E -f Scripts/DevToProd/sedrules_qgsDevToProd.txt Maps/FSP_PGLocal.qgs > Maps/FSP_PG.qgs
