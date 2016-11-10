#!/bin/sh
# curl -sSL  https://raw.githubusercontent.com/iag-edge-labs/ci-scripts/master/version.sh | bash -s

# add version number to file
APP_VERSION=`git describe --tags`
touch build.txt
echo 'Release Tag: ' $APP_VERSION > build.txt
