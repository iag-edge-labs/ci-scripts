#!/bin/sh
# curl -sSL  https://raw.githubusercontent.com/iag-edge-labs/ci-scripts/master/version.sh | bash -s

# add version number to file
APP_VERSION=`git describe --always`
touch build.txt
echo APP_VERSION > build.txt
