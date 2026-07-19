#!/bin/bash
set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"

echo "starting morning automation..."

target_url="${1:-https://youtube.com}"
"$script_dir/open_safari.sh" "$target_url"


searchquery="${2:-4k fancam}"

osascript "$script_dir/browser_automation.scpt" "$target_url" "$searchquery"
echo "morning automation complete."