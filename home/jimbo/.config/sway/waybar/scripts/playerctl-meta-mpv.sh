#!/usr/bin/env bash

# Acquire metadata of MPV's actively playing media
get_metadata() {
  playerctl --player=mpv metadata 2>/dev/null \
  | awk '/title/{gsub(/\.(mp3|mp4|m4a|mov|flac|opus|oga)$/,""); for (i=3; i<NF; i++) printf $i " "; printf $NF "\n"}' 
}

# Truncate it down to 30 characters
truncate_string() {
  local str="$1"
  local max_length=30
  if [ ${#str} -gt $max_length ]; then
      str="${str:0:$max_length}..."
  fi
  echo "$str"
}

# Display the song title or full playing name if playing
if playerctl --player=mpv status 2>/dev/null | grep -q Playing; then
  song_name=$(get_metadata | awk -F ' - ' '{print $2}')
  if [ -z "$song_name" ]; then
      song_name=$(get_metadata)
  fi
  echo "{\"text\":\"$(truncate_string "  $song_name")\",\"tooltip\":\"$(get_metadata)\"}"

# Display the artist or full playing name if paused
elif playerctl --player=mpv status 2>/dev/null | grep -q Paused; then
  artist_name=$(get_metadata | awk -F ' - ' '{print $1}')
  if [ -z "$artist_name" ]; then
      artist_name=$(get_metadata)
  fi
  echo "{\"text\":\"$(truncate_string "  $artist_name")\",\"tooltip\":\"$(get_metadata)\",\"class\":\"paused\"}"
fi
