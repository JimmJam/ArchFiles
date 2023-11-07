#!/usr/bin/env bash

while true; do
  # Check the current day and time
  current_day=$(date +"%A")
  current_time=$(date +'%l:%M%p' | sed 's/^ //')
  
  # Monday alarms
  if [ "$current_day" == "Monday" ] && [ "$current_time" == "11:39AM" ]; then
      $alarmfolder/monday/OPS-345_Online.sh
  fi
  if [ "$current_day" == "Monday" ] && [ "$current_time" == "1:25PM" ]; then
      $alarmfolder/monday/MST-200_Online.sh
  fi
  if [ "$current_day" == "Monday" ] && [ "$current_time" == "3:15PM" ]; then
      $alarmfolder/monday/DAT-330_Online.sh
  fi
  
  # Tuesday alarms
  if [ "$current_day" == "Tuesday" ] && [ "$current_time" == "10:40AM" ]; then
      $alarmfolder/tuesday/CUL-200_Check.sh
  fi
  
  # Thursday alarms
  if [ "$current_day" == "Thursday" ] && [ "$current_time" == "11:20AM" ]; then
      $alarmfolder/thursday/MST-200_Physical.sh
  fi
  
  # Run the script at 8 AM on Friday
  if [ "$current_day" == "Friday" ] && [ "$current_time" == "08:00AM" ]; then
      $alarmfolder/friday/OPS-345_Physical.sh
  fi
  
  sleep 60
done
