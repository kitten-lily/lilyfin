#!/usr/bin/bash

set -ouex pipefail

# Per-network MAC randomization
wget https://raw.githubusercontent.com/secureblue/secureblue/live/files/system/etc/NetworkManager/conf.d/rand_mac.conf -O /etc/NetworkManager/conf.d/rand_mac.conf

# Lock down firewall
wget https://raw.githubusercontent.com/secureblue/secureblue/live/files/system/etc/firewalld/zones/FedoraWorkstation.xml -O /etc/firewalld/zones/FedoraWorkstation.xml

# Configure chronyd to use Network Time Security (NTS)
wget https://raw.githubusercontent.com/secureblue/secureblue/live/files/system/etc/chrony.conf -O /etc/chrony.conf
wget https://raw.githubusercontent.com/secureblue/secureblue/live/files/system/etc/sysconfig/chronyd -O /etc/sysconfig/chronyd

# sudo timeout to 1min instead of 0min
wget https://raw.githubusercontent.com/secureblue/secureblue/live/files/system/etc/sudoers.d/timeout -O /etc/sudoers.d/timeout

# Disable passwordless sudo for rpm-ostree install
wget https://raw.githubusercontent.com/secureblue/secureblue/live/files/system/usr/share/polkit-1/rules.d/org.projectatomic.rpmostree1.rules -O /usr/share/polkit-1/rules.d/org.projectatomic.rpmostree1.rules
