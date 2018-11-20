#!/bin/sh

# See https://github.com/travis-ci/travis-ci/issues/1066
# Fail if one of the commands of this script fails
set -e

ansible-lint .
yamllint -d "{extends: default, rules: {line-length: {level: warning}}}" .

# Uncomment the --concurrency flag to run multiple tests in parallel using the
# Test-Kitchen parallelization feature.
# Uncomment the ${kitchen_instance} variable to run multiple tests in parallelization
# using the Travis-CI Build Matrix feature.
# FOR DETAILS SEE README!
kitchen test #--concurrency #${kitchen_instance}

set +e
