#!/bin/bash
set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
config_file="$script_dir/../config/weather.conf"
source "$config_file"
echo "location: $latitude, $longitude"

base_url="https://api.open-meteo.com/v1/forecast"
query="latitude=$latitude"
query="$query&longitude=$longitude"
query="$query&current=temperature_2m"
query="$query,relative_humidity_2m"
query="$query,precipitation"
query="$query&timezone=auto"


echo "$query"

url="$base_url?$query"
echo "$url"

response="$(curl -s "$url")"
echo "$response" | jq '.'
echo "$response" | jq '.current.temperature_2m'


temperature="$(echo "$response" | jq ' .current.temperature_2m')"
echo "current temperature: ${temperature}°C"
time="$(echo "$response" | jq -r ' .current.time')"
echo "$time"

formatted_time="$(date -j -f "%Y-%m-%dT%H:%M" "$time" "+%B %d, %I:%M %p")"

humidity="$(echo "$response" | jq ' .current.relative_humidity_2m')"
echo "current humidity: ${humidity}%"

precipitation="$(echo "$response" | jq ' .current.precipitation')"
echo "current precipitation: ${precipitation}mm"

message="Good morning.

Current temperature is ${temperature} degrees Celsius.

Current time is ${formatted_time}.

Current humidity is ${humidity} percent.

Current precipitation is ${precipitation} millimeters."

echo "$message"

say "$message"



