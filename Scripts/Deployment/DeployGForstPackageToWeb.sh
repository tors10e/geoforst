#!/bin/sh

 # Create directory structure.
 mkdir -p ~/temp/GForst_Lite/Maps
 mkdir -p ~/temp/GForst_Lite/Data
 mkdir -p ~/temp/GForst_Lite/Forms

 mkdir -p ~/temp/GForst_ME/Maps
 mkdir -p ~/temp/GForst_ME/Forms
 
 echo "Copying files to temp directories..."
 # Copy files to new directories.
 cp -r  $GEOFORST_HOME/www/WebContent/ ~/temp/gf_deployment # Copy website to temp.
 cp $GEOFORST_HOME/Maps/GForst_Lite.qgs ~/temp/GForst_lite/Maps
 cp $GEOFORST_HOME/Data/FSP2.sqlite ~/temp/GForst_Lite/Data
 cp $GEOFORST_HOME/Forms/* ~/temp/GForst_lite/Forms
 
 cp $GEOFORST_HOME/Maps/GForst_ME.qgs ~/temp/GForst_ME/Maps
 cp $GEOFORST_HOME/Forms/* ~/temp/GForst_ME/Forms
 
 echo "Zipping the files..."
 # Create a zip package.
 rm ~/temp/gf_deployment/packages/0.1/* # Clean the directory first since things weren't getting overwritten.
 cd ~/temp # The path to the directory to be zipped must be relative to prevent zip from including the full path in the output.
  
 # Update date on web page.
 currDate=$(date +"%m-%d-%Y")
 sed -i '' 's/\[DATE\]/'$currDate/g  ~/temp/gf_deployment/index.html
 
 zip -ru ~/temp/gf_deployment/packages/0.1/GForst_Lite_v0.1.zip  ./GForst_Lite/ 
 zip -ru ~/temp/gf_deployment/packages/0.1/GForst_ME_v0.1.zip ./GForst_ME/ 
 
 # Copy geoforst web site to torstenernst.com/geoforst.
echo "Copying from $GEOFORST_HOME/www/WebContent to torstenernst.com/geoforst..."
scp -r ~/temp/gf_deployment/* ternst@vector.xyxx.com:/home/ternst/www/torstenernst/geoforst
echo "Copying complete."
 
 echo "Cleaning up temp files..."
 rm -r ~/temp/GForst_lite
 rm -r ~/temp/GForst_ME
 rm -r ~/temp/gf_deployment
  
 echo "Packaging and deploying complete."
 