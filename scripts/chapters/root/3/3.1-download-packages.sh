#!/bin/bash

set -e

# This script downloads necessary packages for the linux installation.

# Available environment variables inside host-environment.sh:
# SOURCES_DIR - The directory to store downloaded sources (e.g., /mnt/lfs/sources)
# HOST_SOURCES_LIST - The file containing the list of packages to download

mkdir -pv $SOURCES_DIR
chmod -v a+wt $SOURCES_DIR

pushd $(dirname $HOST_SOURCES_LIST)
  HOST_SOURCES_FILE_NAME=$(basename $HOST_SOURCES_LIST)
  wget --input-file=$HOST_SOURCES_FILE_NAME --directory-prefix=$SOURCES_DIR --continue --timestamping
  cp $HOST_SOURCES_MD5 $SOURCES_DIR
popd

pushd $SOURCES_DIR
  md5sum --check $HOST_SOURCES_MD5
popd

chown -R root:root $SOURCES_DIR

echo "Packages have been downloaded successfully."