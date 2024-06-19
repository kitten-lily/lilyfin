#!/usr/bin/bash

set -ouex pipefail

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FantasqueSansMono.zip -O /tmp/FantasqueSansMono.zip
mkdir /usr/share/fonts/FantasqueSansMono
unzip /tmp/FantasqueSansMono.zip -x OFL.txt README.md -d /usr/share/fonts/FantasqueSansMono/
fc-cache -f /usr/share/fonts/FantasqueSansMono