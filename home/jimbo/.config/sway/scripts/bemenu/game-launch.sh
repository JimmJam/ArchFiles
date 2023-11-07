#!/usr/bin/env bash
RET=$(echo -e "Prism\nBedrock\nMineOnline\nMineTest\nVeloren\nRuneLite" | eval "$bmen" Games)

case $RET in
  Prism) prismlauncher ;;
  MineTest) minetest ;;
  Veloren) airshipper run ;;
  RuneLite) runelite
esac
