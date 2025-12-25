#!/bin/bash

if [ "$(id -u)" -e 0 ]; then
  echo "This script must be run as non-root user. Exiting."
  exit 1
fi

SCRIPTS=$(echo scripts/chapters/user/{4,5,6}/*.sh | tr ' ' '\n' | sort -V)

echo "Starting the build process ..."
for script in $SCRIPTS; do
  echo "Running $script ..."
  bash $script
  if [ $? -ne 0 ]; then
    echo "Error occurred while running $script. Exiting."
    exit 1
  fi
done