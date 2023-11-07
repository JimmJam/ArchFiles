#!/usr/bin/env bash

# Define variables
CITY="Maple"
API_KEY="18be8db3528f08c33ed9f95698335ea7"

# Fetch weather data
weather_data=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=$CITY&appid=$API_KEY")
weather_condition=$(echo $weather_data | jq -r '.weather[0].main')

# Map weather conditions to emojis
case "$weather_condition" in
  "Clear") emoji="☀️";;
  "Clouds") emoji="☁️";;
  "Rain") emoji="🌧️";;
  "Drizzle") emoji="🌦️";;
  "Thunderstorm") emoji="⛈️";;
  "Snow") emoji="❄️";;
  "Mist"|"Fog"|"Haze") emoji="🌫️";;
  *) emoji="🌍";; # Default emoji for unknown conditions
esac

# Extract and format temperature in Celsius
temperature_kelvin=$(echo $weather_data | jq -r '.main.temp')
temperature_celsius=$(echo "$temperature_kelvin - 273.15" | bc)
formatted_temperature=$(printf "%.0f" $temperature_celsius)

# Display weather emoji and temperature
echo {\"text\":\"$emoji $formatted_temperature°C\",\"tooltip\":\"Weather in Maple: $weather_condition\"}
