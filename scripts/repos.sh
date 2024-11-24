#!/bin/bash

set -ouex pipefail

# Add Proton VPN repo
cat <<EOF > /etc/yum.repos.d/protonvpn-stable.repo
#
# ProtonVPN stable release
#
[protonvpn-fedora-stable]
name = ProtonVPN Fedora Stable repository
baseurl = https://repo.protonvpn.com/fedora-\$releasever-stable
enabled = 1
gpgcheck = 1
repo_gpgcheck=0
gpgkey = https://repo.protonvpn.com/fedora-\$releasever-stable/public_key.asc
EOF

# Add MoreWaita repo
curl --retry 3 -Lo /etc/yum.repos.d/morewaita.repo \
    https://copr.fedorainfracloud.org/coprs/dusansimic/themes/repo/fedora-"$(rpm -E %fedora)"/dusansimic-themes-fedora-"$(rpm -E %fedora)".repo
