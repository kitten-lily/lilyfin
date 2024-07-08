#!/usr/bin/env bash

set -ouex pipefail

echo "Installing Warp"

# On libostree systems, /opt is a symlink to /var/opt,
# which actually only exists on the live system. /var is
# a separate mutable, stateful FS that's overlaid onto
# the ostree rootfs. Therefore we need to install it into
# /usr/lib/1Password instead, and dynamically create a
# symbolic link /opt/1Password => /usr/lib/1Password upon
# boot.

# Prepare staging directory
mkdir -p /var/opt

wget https://app.warp.dev/download?package=rpm -O /tmp/warp.rpm

# Now let's install the packages.
rpm-ostree install /tmp/warp.rpm

# And then we do the hacky dance!
mv /var/opt/warpdotdev /usr/lib/warpdotdev # move this over here

# Register path symlink
# We do this via tmpfiles.d so that it is created by the live system.
cat >/usr/lib/tmpfiles.d/warp.conf <<EOF
L  /opt/warpdotdev  -  -  -  -  /usr/lib/warpdotdev
EOF