#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root. Exiting."
  exit 1
fi

SCRIPTS=$(echo scripts/chapters/root/{2,3,4}/*.sh | tr ' ' '\n' | sort -V)

echo "Starting the build process ..."
for script in $SCRIPTS; do
  echo "Running $script ..."
  bash $script
  if [ $? -ne 0 ]; then
    echo "Error occurred while running $script. Exiting."
    exit 1
  fi
done
echo "Build process completed for root scripts."