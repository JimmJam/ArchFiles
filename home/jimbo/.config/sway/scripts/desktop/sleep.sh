#!/usr/bin/env bash
exec swayidle -w \
timeout 1 '~/.config/sway/scripts/desktop/lock.sh; swaymsg "output * dpms off"' \
resume 'swaymsg "output * dpms on"; pkill -9 swayidle'
