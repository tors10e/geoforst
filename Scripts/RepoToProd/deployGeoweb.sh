#! /bin/bash

cd ~/Downloads/
sudo rm -rf ~/Downloads/fsp
hg clone https://torstenernst@bitbucket.org/torstenernst/fsp
sudo rm -fr /var/www/geoweb
sudo cp -fr fsp/geoweb/ /var/www/geoweb
sudo python fsp/geoweb/manage.py collectstatic
sudo rm -f /var/www/geoweb/geoweb/settings.py
sudo cp /var/www/geoweb/geoweb/settings_prod.py /var/www/geoweb/geoweb/settings.py 
sudo service apache2 stop
sudo service apache2 start