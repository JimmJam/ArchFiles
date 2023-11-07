#!/usr/bin/env bash
RET=$(echo -e "Gotop\nMusic\nPavuControl\nEasyEffects" | eval "$bmen" Scratchpads)

case $RET in
  Gotop) kitty --class=gotop -o font_size=14 gotop ;;
  Music) kitty --class=music -o font_size=14 ranger ;;
  PavuControl) pavucontrol ;;
  EasyEffects) easyeffects ;;
esac
