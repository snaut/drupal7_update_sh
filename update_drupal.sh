#!/bin/bash

source config.sh

echo "Backing up db"
./backup_db.sh
echo "Backing up drupal installation"
./backup_drupal.sh

tarball=$1
directory=`echo $tarball | sed -e 's/\.tar\.gz$//g'`

echo "extracting tarball"
tar -xzvf $1

echo "setting permissions, deleting customised files"
chown -R www-data:www-data $1
rm $directory/.htaccess
rm $directory/robots.txt
rm -r $directory/sites

echo "replacing old install with new files"
rsync -a -I $directory/ $drupal_install_dir

