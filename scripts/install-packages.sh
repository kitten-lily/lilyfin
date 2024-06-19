#!/bin/bash

set -ouex pipefail

# Download any packages that we can't get from any repos.
wget https://proton.me/download/mail/linux/ProtonMail-desktop-beta.rpm -O /tmp/ProtonMail-desktop-beta.rpm

rpm-ostree install \
    firefox-langpacks \
    firefox \
    headsetcontrol \
    proton-vpn-gnome-desktop \
    /tmp/ProtonMail-desktop-beta.rpm