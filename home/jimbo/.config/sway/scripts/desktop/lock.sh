#!/usr/bin/env bash
BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#8800FFFF'
TEXT='#ffffffff'
WRONG='#680082ff'
VERIFYING='#3a0580ff'

swaylock -f -e \
--key-hl-color=$VERIFYING \
--bs-hl-color=$WRONG \
\
--ring-clear-color=$CLEAR \
--ring-ver-color=$VERIFYING \
--ring-wrong-color=$WRONG \
--ring-color=$DEFAULT \
--ring-clear-color=$VERIFYING \
\
--inside-color=$CLEAR \
--inside-ver-color=$CLEAR \
--inside-wrong-color=$CLEAR \
--inside-clear-color=$CLEAR \
\
--text-color=$TEXT \
--text-clear-color=$TEXT \
--text-ver-color=$TEXT \
--text-caps-lock-color=$TEXT \
--text-wrong-color=$TEXT \
\
--indicator \
--indicator-radius=80 \
--image=~/Pictures/Wallpapers/VMs\ Wallpaper.png \
--clock \
--font=Ubuntu \
--font-size=30 \
--timestr="%I:%M%p" \
--datestr="%a %b %d %Y" \
#--effect-blur=5x2
