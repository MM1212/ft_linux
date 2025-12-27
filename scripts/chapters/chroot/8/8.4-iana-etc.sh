#!/bin/bash

set -e

cd /sources

tar -xvpf iana-etc-20250807.tar.gz

cd iana-etc-20250807

cp services protocols /etc

cd ..

rm -rf iana-etc-20250807
