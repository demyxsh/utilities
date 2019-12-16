#!/bin/bash
# Demyx
# https://demyx.sh
set -euo pipefail

DEMYX_CHROOT_PATH=/usr/local/bin/demyx

# Remove demyx script if it exists
[[ -f "$DEMYX_CHROOT_PATH" ]] && rm -f "$DEMYX_CHROOT_PATH"

# Download fresh copy
curl -s https://raw.githubusercontent.com/demyxco/demyx/master/chroot.sh -o "$DEMYX_CHROOT_PATH"

# Make it executable
chmod +x "$DEMYX_CHROOT_PATH"
