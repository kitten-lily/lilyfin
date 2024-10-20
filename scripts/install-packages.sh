#!/bin/bash

set -ouex pipefail

pass_url=$(wget -q -O- https://proton.me/download/PassDesktop/linux/x64/version.json | jq -r '.Releases | max_by(.ReleaseDate) | .File[] | select(.Identifier==".rpm (Fedora/RHEL)").Url')

# Install latest rclone to get Proton support
rpm-ostree override replace https://downloads.rclone.org/rclone-current-linux-amd64.rpm

# Download any packages that we can't get from any repos.
wget https://proton.me/download/mail/linux/ProtonMail-desktop-beta.rpm -O /tmp/ProtonMail-desktop-beta.rpm
wget $pass_url -O /tmp/ProtonPass.rpm

rpm-ostree install \
    headsetcontrol \
    papirus-icon-theme \
    /tmp/ProtonMail-desktop-beta.rpm \
    /tmp/ProtonPass.rpm

if [ "$RELEASE" -le "40" ]; then
    rpm-ostree install proton-vpn-gnome-desktop
fi
