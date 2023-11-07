#!/usr/bin/env bash
RET=$(echo -e "Sway\nHotkeys\nRules\nTheming\nHardware\nWorkspaces\nStart\nPrograms\nVariables\nWaybar\nWaybar-Style\nHotkey-Remind\nRanger\nAlarms\nResolution\nKitty\nRofi\nFull-Update\nScreenshots\nCleanup\nFolder\nZshrc\ndscripts" | eval "$bmen" Configs)

case $RET in
  Sway) kitty -o font_size=15 nvim ~/.config/sway/config ;;
  Hotkeys) kitty -o font_size=15 nvim ~/.config/sway/hotkeys ;;
  Rules) kitty -o font_size=15 nvim ~/.config/sway/rules ;;
  Theming) kitty -o font_size=15 nvim ~/.config/sway/theme ;;
  Hardware) kitty -o font_size=15 nvim ~/.config/sway/hardware ;;
  Workspaces) kitty -o font_size=15 nvim ~/.config/sway/workspaces ;;
  Start) kitty -o font_size=15 nvim ~/.config/sway/start.sh ;;
  Programs) kitty -o font_size=15 nvim ~/.config/sway/programs ;;
  Variables) kitty -o font_size=15 nvim ~/.config/sway/variables ;;
  Waybar) kitty -o font_size=15 nvim ~/.config/sway/waybar/config ;;
  Waybar-Style) kitty -o font_size=15 nvim ~/.config/sway/waybar/style.css ;;
  Hotkey-Remind) kitty -o font_size=15 nvim ~/.config/sway/scripts/desktop/hotkey-reminders.sh ;;
  Ranger) kitty -o font_size=15 nvim ~/.config/ranger/rifle.conf ;;
  Alarms) kitty -o font_size=15 ranger ~/.config/sway/scripts/desktop/alarms/ ;;
  Resolution) kitty -o font_size=15 nvim ~/.config/sway/scripts/bemenu/resolution.sh ;;
  Kitty) kitty -o font_size=15 nvim ~/.config/kitty/kitty.conf ;;
  Rofi) kitty -o font_size=15 nvim ~/.config/rofi/purple.rasi ;;
  Full-Update) kitty -o font_size=15 nvim ~/.config/sway/scripts/tools/full-update.sh ;;
  Screenshots) exec ~/.config/sway/scripts/bemenu/screenshots.sh ;;
  Cleanup) kitty -o font_size=15 nvim ~/.config/sway/scripts/tools/cleanup.sh ;;
  Folder) kitty -o font_size=15 ranger ~/.config/sway/ ;;
  Zshrc) kitty -o font_size=15 nvim ~/.zshrc ;;
  dscripts) exec ~/.config/sway/scripts/bemenu/dscripts.sh ;;
esac
