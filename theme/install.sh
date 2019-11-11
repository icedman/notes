#!/bin/sh

set +x
glib-compile-resources gnome-shell-theme.gresource.xml
sudo cp ./gnome-shell-theme.gresource /usr/share/gnome-shell/