#!/bin/bash

DB_NAME="experimentserver"
DB_PASS="root"

OUT_FILE_NAME="experimentserverbackup"
VERSION="V0.1"
OUT_FILE="$OUT_FILE_NAME-$VERSION.tar"


# take the dump
mysqldump -u root -p$DB_PASS $DB_NAME > $DB_NAME.sql
if [ $? -ne 0 ]; then
  echo "Error: Something went wrong while taking db dump."
  echo "Aborting backup."
  exit 1;
fi


tar -cvf $OUT_FILE $DB_NAME.sql

echo "Backup successful."
exit 0;
