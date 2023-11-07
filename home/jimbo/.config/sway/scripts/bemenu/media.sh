#!/usr/bin/env bash
RET=$(echo -e "YouTube\nMusic\nHistory\nAnime" | eval "$bmen" Media)

case $RET in
  YouTube) ytfzf -D ;;
  Music ) ytfzf -D -m ;;
  History) kitty ytfzf -H ;;
  Anime) kitty ani-cli -q 720 ;;
esac
