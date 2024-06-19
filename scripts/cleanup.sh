#!/bin/bash

set -ouex pipefail

rm /etc/yum.repos.d/protonvpn-stable.repo -f
rm /etc/yum.repos.d/_copr_ryanabx-cosmic.repo -f