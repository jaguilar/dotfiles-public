#!/bin/sh
set -eu

cd "$(dirname "$0")"

# Install chezmoi to its default location (./bin)
if command -v curl >/dev/null 2>&1; then
    sh -c "$(curl -fsLS https://get.chezmoi.io)"
elif command -v wget >/dev/null 2>&1; then
    sh -c "$(wget -qO- https://get.chezmoi.io)"
else
    echo "Error: curl or wget is required to install chezmoi." >&2
    exit 1
fi

# Manually execute chezmoi from its default install location
exec ./bin/chezmoi apply "$@"
