#!/bin/sh

#!/bin/sh

 # Create directory structure.
 mkdir -p ~/temp/GForst_Lite/Maps
 mkdir -p ~/temp/GForst_Lite/Data
 mkdir -p ~/temp/GForst_Lite/Forms

 mkdir -p ~/temp/GForst_ME/Maps
 mkdir -p ~/temp/GForst_ME/Forms
 
 echo "Copying files to temp directories..."
 # Copy files to new directories.
 cp $GEOFORST_HOME/Maps/GForst_Lite.qgs ~/temp/GForst_lite/Maps
 cp $GEOFORST_HOME/Data/FSP2.sqlite ~/temp/GForst_Lite/Data
 cp $GEOFORST_HOME/Forms/* ~/temp/GForst_lite/Forms
 
 cp $GEOFORST_HOME/Maps/GForst_ME.qgs ~/temp/GForst_ME/Maps
 cp $GEOFORST_HOME/Forms/* ~/temp/GForst_ME/Forms
 
 echo "Zipping the files..."
 # Create a zip package.
 rm $GEOFORST_HOME/www/WebContent/packages/0.1/* # Clean the directory first since things weren't getting overwritten.
 cd ~/temp # The path to the directory to be zipped must be relative to prevent zip from including the full path in the output.
 zip -ru $GEOFORST_HOME/www/WebContent/packages/0.1/GForst_Lite_v0.1.zip  ./GForst_Lite/ 
 zip -ru $GEOFORST_HOME/www/WebContent/packages/0.1/GForst_ME_v0.1.zip ./GForst_ME/ 
 
 # Copy geoforst web site to torstenernst.com/geoforst.
echo "Copying from $GEOFORST_HOME/www/WebContent to torstenernst.com/geoforst..."
scp -r $GEOFORST_HOME/www/WebContent/* ternst@vector.xyxx.com:/home/ternst/www/torstenernst/geoforst
echo "Copying complete."
 
 echo "Cleaning up temp files..."
 rm -r ~/temp/GForst_lite/*
 rm -r ~/temp/GForst_ME/*
 
 echo "Packaging and deploying complete."
 