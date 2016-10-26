#!/bin/sh
# curl -sSL https://raw.githubusercontent.com/codeship/scripts/master/packages/firefox.sh | bash -s

# run ghost inspector e2e tests

GHOSTINSPECTOR_KEY=${GHOSTINSPECTOR_KEY:=""}
GHOSTINSPECTOR_SUITE_ID=${GHOSTINSPECTOR_SUITE_ID:=""}

set -e

if [ $GHOSTINSPECTOR_KEY = "" ]; then
    echo 'Missing GHOSTINSPECTOR_KEY variable. Add it to the environment variables setting.';
    exit 1;
fi
if [ $GHOSTINSPECTOR_SUITE_ID = "" ]; then
    echo 'Missing GHOSTINSPECTOR_SUITE_ID suite variable. Add it to the environment variables setting.';
    exit 1;
fi

curl "https://api.ghostinspector.com/v1/suites/${GHOSTINSPECTOR_SUITE_ID}/execute/?apiKey=${GHOSTINSPECTOR_KEY}" > ghostinspector.json

# Conditional check if tests fail
if [ $(grep -c '"passing":false' ghostinspector.json) -ne 0 ]; then
    echo 'Ghost Inspector tests failed.'
    exit 1;
fi
