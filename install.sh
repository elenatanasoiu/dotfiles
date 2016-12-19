#!/bin/sh

set -e

echo "Installing Vim packages..."
vim +PlugInstall +qa
