#!/usr/bin/env bash

# Clock long, with a numeric date and military time tooltip

time=$(date +'%a %b %d %l:%M:%S%p' | tr -s ' ')
date=$(date "+%Y-%m-%d")

echo "{\"text\":\"  $time\",\"tooltip\":\"$date\"}"
