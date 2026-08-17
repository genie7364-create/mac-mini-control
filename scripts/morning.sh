#!/bin/bash

script_dir="$(cd "$(dirname "$0")" && pwd)"
"$script_dir/weather_briefing.sh" && "$script_dir/safari_controller.sh"
echo "Weather briefing and Safari controller executed successfully."




