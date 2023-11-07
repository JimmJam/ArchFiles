#!/usr/bin/env bash
RET=$(echo -e "Shutdown\nReboot\nSleep\nLock\nKill" | eval "$bmen" Power)

case $RET in
  Shutdown) shutdown now ;;
  Reboot) reboot ;;
  Sleep) ~/.config/sway/scripts/desktop/sleep.sh & ;;
  Lock) ~/.config/sway/scripts/desktop/lock.sh & ;;
  Kill) pkill -9 sway ;;
esac
