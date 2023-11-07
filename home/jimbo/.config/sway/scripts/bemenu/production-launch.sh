#!/usr/bin/env bash
RET=$(echo -e "OBS\nKrita\nKdenlive\nAudacity" | eval "$bmen" Production)

case $RET in
  OBS) obs ;;
  Krita) krita;;
  Kdenlive) kdenlive ;;
  Audacity) audacity ;;
esac
