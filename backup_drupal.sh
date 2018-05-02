#!/bin/bash

source config.sh

tar -zcvf $file_backup_prefix`date +%Y-%m-%d`.tar.gz $drupal_install_dir

