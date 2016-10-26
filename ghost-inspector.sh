#!/bin/sh
# curl -sSL https://raw.githubusercontent.com/codeship/scripts/master/packages/firefox.sh | bash -s
set -e
if [ $(grep -c '"passing":false' ghostinspector.json) -ne 0 ];
    then exit 1;
fi
