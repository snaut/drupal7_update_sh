#! /bin/bash

source config.sh

today=`date +%Y-%m-%d`

backup_file=$db_backup_prefix$today

cd ~postgres
su postgres -c "pg_dump drupal" > $backup_file
cd

echo "Backup of drupal db is at $backup_file"

