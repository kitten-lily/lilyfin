#!/usr/bin/env bash

set -ouex pipefail

echo "Installing Zed"

wget https://zed.dev/api/releases/stable/latest/zed-linux-x86_64.tar.gz -O /tmp/zed.tar.gz

tar -xvf /tmp/zed.tar.gz -C /tmp
mv /tmp/zed.app /usr/lib

ln -sf /usr/lib/zed.app/bin/zed /usr/bin/zed
