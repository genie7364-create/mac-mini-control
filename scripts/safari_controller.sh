#!/bin/bash
set -euo pipefail

# Get the directory of the current script.  $0 is the path to the script being executed, and dirname extracts the directory part of that path. The cd command changes to that directory, and pwd prints the absolute path of the current directory. This ensures that we have the correct path to the script regardless of where it is called from.
script_dir="$(cd "$(dirname "$0")" && pwd)"
# Run the open_safari.sh script 
echo "starting morning automation..."
# set the target URL to the first argument passed to the script, or use a default URL if no argument is provided. The "${1:-default_value}" syntax means "use the first argument if it exists; otherwise, use 'default_value'".
target_url="${1:-https://missav123.com/dm298/en/today-hot}"
"$script_dir/open_safari.sh" "$target_url"
echo "morning automation complete."

genre="${2:-tit_job}"
# Run the AppleScript to automate Safari with the specified URL and genre. The osascript command is used to execute AppleScript scripts from the command line. It takes the path to the AppleScript file and any additional arguments that the script requires.
osascript "$script_dir/browser_automation.scpt" "$target_url" "$genre"
