#!/bin/sh

 # Create directory structure.
 mkdir -p ~/temp/GForst_Lite/Maps
 mkdir -p ~/temp/GForst_Lite/Data
  
 # Copy files to new directories.
 cp ../../Maps/GForst_Lite.qgs ~/temp/GForst_lite/Maps/
 cp ../../Data/FSP2.sqlite ~/temp/GForst_Lite/Data
 
 # Confirm that there are no errors with the map and data source.
 open ~/temp/GForst_Lite/Maps/GForst_Lite.qgs   
 
 # Create a zip package.
 zip -r ~/temp/GForst_Lite.zip ~/temp/GForst_Lite/ 