#!/bin/sh

set -e

echo "Activating feature 'goose-cli'"

if ! command -v curl >/dev/null 2>&1; then
    echo "curl is not installed, please use a base image with curl installed."
    exit 1
fi

if ! command -v jq >/dev/null 2>&1; then
    echo "jq is not installed, please use a base image with jq installed."
    exit 1
fi

GOOSE_VERSION="${VERSION:-"latest"}"
INSTALL_PATH="${INSTALLPATH:-"/usr/local"}"

if [ "$GOOSE_VERSION" = "latest" ]; then
    GOOSE_VERSION=$(curl -s https://api.github.com/repos/pressly/goose/releases/latest | jq -r '.tag_name')
fi

echo "Installing goose $GOOSE_VERSION"

curl -fsSL https://raw.githubusercontent.com/pressly/goose/master/install.sh | GOOSE_INSTALL=$INSTALL_PATH sh -s "$GOOSE_VERSION"
