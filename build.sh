#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

. /tmp/repos.sh
. /tmp/1password.sh
. /tmp/warp.sh
. /tmp/install-packages.sh
. /tmp/install-fonts.sh
. /tmp/secureblue-features.sh
. /tmp/cleanup.sh
