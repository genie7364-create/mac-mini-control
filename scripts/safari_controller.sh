#!/bin/bash
set -euo pipefail

# Get the directory of the current script.  $0 is the path to the script being executed, and dirname extracts the directory part of that path. The cd command changes to that directory, and pwd prints the absolute path of the current directory. This ensures that we have the correct path to the script regardless of where it is called from.
script_dir="$(cd "$(dirname "$0")" && pwd)"
# Run the open_safari.sh script 
echo "starting morning automation..."
# bash executes the open_safari.sh script located in the same directory as this script. The "$script_dir" variable ensures that we are calling the correct script regardless of the current working directory.
"$script_dir/open_safari.sh"
echo "morning automation complete.








