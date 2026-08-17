#!/bin/bash

script_dir="$(cd "$(dirname "$0")" && pwd)"
task="${1:-all}"
echo "$task"

if [ "$task" = "weather" ]; then "$script_dir/weather_briefing.sh"
fi

if [ "$task" = "safari" ]; then "$script_dir/safari_contoller.sh"
fi

if [ "$task" = "all" ]; then "$script_dir/weather_briefing.sh" && "$script_dir/safari_controller.sh"
fi






