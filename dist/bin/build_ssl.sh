#!/bin/bash

cores=${1:-1}

echo "Using '$cores' cores for compiliation of openssl."

cd vendor/openssl

./config
sudo make -j ${1}
#sudo make install
