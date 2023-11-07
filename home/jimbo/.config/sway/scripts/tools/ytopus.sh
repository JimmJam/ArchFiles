#!/usr/bin/env bash

# Check if an argument (URL) was provided
if [ $# -eq 0 ]; then
  echo "No URL provided. Usage: $0 <URL>"
  exit 1
fi

# Store the URL argument
url=$1

# Use yt-dlp to download the URL
yt-dlp "$url"

# Take the downloaded video as a variable
video=$(ls --color=never *.webm)

# Rewrite the name
name=$(echo "$video" | awk -F ' \\[.*\\]\\.' '{print $1"."$2}' | sed 's/\.webm$/.opus/')

# Re-encode as opus and make sure it reflects the current date
ffmpeg -i "$video" -c:a libopus "$name"
touch "$name"

# Remove the .webm
rm "$video"
