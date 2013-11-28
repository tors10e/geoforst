#!/bin/sh

# Copy geoforst web site to torstenernst.com/geoforst.
echo "Copying from $GEOFORST_HOME/www/WebContent to torstenernst.com/geoforst."
scp -r $GEOFORST_HOME/www/WebContent/* ternst@vector.xyxx.com:/home/ternst/www/torstenernst/geoforst
echo "Copying complete...."