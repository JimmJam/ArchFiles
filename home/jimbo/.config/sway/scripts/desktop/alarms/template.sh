#!/usr/bin/env bash
echo $0
if [ "$0" = "/home/jimbo/.config/sway/scripts/desktop/alarms/template.sh" ]; then
  pkill -f 'mpv.*alarm' 
  pkill swaynag
else
  sound() { mpv --volume=90 $alarmfolder/Alarm.oga; }
  popup() { swaynag \
    --message "$name" \
    --button "Stop Alarm" $alarmfolder/template.sh \
    --font Ubuntu 12 --background ${darkcol#\#} \
    --border ${primecol#\#} \
    --button-border-size 3 \
    --button-background ${darkcol#\#} \
    --border-bottom ${primecol#\#} \
    --text ${realwhite#\#} \
    --button-text ${realwhite#\#}
  }
fi
