#!/usr/bin/env bash

# Clean up the applications folder
sudo bash -c 'cd /usr/share/applications
rm libreoffice-{base,calc,draw,impress,math,writer,xsltfilter}*
rm pcmanfm-qt-desktop*
rm scrcpy-console*
rm *lsp_plugins*
rm *firewall*
rm hp-uiscan*
rm wl-color-*
rm designer*
rm *cockpit*
rm *wdispl*
rm stoken*
rm lstopo*
rm ranger*
rm sunshi*
rm pavuc*
rm *java*
rm avahi*
rm hplip*
rm rofi*
rm wine*
rm htop*
rm bssh*
rm bvnc*
rm cmst*
rm cups*
rm qv*'
