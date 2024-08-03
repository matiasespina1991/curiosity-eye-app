#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./rename-simports.sh new_package_name"
  exit 1
fi

NEW_PACKAGE_NAME=$1

grep -rl 'package:template_app' ./lib | while read -r file; do
  sed -i '' "s/package:template_app/package:${NEW_PACKAGE_NAME}/g" "$file"
done

echo "All occurrences of 'package:template_app' in /lib have been replaced with 'package:${NEW_PACKAGE_NAME}'."
