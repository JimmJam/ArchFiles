external_menu () {
  bemenu --fn "Ubuntu 13" --nb "$darkcol" --ab "$darkcol" --tb "$primecol" --fb "$darkcol" --tf "#ffffff" --hf "#ffffff" --hb "$primecol" -l 30 -s -p "Search:"
}

video_player () {
  mpv --loop-playlist=no --keep-open=yes "$@"
}
