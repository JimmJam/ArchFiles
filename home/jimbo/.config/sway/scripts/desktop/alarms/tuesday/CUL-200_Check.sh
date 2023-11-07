#!/usr/bin/env bash
source $alarmfolder/template.sh
name="$(basename "$0" | sed 's/_/ /g; s/\..*//')"
sound &
popup
