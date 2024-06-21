#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


# Add COSMIC COPR repo
wget "https://copr.fedorainfracloud.org/coprs/ryanabx/cosmic-epoch/repo/fedora-40/ryanabx-cosmic-epoch-fedora-$RELEASE.repo" -O /etc/yum.repos.d/_copr_ryanabx-cosmic.repo

rpm-ostree install cosmic-desktop