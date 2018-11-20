#!/bin/sh

# See https://github.com/travis-ci/travis-ci/issues/1066
# Fail if one of the commands of this script fails
set -e

gem install bundle
pip install -r requirements.txt

set +e
