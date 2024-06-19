#!/bin/bash

set -ouex pipefail

pass_url=$(wget -q -O- https://proton.me/download/PassDesktop/linux/x64/version.json | jq -r '.Releases | max_by(.ReleaseDate) | .File[] | select(.Identifier==".rpm (Fedora/RHEL)").Url')

# Download any packages that we can't get from any repos.
wget https://proton.me/download/mail/linux/ProtonMail-desktop-beta.rpm -O /tmp/ProtonMail-desktop-beta.rpm
wget $pass_url -O /tmp/ProtonPass.rpm

rpm-ostree install \
    firefox-langpacks \
    firefox \
    headsetcontrol \
    proton-vpn-gnome-desktop \
    papirus-icon-theme \
    /tmp/ProtonMail-desktop-beta.rpm \
    /tmp/ProtonPass.rpm
