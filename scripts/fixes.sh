#!/bin/bash

set -ouex pipefail

# Run vscode under wayland
sed -i 's/--new/--ozone-platform-hint=auto --new/' /usr/share/applications/code.desktop