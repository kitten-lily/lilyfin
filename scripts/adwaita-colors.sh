#!/usr/bin/env bash

set -ouex pipefail

git clone https://github.com/dpejoh/Adwaita-colors /tmp/Adwaita-colors
cp -r /tmp/Adwaita-colors/Adwaita-* /usr/share/icons
. /tmp/Adwaita-colors/MoreWaita.sh
