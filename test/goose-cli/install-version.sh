#!/bin/bash
set -e

INSTALLED_VERSION="v3.19.2"

# shellcheck disable=SC1091
source dev-container-features-test-lib

check "installed" goose --version

check "version" bash -c "goose --version | grep 'goose version: $INSTALLED_VERSION'"

check "installPath" bash -c "which goose | grep '/usr/local/bin/goose'"

reportResults
