#!/bin/sh

PACKAGE_VERSION=0.1
SOURCE_DIR=~/downloads/fsp
STAGING_DIR=~/temp
WEB_DIR=/var/www/

# Get latest source code.
echo "Deleting " $SOURCE_DIR
rm -rf $SOURCE_DIR
echo "Deleting " $STAGING_DIR
rm -rf $STAGING_DIR/*
echo "Cloning geoforst"
hg clone -r tip https://torstenernst@bitbucket.org/torstenernst/fsp $SOURCE_DIR

# Create directory structure.

mkdir -p $STAGING_DIR/GForst_Lite/Maps
mkdir -p $STAGING_DIR/GForst_Lite/Data
mkdir -p $STAGING_DIR/GForst_Lite/Forms
mkdir -p $STAGING_DIR/GForst_Lite/Symbology
  
mkdir $STAGING_DIR/gf_deployment 

echo "Copying files to temp directories..." 
# Copy files to new directories.
cp -rf $SOURCE_DIR/Maps/GForst_Lite.qgs $STAGING_DIR/GForst_Lite/Maps
cp -rf $SOURCE_DIR/Data/geoforst.sqlite $STAGING_DIR/GForst_Lite/Data
cp -rf $SOURCE_DIR/Forms/* $STAGING_DIR/GForst_Lite/Forms
cp -rf $SOURCE_DIR/Symbology/* $STAGING_DIR/GForst_Lite/Symbology

 echo "Zipping the files..."
# Create a zip package.
mkdir -p $STAGING_DIR/gf_deployment/packages/$PACKAGE_VERSION
cd $STAGING_DIR # The path to the directory to be zipped must be relative to prevent zip from including the full path in the output.
zip -ru $STAGING_DIR/gf_deployment/packages/$PACKAGE_VERSION/GForst_Lite_v$PACKAGE_VERSION.zip  ./GForst_Lite/ 
  
# Update date on web page.
CURR_DATE=$(date +"%m-%d-%Y")
sed -i 's/\[DATE\]/'$CURR_DATE/g  $STAGING_DIR/gf_deployment/index.html
 
# Copy files to web directory.
rm -rf $WEB_DIR/geoweb
cp -rf $STAGING_DIR/gf_deployment/* $WEB_DIR

echo "Deploying Django"
cp -fr $SOURCE_DIR/geoweb/ $WEB_DIR
python $WEB_DIR/geoweb/manage.py collectstatic
rm -f $WEB_DIR/geoweb/geoweb/settings.py
cp $WEB_DIR/geoweb/geoweb/settings_prod.py $WEB_DIR/geoweb/geoweb/settings.py 
sudo service apache2 stop
sudo service apache2 start
 
