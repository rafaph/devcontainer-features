#!/bin/bash

set -e

INSTALLED_VERSION=$(curl -s https://api.github.com/repos/pressly/goose/releases/latest | jq -r '.tag_name')

# shellcheck disable=SC1091
source dev-container-features-test-lib

check "installed" goose --version

check "version" bash -c "goose --version | grep 'goose version: $INSTALLED_VERSION'"

check "installPath" bash -c "which goose | grep '/tmp/bin/goose'"

reportResults
