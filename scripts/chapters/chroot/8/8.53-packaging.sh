#!/bin/bash
set -e

cd /sources

tar -xvpf packaging-25.0.tar.gz
cd packaging-25.0

pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD

pip3 install --no-index --find-links dist packaging

cd /sources
rm -rf packaging-25.0
