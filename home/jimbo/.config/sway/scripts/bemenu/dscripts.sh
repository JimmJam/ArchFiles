#!/usr/bin/env bash
RET=$(echo -e "Configs\nLogout\nScratchpads\nVideos\nGames\nProduction-Launch\ndscripts" | eval "$bmen" BeScripts)

case $RET in
  Configs) kitty -o font_size=15 nvim ~/.config/sway/scripts/bemenu/config-files.sh ;;
  Logout) kitty -o font_size=15 nvim ~/.config/sway/scripts/bemenu/logout.sh ;;
  Scratchpads) kitty -o font_size=15 nvim ~/.config/sway/scripts/bemenu/scratchpads.sh ;;
  Videos) kitty -o font_size=15 nvim ~/.config/sway/scripts/bemenu/videos.sh ;;
  Games) kitty -o font_size=15 nvim ~/.config/sway/scripts/bemenu/game-launch.sh ;;
  Production-Launch) kitty -o font_size=15 nvim ~/.config/sway/scripts/bemenu/productionlaunch.sh ;;
  dscripts) kitty -o font_size=15 nvim ~/.config/sway/scripts/bemenu/dscripts.sh ;;
esac
