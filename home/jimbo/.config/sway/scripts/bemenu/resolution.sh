#!/usr/bin/env bash
RET=$(echo -e "Default\nWide\nGPU2" | eval "$bmen" Resolution)

case $RET in
  Default) swaymsg reload ;;
  Wide) swaymsg "output HDMI-A-1 enable pos 1680 0 mode 1680x1050@59.954Hz
  	output DP-3 enable pos 3360 0 transform 0
  	output DP-2 enable pos 0 0 mode 1680x1050@59.954Hz" ;;
  GPU2) swaymsg "output HDMI-A-1 enable pos 1680 110 mode 1920x1080@60Hz
  	output DP-1 enable pos 0 0 transform 0" ;;
esac
