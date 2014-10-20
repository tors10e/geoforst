#!/bin/sh
PACKAGE_VERSION="0.1"
SOURCE_DIR="/home/ubuntu/downloads/fsp"
STAGING_DIR="/home/ubuntu/temp"
WEB_DIR="/var/www"
 
cd /home/ubuntu/downloads/
sudo rm -rf /home/ubuntu/downloads/fsp
hg clone https://torstenernst@bitbucket.org/torstenernst/fsp


 # Create directory structure.
 sudo mkdir -p $STAGING_DIR/GForst_Lite/Maps
 sudo mkdir -p $STAGING_DIR/GForst_Lite/Data
 sudo mkdir -p $STAGING_DIR/GForst_Lite/Forms
 sudo mkdir -p $STAGING_DIR/GForst_Lite/Symbology
 
 sudo mkdir -p $STAGING_DIR/GForst_ME/Maps
 sudo mkdir -p $STAGING_DIR/GForst_ME/Forms
 sudo mkdir -p $STAGING_DIR/GForst_ME/Symbology
 
 sudo mkdir $STAGING_DIR/gf_deployment 

 echo "Copying files to temp directories..."
 # Copy files to new directories.
 sudo cp -r  $SOURCE_DIR/www/WebContent/* $STAGING_DIR/gf_deployment 
 
 sudo cp $SOURCE_DIR/Maps/GForst_Lite.qgs $STAGING_DIR/GForst_Lite/Maps
 sudo cp $SOURCE_DIR/Data/geoforst.sqlite $STAGING_DIR/GForst_Lite/Data
 sudo cp $SOURCE_DIR/Forms/* $STAGING_DIR/GForst_Lite/Forms
 sudo cp $SOURCE_DIR/Forms/* $STAGING_DIR/GForst_Lite/Symbology
  
sudo cp $SOURCE_DIR/Maps/GForst_ME.qgs $STAGING_DIR/GForst_ME/Maps
sudo cp $SOURCE_DIR/Forms/* $STAGING_DIR/GForst_ME/Forms
sudo cp $SOURCE_DIR/Forms/* $STAGING_DIR/GForst_ME/Symbols
 
  echo "Zipping the files..."
 # Create a zip package.
 sudo rm $STAGING_DIR/gf_deployment/packages/$PACKAGE_VERSION/* # Clean the directory first since things weren't getting overwritten.
 sudo mkdir -p $STAGING_DIR/gf_deployment/packages/$PACKAGE_VERSION
 cd $STAGING_DIR # The path to the directory to be zipped must be relative to prevent zip from including the full path in the output.
 
 sudo zip -ru $STAGING_DIR/gf_deployment/packages/$PACKAGE_VERSION/GForst_Lite_v$PACKAGE_VERSION.zip  ./GForst_Lite/ 
 sudo zip -ru $STAGING_DIR/gf_deployment/packages/$PACKAGE_VERSION/GForst_ME_v$PACKAGE_VERSION.zip ./GForst_ME/ 
 

 # Update date on web page.
 CURR_DATE=$(date +"%m-%d-%Y")
 sudo sed -i 's/\[DATE\]/'$CURR_DATE/g  $STAGING_DIR/gf_deployment/index.html
 
 # Copy files to web directory.
sudo cp -rf $STAGING_DIR/gf_deployment/* $WEB_DIR
 
 echo "Packaging and deploying complete."
 