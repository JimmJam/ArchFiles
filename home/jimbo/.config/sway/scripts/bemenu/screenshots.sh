#!/usr/bin/env bash
RET=$(echo -e "Swappyshot\nCurrentshot\nCopyshot" | eval "$bmen" Screenshots)

case $RET in
  Swappyshot) kitty -o font_size=15 nvim ~/.config/sway/scripts/desktop/screenshot/swappy.sh ;;
  Currentshot) kitty -o font_size=15 nvim ~/.config/sway/scripts/desktop/screenshot/copy-screen.sh ;;
  Copyshot) kitty -o font_size=15 nvim ~/.config/sway/scripts/desktop/screenshot/copy-select.sh
esac
